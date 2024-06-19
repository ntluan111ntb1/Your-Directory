//
//  ButtonIcon.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 19/06/2024.
//

import SwiftUI

struct ButtonIcons: View {
    let name: String
    let size: CGFloat?
    let action: () -> Void
    
    @State var isPressed = false
    var body: some View {
        Button {
            isPressed.toggle()
            action()
        } label: {
            Image(name)
                .resizable()
                .frame(width: size, height: size)
                .padding(4)
                .background(
                    RoundedCornersShape(corners: [.topLeft, .topRight], radius: 8)
                        .fill(.white)
                )
                .shadow(radius: isPressed ? 4 : 0)
        }
    }
}
