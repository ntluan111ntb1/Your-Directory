//
//  SignInView.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/06/2024.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn
import FirebaseCore

struct SignInView: View {
    @EnvironmentObject var authenticationViewModel:  AuthenticationViewModel

    @State var name = ""
    @State var age = ""
    var body: some View {
        GeometryReader(content: { geometry in
            VStack(spacing: 24) {
                VStack {
                    Spacer()
                    HStack(spacing: 0) {
                        Image("hello")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 120, height: 120)
                        VStack(alignment: .leading) {
                            Text("My Vocabulary")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundStyle(.white)
                            Text("Xin chào người bạn chăm chỉ...")
                                .fontStyle(.medium)
                                .foregroundStyle(.white)
                            Text("Hãy đăng nhập và học Tiếng Anh thui.")
                                .fontStyle(.medium)
                                .foregroundStyle(.white)
                        }
                    }
                    GoogleSignInButton(style: .wide) {
                        authenticationViewModel.signIn()
                    }
                    .padding(.leading, 32)
                    .padding(.trailing)
                }
                .padding(.bottom, 32)
                .frame(width: geometry.size.width, height: geometry.size.height/2.7)
                .background(ConvertColor.colorFromHex("97a39f"))
                .clipShape(
                    RoundedCornersShape(corners: [.bottomLeft], radius: 72)
                )
                .shadow(radius: 2, x: 0, y: 4)
                Spacer()
            }
            .background {
                VStack {
                    Spacer()
                    Image("background")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                }
            }
            .onTapGesture {
                UIApplication.shared.sendAction(
                    #selector(UIResponder.resignFirstResponder),
                    to: nil,
                    from: nil,
                    for: nil
                )
            }
        })
        .ignoresSafeArea()
    }
}

#Preview {
    SignInView()
}
