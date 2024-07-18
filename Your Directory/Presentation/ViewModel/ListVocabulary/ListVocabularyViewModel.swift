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
    @Published var isLoading = false
    @Published var vocabulary: Vocabulary?
    
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
    
    func getVocabularys() {
        isLoading = true
        FirestoreManager.fetchData(
            collection: AppConstants.vocabularysCollection
        ) {
            (vocabularys: [Vocabulary]?, error) in
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                guard let vocabularys = vocabularys else {
                    return
                }
                self.vocabularys = vocabularys.sorted(by: { vocab1, vocab2 -> Bool in
                    guard let date1 = vocab1.publishDate, let date2 = vocab2.publishDate else {
                        return false
                    }
                    return date1 > date2
                })
            }
            DispatchQueue.main.asyncAfterUnsafe(deadline: .now() + 5) {
                self.isLoading = false
            }
        }
    }
}
