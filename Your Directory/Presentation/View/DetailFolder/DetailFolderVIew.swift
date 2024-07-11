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
            ScrollView(showsIndicators: false) {
                LazyVGrid(columns: layout) {
                    ForEach(viewModel.vocabularys, id: \.id) { vocabulary in
                        VocabularyCardView(vocabulary: vocabulary) {
                            selectedVocabulary = vocabulary
                        } playSound: {
                            viewModel.handleSound(sound: vocabulary.audio)
                        }
                    }
                }
                .padding(.horizontal)
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
        .padding(16)
        .background(Image("sheet"))
        .navigationTitle(folder.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
