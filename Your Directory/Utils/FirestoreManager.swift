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

    static func makeDataBaseOfUser() -> DocumentReference? {
        guard let user = Auth.auth().currentUser else {
            print("Error: User not loggin")
            return nil
        }
        return Firestore.firestore().collection("users").document(user.uid)
    }

    static func addData<T: Encodable>(
        collection: String,
        document: String,
        data: T,
        completion: @escaping (Error?) -> Void
    ) {
        guard let userDb = makeDataBaseOfUser() else {
            return
        }
        do {
            let jsonData = try JSONEncoder().encode(data)
            guard let dictionary = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] else {
                completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert data to dictionary"]))
                return
            }
            userDb
                .collection(collection)
                .document(document)
                .setData(dictionary) { error in
                    completion(error)
                }
        } catch {
            completion(error)
        }
    }

    static func updateData<T: Encodable>(
        collection: String,
        document: String,
        data: T,
        completion: @escaping (Error?) -> Void
    ) {
        guard let userDb = makeDataBaseOfUser() else {
            return
        }
        do {
            let jsonData = try JSONEncoder().encode(data)
            guard let dictionary = try JSONSerialization.jsonObject(with: jsonData, options: .allowFragments) as? [String: Any] else {
                completion(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert data to dictionary"]))
                return
            }
            userDb.collection(collection).document(document).updateData(dictionary) { error in
                completion(error)
            }
        } catch {
            completion(error)
        }
    }

    static func fetchData<T: Decodable>(
        collection: String,
        completion: @escaping ([T]?, Error?) -> Void
    ) {
        guard let userDb = makeDataBaseOfUser() else {
            return
        }
        userDb.collection(collection).getDocuments { snapshot, error in
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

    static func deleteData(
        collection: String,
        document: String,
        completion: @escaping (Error?) -> Void
    ) {
        guard let userDb = makeDataBaseOfUser() else {
            return
        }
        userDb.collection(collection).document(document).delete { error in
            completion(error)
        }
    }
}
