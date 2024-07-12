//
//  CreateFolderView.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 22/06/2024.
//

import SwiftUI

struct DetailFolderView: View {
    @StateObject var viewModel = DetailFolderViewModel()
    @Binding var folder: Folder
    @State var selectedVocabulary: Vocabulary? = nil

    let vocabularys: [Vocabulary]
    
    let remove: () -> Void
    let layout = [
        GridItem(.flexible()),
        GridItem(.flexible()),
    ]

    var body: some View {
        VStack(spacing: 16) {
            ListVocabularyView(vocabularies: vocabularys) { vocabulary in
                selectedVocabulary = vocabulary
            }
            Spacer()
            ButtonFullWidthView(
                lable: "Xóa folder này",
                color: .yellowCustome,
                foregroundColor: .black
            ) {
                remove()
            }
        }
        .onAppear {
            viewModel.getVocabulary(vocabularys: vocabularys, folderId: folder.id)
        }
        .background(Image("sheet"))
        .navigationTitle(folder.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    DetailFolderView(
        folder: .constant(Folder(name: "folder name", color: "")),
        vocabularys: AppConstants.mockVocabularies) { }
}
