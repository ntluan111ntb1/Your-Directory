//
//  CreateCategoryView.swift
//  Your Directory
//
//  Created by Nguyễn Luân on 19/06/2024.
//

import SwiftUI

struct CreateCategoryView: View {
    @Binding var isPresentSheet: Bool

    @State var category = ""
    @State private var selectedColor: CustomColor = .vividViolet
    
    let createCategory: (Category) -> Void

    var body: some View {
        VStack(spacing: 16) {
            VStack {
                makeHeader()
                Divider()
                makeContentOfCategory()
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
                    createCategory(Category(name: category, color: selectedColor.rawValue))
                }
        }
        .padding(16)
        .background(Image("sheet"))
    }
}
