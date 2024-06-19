//
//  SignUpViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 18/06/2024.
//

import Foundation

class SignUpViewModel: ObservableObject {
    @Published var userInfor = SignUp(name: "fake")
    let setDataLocal = SetDataLocal()

    func setUserInfor(userInfor: SignUp) {
        self.userInfor = userInfor
        setDataLocal.setData(key: Keys.userInfor, object: userInfor)
    }
}
