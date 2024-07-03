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
    @StateObject var splashViewModel = SplashViewModel()
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @State var isPresentHomeView = false

    var body: some View {
        NavigationStack {
            switch viewModel.state {
            case .signedIn:
                HomeView(userInfor: SignUp(name: "Luan"))
            case .signedOut:
                SignUpView()
            }
        }
    }
}
