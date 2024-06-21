//
//  CreateVocabularyView.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 19/06/2024.
//

import SwiftUI

struct CreateVocabularyView: View {
    @StateObject var viewModel = CreateVocabularyViewModel()
    @State var vocabulary = ""
    @State var ipa = ""
    @State var description = ""
    @Binding var isPresentSheet: Bool

    let createVocabulary: (Vocabulary) -> Void

    var body: some View {
        VStack(spacing: 16) {
            VStack {
                HStack {
                    Text("Tạo mới từ vựng")
                        .fontStyle(.largeBold)
                    Spacer()
                    Button {
                        isPresentSheet.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal, 16)
                Divider()
                TextFieldImageGif(
                    text: $vocabulary,
                    imageName: "notebook",
                    placeholder: "Bạn muốn thêm từ nào",
                    sizeImage: 40
                )
                Divider()
                TextFieldImageGif(
                    text: $ipa,
                    imageName: "sound",
                    placeholder: "Thêm phiên âm cho nó chứ",
                    sizeImage: 40
                )
                Divider()
                TextFieldImageGif(
                    text: $description,
                    imageName: "description",
                    placeholder: "Thêm một chút mô tả cho nó nhé",
                    sizeImage: 40
                )
            }
            .padding(16)
            .background(
                RoundedCornersShape(corners: .allCorners, radius: 38)
                    .fill(.white)
                    .shadow(radius: 4)
            )
            Spacer()
            ButtonFullWidthView(
                lable: "Tạo thôi nào",
                color: .purpleCustomize,
                foregroundColor: .white) {
//                    createVocabulary(Vocabulary(word: vocabulary, phonetics: ipa, description: description, background: "gra_1"))
                }
        }
        .padding(16)
        .background(Image("sheet"))
    }
}
