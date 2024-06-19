//
//  HomeView.swift
//  Your Directory
//
//  Created by LuanNT29 on 19/06/2024.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel = HomeViewModel()
    let userInfor: SignUp

    var body: some View {
        VStack {
            Text("name: \(userInfor.name)")
        }
    }
}
//
//#Preview {
//    HomeView()
//}
