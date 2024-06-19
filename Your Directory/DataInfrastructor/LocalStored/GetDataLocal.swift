//
//  GetDataLocal.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import Foundation

class GetDataLocal {
    func getData<T: Codable>(key: String, objectType: T.Type) -> T? {
        if let savedData = UserDefaults.standard.data(forKey: key) {
            let decoder = JSONDecoder()
            if let decodedObject = try? decoder.decode(objectType, from: savedData) {
                return decodedObject
            }
        }
        return nil
    }
}
