//
//  ConfirmPopUpModifier.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/07/2024.
//

import SwiftUI
import ExytePopupView

struct ConfirmPopUpModifier: ViewModifier {
    @Binding var isPresented: Bool
    let image: String
    let title: String
    let message: String
    let textButtonAgree: String
    let textButtonCancel: String
    let handleAgree: () -> Void

    func body(content: Content) -> some View {
        content
            .popup(isPresented: $isPresented, view: {
                PopupView(
                    image: image,
                    title: title,
                    content: message,
                    textButtonAgree: textButtonAgree,
                    textButtonCancel: textButtonCancel,
                    handleAgree: handleAgree
                ) {
                    isPresented = false
                }
                .padding(.horizontal)
            }, customize: {
                $0
                    .type(.floater())
                    .position(.bottom)
                    .animation(.spring())
            })
    }
}
