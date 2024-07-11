//
//  DetailFolderViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 11/07/2024.
//

import Foundation

class DetailFolderViewModel: ObservableObject {
    @Published var statePlaySound = false
    @Published var vocabularys = [Vocabulary]()


    func getVocabulary(vocabularys: [Vocabulary], folderId: UUID) {
        print("==> folderId \(folderId)")
        self.vocabularys = vocabularys.filter { vocabulary in
            print("==> vocabulary.folder?.id \(vocabulary.folder?.id)")
            print("==> vocabulary.folder?.name \(vocabulary.folder?.name)")
            return vocabulary.folder?.id == folderId
        }
    }

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
