//
//  Your_DirectoryApp.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/06/2024.
//

import SwiftUI
import FirebaseCore


@main
struct Your_DirectoryApp: App {
    @StateObject var viewModel = AuthenticationViewModel()

    init() {
        setupAuthentication()
    }

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(viewModel)
        }
    }
}

extension Your_DirectoryApp {
    private func setupAuthentication() {
        FirebaseApp.configure()
    }
}
