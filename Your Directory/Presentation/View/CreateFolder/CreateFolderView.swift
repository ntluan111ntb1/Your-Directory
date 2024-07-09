//
//  CreateFolderView.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 19/06/2024.
//

import SwiftUI

struct CreateFolderView: View {
    @Binding var isPresentSheet: Bool

    @State var folder = ""
    @State var selectedColor: CustomColor = .style1
    
    let createFolder: (Folder) -> Void

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
                    .fill(.white)
                    .shadow(radius: 4)
            )
            Spacer()
            ButtonFullWidthView(
                lable: "Tạo thôi nào",
                color: .purpleCustomize,
                foregroundColor: .white) {
                    createFolder(Folder(name: folder, color: selectedColor.rawValue))
                }
        }
        .padding(16)
        .background(Image("sheet"))
    }
}
