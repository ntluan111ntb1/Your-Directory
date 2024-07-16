//
//  PopupView.swift
//  Your Directory
//
//  Created by LuanNT29 on 16/07/2024.
//

import SwiftUI

struct PopupView: View {

    let image: String
    let title: String
    let content: String
    let textButtonAgree: String
    let textButtonCancel: String
    let handleAgree: () -> Void
    let handleCancel: () -> Void

    var body: some View {
        VStack {
            VStack(spacing: 12) {
                HStack {
                    Image(image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 156, maxHeight: 156)
                    VStack(alignment: .leading) {
                        Text(title)
                            .fontStyle(.largeBold)
                        Text(content)
                            .fontStyle(.medium)
                    }
                    .foregroundStyle(.white)
                    .padding(.bottom, 16)
                }
                HStack {
                    ButtonFullWidthView(
                        lable: textButtonAgree,
                        color: .red,
                        foregroundColor: .white) {
                            handleAgree()
                        }
                    ButtonFullWidthView(
                        lable: textButtonCancel,
                        color: .white,
                        foregroundColor: .black) {
                            handleCancel()
                        }
                }
            }
            .padding()
            .background(Color.popupBackground.cornerRadius(20))
        }
        .padding(.horizontal)
    }
}

#Preview {
    PopupView(
        image: "question",
        title: "Xóa Folder Này ?",
        content: "Bạn có chắc muốn xóa folder này hong?",
        textButtonAgree: "Xóa luôn",
        textButtonCancel: "Thôi",
        handleAgree: {}
    ) {

    }
}
