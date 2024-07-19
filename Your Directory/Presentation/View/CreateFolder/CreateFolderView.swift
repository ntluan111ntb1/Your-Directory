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
    
    @State var folder: Folder = Folder(name: "", color: CustomColor.style1.rawValue, publishAt: "")
    @State var selectedColor: CustomColor = .style1
    
    let eventType: EventType
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
                lable: eventType.textButton,
                color: .yellowCustome,
                foregroundColor: .black
            ) {
                viewModel.handleFolder(
                    folder: folder,
                    eventType: eventType
                ) { status, message, newFolder in
                    resultHanlde(status, message, newFolder)
                }
            }
        }
        .padding(16)
        .background(Color.orangeCustomize)
    }
}
