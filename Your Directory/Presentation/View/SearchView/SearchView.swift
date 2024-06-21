//
//  SearchView.swift
//  Your Directory
//
//  Created by LuanNT29 on 21/06/2024.
//

import SwiftUI

struct SearchView: View {

    let searchVocabulary: Vocabulary

    var body: some View {
        VStack(alignment: .leading) {
            Text(searchVocabulary.word)
                .font(.largeTitle)
            Spacer()
        }
    }
}
