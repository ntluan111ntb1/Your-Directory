//
//  AuthenticationViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 03/07/2024.
//

import Foundation
import GoogleSignIn
import FirebaseAuth
import FirebaseCore

class AuthenticationViewModel: ObservableObject {
    enum SignInState {
        case signedIn
        case signedOut
    }

    @Published var state: SignInState = .signedOut

    func signIn() {
        // 1
        if GIDSignIn.sharedInstance.hasPreviousSignIn() {
            GIDSignIn.sharedInstance.restorePreviousSignIn { [unowned self] user, error in
                authenticateUser(for: user, with: error)
            }
        } else {
            // 2
            guard let clientID = FirebaseApp.app()?.options.clientID else { return }

            // Create Google Sign In configuration object.
            let config = GIDConfiguration(clientID: clientID)

            GIDSignIn.sharedInstance.configuration = config

            let scenes = UIApplication.shared.connectedScenes
            let windowScenes = scenes.first as? UIWindowScene
            let window = windowScenes?.windows.first
            guard let rootViewController = window?.rootViewController else { return }
            // 5
            GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController) { signInResult, error in
                self.authenticateUser(for: signInResult?.user, with: error)
            }
        }
    }

    private func authenticateUser(for user: GIDGoogleUser?, with error: Error?) {
        if let error = error {
            print("There is an error signing the user in ==> \(error)")
            return
        }
        guard let user = user, let idToken = user.idToken?.tokenString else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: user.accessToken.tokenString)

        Auth.auth().signIn(with: credential) { authResult, error in
            if error != nil {
                print(error)
            } else {
                self.state = .signedIn
                print("==> email: \(authResult?.user.email)")
                print("==> photo: \(authResult?.user.photoURL!.absoluteString)")
            }
        }
    }

    func signOut() {
        // 1
        GIDSignIn.sharedInstance.signOut()

        do {
            // 2
            try Auth.auth().signOut()

            state = .signedOut
        } catch {
            print(error.localizedDescription)
        }
    }
}
