//
//  SplashView.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/06/2024.
//

import SwiftUI
import Lottie

struct SplashView: View {
    @StateObject var viewModel = SplashViewModel()

    var body: some View {
        NavigationStack {
            if let userInfor = viewModel.userInfor {
                SignUpView()
            } else {
                SignUpView()
            }
        }
        .onAppear {
            viewModel.getUserInfor()
        }
    }
}
