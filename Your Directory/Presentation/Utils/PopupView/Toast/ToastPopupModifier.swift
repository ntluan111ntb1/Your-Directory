//
//  ToastPopupModifier.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/07/2024.
//

import SwiftUI
import ExytePopupView

struct ToastPopupModifier: ViewModifier {
    @Binding var isPresented: Bool
    let message: String?
    let status: Status?

    func body(content: Content) -> some View {
        content
            .popup(isPresented: $isPresented) {
                ToastView(message: message ?? "", state: status ?? .fail)
            } customize: {
                $0
                    .type(.floater())
                    .position(.top)
                    .animation(.spring())
                    .closeOnTapOutside(true)
                    .autohideIn(3)
            }
    }
}
