//
//  DetailVocabularyViewModel.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 21/06/2024.
//

import Foundation

class DetailVocabularyViewModel: ObservableObject {
    @Published var statePlaySound = false
    @Published var soundManager = SoundManager()
    
    func handleSound(sound: String ) {
        soundManager.playSound(sound: sound)
        statePlaySound.toggle()
        if statePlaySound{
            soundManager.audioPlayer?.play()
        } else {
            soundManager.audioPlayer?.pause()
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
            self.statePlaySound.toggle()
        }
    }
}
