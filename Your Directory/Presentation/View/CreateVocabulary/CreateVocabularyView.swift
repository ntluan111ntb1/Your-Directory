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
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Thêm từ vựng nhé...")
                .font(.title)
            TextFieldCustomize(
                text: $vocabulary,
                label: "Bạn muốn thêm từ nào?",
                placeholder: "Nhập từ vựng ở đây nè!!!"
            )
            TextFieldCustomize(
                text: $ipa,
                label: "Thêm phiên âm cho nó chứ?",
                placeholder: "Nhập phiên âm ở đây nè!!!"
            )
            TextFieldCustomize(
                text: $ipa,
                label: "Thêm một chút mô tả cho nó nhé?",
                placeholder: "Nhập mô tả ở đây nè!!!"
            )
            ButtonFullWidthView(
                lable: "Tạo thôi nào",
                color: .purpleCustomize,
                foregroundColor: .white) {
                    ///toDO
                }
        }
        .padding(16)
    }
}

#Preview {
    CreateVocabularyView()
}
