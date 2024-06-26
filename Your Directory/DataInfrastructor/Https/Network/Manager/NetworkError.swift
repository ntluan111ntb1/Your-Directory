//
//  NetworkError.swift
//  Your Directory
//
//  Created by LuanNT29 on 21/06/2024.
//

import Foundation

public struct NetworkError: Error {
    let status: Int
    let message: String
}
