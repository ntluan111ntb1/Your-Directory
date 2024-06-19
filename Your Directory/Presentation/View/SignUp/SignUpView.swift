//
//  SignUpView.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/06/2024.
//

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()

    @State var name = ""
    @State var age = ""
    @State var isHomePresent = false
    var body: some View {
        GeometryReader(content: { geometry in
            VStack() {
                VStack {
                    Spacer()
                    Text("Your Directory")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.bottom, 24)
                        .foregroundStyle(.white)
                }
                .frame(width: geometry.size.width, height: geometry.size.height/3)
                .background(LinearGradient(
                    colors: [.lightBlue,.purpleCustomize],
                    startPoint: .leading,
                    endPoint: .trailing
                ))
                .clipShape(
                    RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 32)
                )
                .shadow(radius: 4)
                VStack(spacing: 24) {
                    TextFieldCustomize(
                        text: $name,
                        label: "Tên của bạn là gì?",
                        placeholder: "Nhập tên của bạn ở đây nè...") {
                            handleHomePresent()
                        }
                    Spacer()
                    ButtonFullWidthView(
                        lable: "Let's Go",
                        color: Color.purpleCustomize,
                        foregroundColor: .white) {
                            handleHomePresent()
                        }
                }
                .padding(.vertical, 24)
                .padding(.horizontal, 16)
            }
            .background()
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
        .navigationDestination(isPresented: $isHomePresent) {
            HomeView(userInfor: viewModel.userInfor)
        }
    }

    func handleHomePresent() {
        viewModel.setUserInfor(userInfor: SignUp(name: name))
        isHomePresent = true
    }
}

#Preview {
    SignUpView()
}
