//
//  CreateVocabularyView.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 19/06/2024.
//

import SwiftUI

struct CreateVocabularyView: View {
    
    @State var vocabulary = ""
    @State var ipa = ""
    @Binding var isPresentSheet: Bool
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
                HStack {
                    GIFView(type: .name("notebook"))
                        .frame(width: 40, height: 40)
                    TextField("Bạn muốn thêm từ nào", text: $vocabulary)
                }
                Divider()
                HStack {
                    GIFView(type: .name("sound"))
                        .frame(width: 40, height: 40)
                    TextField("Thêm phiên âm cho nó chứ", text: $vocabulary)
                }
                Divider()
                HStack {
                    GIFView(type: .name("description"))
                        .frame(width: 40, height: 40)
                    TextField("Thêm một chút mô tả cho nó nhé", text: $vocabulary)
                }
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
