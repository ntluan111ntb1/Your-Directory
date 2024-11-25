//
//  FirstOnAppearModifier.swift
//  Your Directory
//
//  Created by LuanNT29 on 25/11/2024.
//

import SwiftUI

struct FirstOnAppearModifier: ViewModifier {
    @State var isFirstOnAppear = true
    let handle: () -> Void

    func body(content: Content) -> some View {
        content
            .onAppear {
                if isFirstOnAppear {
                    handle()
                }
                isFirstOnAppear = false
            }
    }
}

extension View {
    func firstOnAppear(handle: @escaping () -> Void) -> some View {
        self.modifier(FirstOnAppearModifier(
            handle: handle
        ))
    }
}

