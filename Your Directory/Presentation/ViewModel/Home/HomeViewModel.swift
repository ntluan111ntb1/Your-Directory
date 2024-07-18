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

    @Published var folders = [
        Folder(name: "Hihihi", color: "FFE9D0", publishAt: ""),
        Folder(name: "Danh Từ", color: "FFFED3", publishAt: ""),
        Folder(name: "Động từ", color: "BBE9FF", publishAt: ""),
        Folder(name: "Trạng từ", color: "B1AFFF", publishAt: ""),
    ]
    
    @Published var vocabulary: Vocabulary?
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
}


