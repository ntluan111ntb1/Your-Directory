//
//  SetDataLocal.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import Foundation

class SetDataLocal {
    func setData<T: Codable>(key: String, object: T) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(object) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}
