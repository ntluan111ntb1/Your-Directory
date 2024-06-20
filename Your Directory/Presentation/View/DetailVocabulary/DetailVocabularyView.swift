//
//  DetailVocabularyView.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI

struct DetailVocabularyView: View {

    @Binding var vocabulary: Vocabulary

    var body: some View {
        VStack(spacing: 16) {
            VStack {
                HStack {
                    Text("Tạo mới từ vựng")
                        .fontStyle(.largeBold)
                    Spacer()
                    Button {
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal, 16)
                Divider()
                TextFieldImage(
                    text: $vocabulary.vocabulary,
                    imageName: "notebook",
                    placeholder: vocabulary.vocabulary,
                    sizeImage: 40
                )
                Divider()
                TextFieldImage(
                    text: $vocabulary.ipa,
                    imageName: "sound",
                    placeholder: vocabulary.ipa,
                    sizeImage: 40
                )
                Divider()
                TextFieldImage(
                    text: $vocabulary.description,
                    imageName: "description",
                    placeholder: vocabulary.description,
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
                    ///toDO
                }
        }
        .padding(16)
        .background(Image("sheet"))
    }
}

#Preview {
    DetailVocabularyView(vocabulary: .constant(Vocabulary(vocabulary: "Description", ipa: "sdsdsds", description: "dsdssdsadasdasdasdasdasasdasdadasdasdasd", background: "gra_1")))
}
