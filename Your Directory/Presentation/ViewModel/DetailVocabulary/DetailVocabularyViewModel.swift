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

    func handleVocabulary(
        vocabulary: Vocabulary?,
        typeOfHandle: EventType,
        note: String,
        folder: Folder,
        completion: @escaping (Status, String, Vocabulary?) -> Void
    ) {
        guard let vocabulary = vocabulary else { return }
        var newVocabulary = vocabulary
        newVocabulary.vocabularyNote = note
        newVocabulary.folderId = folder.id
        switch typeOfHandle {
        case .add:
            FirestoreManager.addData(
                collection: AppConstants.vocabularysCollection,
                document: newVocabulary.word,
                data: newVocabulary
            ) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                    completion(.fail, "Pùn!!! Không thể thêm vocabulary", nil)
                } else {
                    let dateFormatter = ISO8601DateFormatter()
                    newVocabulary.isStudy = false
                    newVocabulary.publishAt = dateFormatter.string(from: Date())
                    completion(.success, "Thêm vocabulary thành công rồi nè, Hí!!!", newVocabulary)
                }
            }
        case .update:
            newVocabulary.vocabularyNote = note
            newVocabulary.folderId = folder.id
            newVocabulary.isStudy = !newVocabulary.isStudy
            FirestoreManager.updateData(
                collection: AppConstants.vocabularysCollection,
                document: newVocabulary.word,
                data: newVocabulary) { error in
                    if let error = error {
                        print("Error update document: \(error)")
                        completion(.fail, "Pùn!!! Không thể thêm vocabulary", nil)
                    } else {
                        completion(
                            .success,
                            "Update vocabulary thành công rồi nè, Hí!!!",
                            newVocabulary
                        )
                    }
                }
        }
    }

    func deleteVocabulary(
        vocabulary: Vocabulary?,
        completion: @escaping (Status, String) -> Void
    ) {
        guard let vocabulary = vocabulary else { return }
        FirestoreManager.deleteData(
            collection: AppConstants.vocabularysCollection,
            document: vocabulary.word
        ) { error in
            if let error = error {
                print("Error delete document: \(error)")
                completion(.fail, "Pùn!!! Không thể xóa vocabulary")
            } else {
                completion(.success, "Xóa vocabulary thành công rồi nè, Hí!!!")
            }
        }
    }

    func favoriteVocabulary(
        vocabulary: Vocabulary?,
        completion: @escaping (Status, String, Vocabulary?) -> Void
    ) {
        guard let vocabulary = vocabulary else { return }
        var newVocabulary = vocabulary
        newVocabulary.isFavorite = !vocabulary.isFavorite
        FirestoreManager.updateData(
            collection: AppConstants.vocabularysCollection,
            document: newVocabulary.word,
            data: newVocabulary) { error in
                if let error = error {
                    print("Error update document: \(error)")
                    completion(.fail, "Pùn!!! Không thể yêu thích từ vựng", nil)
                } else {
                    completion(
                        .success,
                        "Yêu thích từ vựng thành công rồi nè, Hí!!!",
                        newVocabulary
                    )
                }
            }
    }
}
