//
//  DetailVocabularyViewModel.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 21/06/2024.
//

import Foundation

class DetailVocabularyViewModel: ObservableObject {
    @Published var statePlaySound = false
    
    func handleSound(sound: String ) {
        SoundManager.shared.playSound(sound: sound)
        statePlaySound.toggle()
        if statePlaySound{
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
