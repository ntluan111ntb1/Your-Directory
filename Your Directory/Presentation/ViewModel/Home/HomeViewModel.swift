//
//  HomeViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    private var disposables = Set<AnyCancellable>()
    
    @Published var vocabulary: Vocabulary?
    @Published var randomWords: Vocabulary?
    @Published var statePlaySound = false
    @Published var selectedFolder = Folder(name: "", color: "", publishAt: "")

    func handleVocabularyResponse(_ response: Vocabulary) -> AnyPublisher<(Vocabulary, String?), Never> {
        VietNameseHttp.getVietNamese(word: response.word)
            .map { vietnameseResponse -> (Vocabulary, String?) in
                let vietnamese = vietnameseResponse.sentences.first?.trans
                return (response, vietnamese)
            }
            .catch { _ in Just((response, nil)) }
            .eraseToAnyPublisher()
    }

    func searchVocabulary(word: String) {
        DirectionHttp.getVocabulary(vocabulary: word)
            .receive(on: DispatchQueue.main)
            .flatMap { response in
                self.handleVocabularyResponse(response)
            }
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("==> error: \(error)")
                }
            } receiveValue: { [self] (vocabulary, vietnamese) in
                self.vocabulary = vocabulary
                self.vocabulary?.vocabularyNote = vietnamese
            }
            .store(in: &disposables)
    }

    func getRandomWords() {
        RandomWordsHttp.getRandomWords()
            .receive(on: DispatchQueue.main)
            .flatMap { response in
                DirectionHttp.getVocabulary(vocabulary: response.word)
                    .flatMap { self.handleVocabularyResponse($0) }
            }
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error). Retrying...")
                    self.getRandomWords()
                }
            } receiveValue: { [self] (vocabulary, vietnamese) in
                randomWords = vocabulary
                randomWords?.vocabularyNote = vietnamese
            }
            .store(in: &disposables)
    }


    func handleSound(sound: String ) {
        SoundManager.shared.playSound(sound: sound)
        statePlaySound.toggle()
        if statePlaySound {
            SoundManager.shared.audioPlayer?.play()
        } else {
            SoundManager.shared.audioPlayer?.pause()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) { [weak self] in
            guard let self else { return }
            self.statePlaySound.toggle()
        }
    }

    func getFolder(folders: [Folder], folderId: UUID) -> Folder? {
        return folders.first { $0.id == folderId }
    }
}


