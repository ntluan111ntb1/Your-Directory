//
//  LoadingView.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/07/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                LottieView(animationName: "loading", loopMode: .loop)
                    .frame(width: 160, height: 160)
                Spacer()
            }
            Spacer()
        }
    }
}

#Preview {
    LoadingView()
}
