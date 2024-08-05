//
//  ButtonIcon.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 19/06/2024.
//

import SwiftUI

struct ButtonImage: View {
    let name: String
    let size: CGFloat?
    let action: () -> Void
    
    @State var isPressed: Bool? = false
    var body: some View {
        Button {
            isPressed?.toggle()
            action()
        } label: {
            Image(name)
                .resizable()
                .frame(width: size, height: size)
                .padding(4)
                .shadow(radius: isPressed ?? false ? 4 : 0)
        }
    }
}
