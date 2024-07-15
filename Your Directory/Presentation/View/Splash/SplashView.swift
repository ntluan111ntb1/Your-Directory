//
//  SplashView.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/06/2024.
//

import SwiftUI
import Lottie
import FirebaseCore
import GoogleSignIn

struct SplashView: View {
    @EnvironmentObject var authenticationViewModel: AuthenticationViewModel

    @State var isPresentSplashView = true

    var body: some View {
        NavigationStack {
            VStack {
                if isPresentSplashView {
                    LottieView(animationName: "splash_view", loopMode: .playOnce)
                        .ignoresSafeArea()
                } else {
                    switch authenticationViewModel.state {
                    case .signedIn:
                        HomeView()
                    case .signedOut:
                        SignUpView()
                    case .unknown:
                        LottieView(animationName: "splash_view", loopMode: .playOnce)
                            .ignoresSafeArea()
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                isPresentSplashView.toggle()
            }
        }
    }
}

#Preview {
    SplashView()
}
