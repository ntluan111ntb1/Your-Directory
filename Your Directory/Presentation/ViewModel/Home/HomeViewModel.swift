//
//  HomeViewModel.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import Foundation

class HomeViewModel: ObservableObject {
    @Published var userInfor = SignUp(name: "name")

    let getDataLocal = GetDataLocal()
    func getUserInfor() {
        guard let userInfor = getDataLocal.getData(key: Keys.userInfor, objectType: SignUp.self) else {return}
        self.userInfor = userInfor
    }
}
