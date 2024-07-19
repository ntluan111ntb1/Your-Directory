//
//  ViewExtension.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/07/2024.
//

import SwiftUI

extension View {
    func popupConfirm(
        isPresented: Binding<Bool>,
        image: String,
        title: String,
        message: String,
        textButtonAgree: String,
        textButtonCancel: String,
        handleAgree: @escaping () -> Void
    ) -> some View {
        self.modifier(ConfirmPopUpModifier(
            isPresented: isPresented,
            image: image,
            title: title,
            message: message,
            textButtonAgree: textButtonAgree,
            textButtonCancel: textButtonCancel,
            handleAgree: handleAgree
        ))
    }

    func popupToast(isPresented: Binding<Bool>, message: String?, state: Status?) -> some View {
        self.modifier(ToastPopupModifier(
            isPresented: isPresented,
            message: message,
            status: state
        ))
    }
}
