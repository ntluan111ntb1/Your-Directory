//
//  CreateFolderView.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 19/06/2024.
//

import SwiftUI

struct CreateFolderView: View {
    @StateObject var viewModel = CreateFolderViewModel()
    @Binding var isPresentSheet: Bool

    @State var folderName = ""
    @State var selectedColor: CustomColor = .style1

    let resultHanlde: (Status, String, Folder?) -> Void

    var body: some View {
        VStack(spacing: 16) {
            VStack {
                makeHeader()
                Divider()
                makeContentOfFolder()
            }
            .padding(16)
            .background(
                RoundedCornersShape(corners: .allCorners, radius: 38)
                    .fill(Color.white)
                    .shadow(radius: 4)
            )
            Spacer()
            ButtonFullWidthView(
                lable: "Tạo thôi nào",
                color: .yellowCustome,
                foregroundColor: .black
            ) {
                viewModel.addFolder(
                    folder: Folder(
                        name: folderName,
                        color: selectedColor.rawValue,
                        publishAt: ""
                    )
                ) { status, message, newFolder in
                    resultHanlde(status, message, newFolder)
                }
            }
        }
        .padding(16)
        .background(Color.orangeCustomize)
    }
}
