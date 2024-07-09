//
//  FirestoreManager.swift
//  Your Directory
//
//  Created by LuanNT29 on 04/07/2024.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirestoreManager {
    private let db = Firestore.firestore()

    func addData<T: Encodable>(
        collection: String,
        document: String,
        data: T,
        completion: @escaping (Error?) -> Void
    ) {
        guard let user = Auth.auth().currentUser else {
            completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not signed in"]))
            return
        }

        do {
            let jsonData = try JSONEncoder().encode(data)
            guard let dictionary = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] else {
                completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert data to dictionary"]))
                return
            }
            db
                .collection("users")
                .document(user.uid)
                .collection(collection)
                .document(document)
                .setData(dictionary) { error in
                    completion(error)
                }
        } catch {
            completion(error)
        }
    }

    func fetchData<T: Decodable>(
        collection: String,
        completion: @escaping ([T]?, Error?) -> Void
    ) {
        guard let user = Auth.auth().currentUser else {
            completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not signed in"]))
            return
        }

        let collectionRef = db.collection("users").document(user.uid).collection(collection)
            collectionRef.getDocuments { snapshot, error in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let documents = snapshot?.documents else {
                completion(nil, NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "No documents found"]))
                return
            }

            do {
                let data = try documents.map { document in
                    try document.data(as: T.self)
                }
                completion(data, nil)
            } catch {
                print("==> Error decoding documents: \(error.localizedDescription)")
                completion(nil, error)
            }
        }
    }

//    func deleteData(
//        collectionPath: String,
//        document: String,
//        completion: @escaping (T?, Error?) -> Void
//    ) {
//        guard let user = Auth.auth().currentUser else {
//            completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "User not signed in"]))
//            return
//        }
//
//        db.collection(collection).document(user.uid).delete { error in
//            completion(error)
//        }
//    }
}
