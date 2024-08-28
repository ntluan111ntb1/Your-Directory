//
//  FavoriteVocabilariesView.swift
//  Your Directory
//
//  Created by LuanNT29 on 28/08/2024.
//

import SwiftUI

struct FavoriteVocabilariesView: View {
    @Binding var vocabularies: [Vocabulary]
    var body: some View {
        VStack {
            VStack(spacing: 16) {
                HStack {
                    Button {
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 24))
                    }
                    Spacer()
                    Text("Từ Vựng Yêu Thích")
                        .fontStyle(.largeBold)
                        .foregroundStyle(.white)
                        .padding(8)
                        .padding(.horizontal)
                        .backgroundRoundedCorners(color: .black, radius: 24)
                    Spacer()
                }
                .padding(.horizontal)
                HStack(alignment: .bottom) {
                    Button {

                    } label: {
                        HStack {
                            Spacer()
                            Text("Unstudy")
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .backgroundRoundedCorners(color: .purpleCustome, radius: 24)
                    Button {

                    } label: {
                        HStack {
                            Spacer()
                            Text("Studied")
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .backgroundRoundedCorners(color: .purpleCustome, radius: 24)
                }
                .padding(8)
                .backgroundRoundedCorners(color: .white, radius: 64)
                .padding(.horizontal, 40)
            }
            .background(
                Image("bg_favorite_vocabularies")
                    .resizable()
                    .frame(height: 240)
                    .scaledToFit()
                    .clipShape(
                        RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 40)
                    )
                    .ignoresSafeArea()
            )
            .overlay(alignment: .bottom, content: {
                VStack {
                    HStack {
                        Text("Tổng số: \(vocabularies.count)")
                        Spacer()
                        Text("Đã học: \(vocabularies.count)")
                    }
                    ProgressView(value: 0.5)
                }
                .padding()
                .background(
                    Color.white.clipShape(RoundedCornersShape(corners: .allCorners, radius: 12))
                        .shadow(radius: 4)
                )
                .padding(.horizontal, 24)
                .offset(y: 84)
            })
            .zIndex(1)
            ScrollView {
                ListVocabularyView(vocabularies: vocabularies, folders: []) { _ in

                }
                .padding(.top, 88)
                .zIndex(0)
            }
            Spacer()
        }
    }
}

#Preview {
    FavoriteVocabilariesView(vocabularies: .constant(AppConstants.mockVocabularies))
}
