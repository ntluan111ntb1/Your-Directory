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
        Folder(name: "Hihihi", color: "FFE9D0", publishAt: ""),
        Folder(name: "Danh Từ", color: "FFFED3", publishAt: ""),
        Folder(name: "Động từ", color: "BBE9FF", publishAt: ""),
        Folder(name: "Trạng từ", color: "B1AFFF", publishAt: ""),
    ]
    @Published var vocabulary: Vocabulary?
    @Published var statePlaySound = false
    @Published var selectedFolder = Folder(name: "", color: "", publishAt: "")

    let firestoreManager = FirestoreManager()

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
                self.folders = folders.sorted(by: { folder1, folder2 -> Bool in
                    guard let date1 = folder1.publishDate, let date2 = folder2.publishDate else {
                        return false
                    }
                    return date1 > date2
                })
            }
        }
    }

    func addFolder(folderName: String, folderColor: String, completion: @escaping (Status, String) -> Void) {
        let dateFormatter = ISO8601DateFormatter()
        let folderTerm = Folder(name: folderName, color: folderColor, publishAt: dateFormatter.string(from: Date()))
        firestoreManager.addData(
            collection: AppConstants.foldersCollection,
            document: folderName,
            data: folderTerm
        ) { error in
            if let error = error {
                print("Error adding document: \(error)")
                completion(.fail, "Pùn!!! Không thể thêm folder")
            } else {
                self.folders.insert(folderTerm, at: 0)
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
                self.vocabularys = vocabularys.sorted(by: { vocab1, vocab2 -> Bool in
                    guard let date1 = vocab1.publishDate, let date2 = vocab2.publishDate else {
                        return false
                    }
                    return date1 > date2
                })
            }
        }
    }

    func addVocabulary(
        note: String,
        folder: Folder,
        completion: @escaping (Status, String) -> Void
    ) {
        guard var vocabulary = vocabulary else { return }
        vocabulary.vocabularyNote = note
        vocabulary.folder = folder
        let dateFormatter = ISO8601DateFormatter()
        vocabulary.publishAt = dateFormatter.string(from: Date())
        firestoreManager.addData(
            collection: AppConstants.vocabularysCollection,
            document: vocabulary.word,
            data: vocabulary
        ) { error in
            if let error = error {
                print("Error adding document: \(error)")
                completion(.fail, "Pùn!!! Không thể thêm vocabulary")
            } else {
                self.vocabularys.insert(vocabulary, at: 0)
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
