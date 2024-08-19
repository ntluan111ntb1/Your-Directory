//
//  VietNamese.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/08/2024.
//

import Foundation

struct VietNamese {
    let sentences: [Sentences]
    let src: String
    
    struct Sentences {
        let trans: String
        let orig: String
        let backend: Int
    }
}
