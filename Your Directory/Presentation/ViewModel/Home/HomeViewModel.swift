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

    func searchVocabulary(word: String) {
        DirectionHttp.getVocabulary(vocabulary: word)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("==> error: \(error)")
                }
            } receiveValue: { [self] response in
                vocabulary = response
            }
            .store(in: &disposables)
    }

    func getRandomWords() {
        RandomWordsHttp.getRandomWords()
            .receive(on: DispatchQueue.main)
            .flatMap { response in
                DirectionHttp.getVocabulary(vocabulary: response.word)
            }
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error: \(error). Retrying...")
                    self.getRandomWords()
                }
            } receiveValue: { [self] vocabulary in
                randomWords = vocabulary
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


