//
//  Your_DirectoryApp.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/06/2024.
//

import SwiftUI
import FirebaseCore
import FirebaseFirestore


@main
struct Your_DirectoryApp: App {
    @StateObject var viewModel = AuthenticationViewModel()

    init() {
        setupFirebase()
    }

    var body: some Scene {
        WindowGroup {
            SplashView()
                .onAppear {
                    viewModel.checkSignInState()
                }
                .environmentObject(viewModel)
        }
    }
}

extension Your_DirectoryApp {
    private func setupFirebase() {
        FirebaseApp.configure()
        Firestore.firestore()
    }
}
