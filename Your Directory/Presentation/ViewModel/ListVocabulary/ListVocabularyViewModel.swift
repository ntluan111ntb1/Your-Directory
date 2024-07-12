//
//  ListVocabularyViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 12/07/2024.
//

import Foundation

class ListVocabularyViewModel: ObservableObject {
    @Published var statePlaySound = false
    @Published var vocabularys = [Vocabulary]()

    func handleSound(sound: String ) {
        SoundManager.shared.playSound(sound: sound)
        statePlaySound.toggle()
        if statePlaySound {
            SoundManager.shared.audioPlayer?.play()
        } else {
            SoundManager.shared.audioPlayer?.pause()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) { [weak self] in
            guard let self else { return }
            self.statePlaySound.toggle()
        }
    }
}
