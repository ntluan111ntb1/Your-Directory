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
                HStack {
                    Text("Tạo mới thể loại")
                        .fontStyle(.largeBold)
                    Spacer()
                    Button {
                        isPresentSheet.toggle()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.title2)
                            .foregroundStyle(.black)
                    }
                }
                .padding(.horizontal, 16)
                Divider()
                TextFieldImageGif(
                    text: $category,
                    imageName: "notebook",
                    placeholder: "Tên của thể loại",
                    sizeImage: 40
                )
                VStack {
                    Form {
                        Picker("Select a Color", selection: $selectedColor) {
                            ForEach(CustomColor.allCases) { color in
                                HStack {
                                    Circle()
                                        .fill(color.color)
                                        .frame(width: 30, height: 30)
                                    Text(color.name)
                                        .foregroundColor(.primary)
                                }
                                .tag(color)
                            }
                        }
                        .pickerStyle(.inline)
                    }
                }
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
