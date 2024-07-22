//
//  ListVocabularyView.swift
//  Your Directory
//
//  Created by LuanNT29 on 12/07/2024.
//

import SwiftUI

struct ListVocabularyView: View {
    @StateObject var viewModel = ListVocabularyViewModel()

    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    let vocabularies: [Vocabulary]
    let folders: [Folder]
    let tapHandle: (Vocabulary) -> Void
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: layout) {
                ForEach(vocabularies, id: \.id) { vocabulary in
                    VocabularyCardView(
                        vocabulary: vocabulary,
                        folder: viewModel.getFolder(folders: folders, folderId: vocabulary.folderId ?? UUID()) ?? Folder(name: "", color: "", publishAt: ""),
                        tapHandle: { tapHandle(vocabulary) },
                        playSound: { viewModel.handleSound(sound: vocabulary.audio) }
                    )
                }
            }
            .padding(.horizontal)
        }
        .refreshable {
            print("refresh")
        }
    }
}

#Preview {
    ListVocabularyView(vocabularies: AppConstants.mockVocabularies, folders: AppConstants.mockFolders) { _ in

    }
}
