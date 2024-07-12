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

    @Published var vocabularys = AppConstants.mockVocabularies
    @Published var folders = [
        Folder(name: "Hihihi", color: "FFE9D0"),
        Folder(name: "Danh Từ", color: "FFFED3"),
        Folder(name: "Động từ", color: "BBE9FF"),
        Folder(name: "Trạng từ", color: "B1AFFF"),
    ]
    @Published var searchVocabulary: Vocabulary?
    @Published var statePlaySound = false
    @Published var selectedFolder = Folder(name: "", color: "")

    let firestoreManager = FirestoreManager()

    func searchVocabulary(vocabulary: String) {
        DirectionHttp.getVocabulary(vocabulary: vocabulary)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("==> error: \(error)")
                }
            } receiveValue: { [self] response in
                searchVocabulary = response
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
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            guard let self else { return }
            self.statePlaySound.toggle()
        }
    }
}

// Handle for folder
extension HomeViewModel {
    func getFolders() {
        firestoreManager.fetchData(
            collection: AppConstants.foldersCollection
        ) {
            (folders: [Folder]?, error) in
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                guard let folders = folders else {
                    return
                }
                self.folders = folders
            }
        }
    }

    func addFolder(folder: Folder, completion: @escaping (Status, String) -> Void) {
        firestoreManager.addData(
            collection: AppConstants.foldersCollection,
            document: folder.name,
            data: folder
        ) { error in
            if let error = error {
                print("Error adding document: \(error)")
                completion(.fail, "Pùn!!! Không thể thêm folder")
            } else {
                self.folders.append(folder)
                print("Document added successfully")
                completion(.success, "Thêm folder thành công rồi nè, Hí!!!")
            }
        }
    }

    func deleteFolder(folder: Folder, completion: @escaping (Status, String) -> Void) {
        firestoreManager.deleteData(
            collection: AppConstants.foldersCollection,
            document: folder.name
        ) { error in
            if let error = error {
                print("Error delete document: \(error)")
                completion(.fail, "Pùn!!! Không thể xóa folder")
            } else {
                if let index = self.folders.firstIndex(of: folder) {
                    self.folders.remove(at: index)
                    completion(.success, "Xóa folder thành công rồi nè, Hí!!!")
                } else {
                    print("Can not found \(folder.name)")
                    completion(.fail, "Ủa!!! Không tìm thấy \(folder.name)")
                }
                print("remove successfully")
            }

        }
    }
}

// Handle for vocabulary
extension HomeViewModel {
    func getVocabularys() {
        firestoreManager.fetchData(
            collection: AppConstants.vocabularysCollection
        ) {
            (vocabularys: [Vocabulary]?, error) in
            if let error = error {
                print("Error fetching data: \(error)")
            } else {
                guard let vocabularys = vocabularys else {
                    return
                }
                self.vocabularys = vocabularys
            }
        }
    }

    func addVocabulary(
        note: String,
        folder: Folder,
        completion: @escaping (Status, String) -> Void
    ) {
        guard var vocabulary = searchVocabulary else { return }
        vocabulary.vocabularyNote = note
        vocabulary.folder = folder
        firestoreManager.addData(
            collection: AppConstants.vocabularysCollection,
            document: vocabulary.word,
            data: vocabulary
        ) { error in
            if let error = error {
                print("Error adding document: \(error)")
                completion(.fail, "Pùn!!! Không thể thêm vocabulary")
            } else {
                self.vocabularys.append(vocabulary)
                completion(.success, "Thêm vocabulary thành công rồi nè, Hí!!!")
            }
        }
    }

    func deleteVocabulary(
        vocabulary: Vocabulary,
        completion: @escaping (Status, String) -> Void
    ) {
        firestoreManager.deleteData(
            collection: AppConstants.vocabularysCollection,
            document: vocabulary.word
        ) { error in
            if let error = error {
                print("Error delete document: \(error)")
                completion(.fail, "Pùn!!! Không thể xóa vocabulary")
            } else {
                if let index = self.vocabularys.firstIndex(of: vocabulary) {
                    self.vocabularys.remove(at: index)
                    print("remove successfully")
                    completion(.success, "Xóa vocabulary thành công rồi nè, Hí!!!")
                } else {
                    print("Can not found \(vocabulary.word)")
                    completion(.fail, "Ủa!!! Không tìm thấy \(vocabulary.word)")
                }
            }

        }
    }
}
