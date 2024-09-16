//
//  FavoriteVocabilariesView.swift
//  Your Directory
//
//  Created by LuanNT29 on 28/08/2024.
//

import SwiftUI

struct FavoriteVocabilariesView: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var vocabularies: [Vocabulary]
    @State var selectedVocabulary: Vocabulary? = nil

    // Toast
    @State var isShowToast = false
    @State var toastMessage: String? = nil
    @State var toastStatus: Status? = nil
    @State var vocabulariesState: VocabulariesState = .favorited

    var progress: CGFloat {
        CGFloat(VocabulariesState.favoriteAndStudied.vocabularys(from: vocabularies).count) / CGFloat(VocabulariesState.favorited.vocabularys(from: vocabularies).count)
    }

    var body: some View {
        VStack {
            VStack(spacing: 16) {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
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
                    ButtonFilterView(text: "Tất Cả", isSelected: vocabulariesState == .favorited) {
                        vocabulariesState = .favorited
                    }
                    ButtonFilterView(text: "Đã Học", isSelected: vocabulariesState == .favoriteAndStudied) {
                        vocabulariesState = .favoriteAndStudied
                    }
                    ButtonFilterView(text: "Chưa Học", isSelected: vocabulariesState == .favoriteAndNotStudied) {
                        vocabulariesState = .favoriteAndNotStudied
                    }
                }
                .padding(8)
                .backgroundRoundedCorners(color: .white.opacity(0.5), radius: 64)
                .padding(.horizontal, 16)
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
                        Text("Tổng số: \(VocabulariesState.favorited.vocabularys(from: vocabularies).count)")
                        Spacer()
                        Text("Đã học: \(VocabulariesState.favoriteAndStudied.vocabularys(from: vocabularies).count)")
                    }
                    ProgressView(value: progress)
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
                ListVocabularyView(vocabularies: vocabulariesState.vocabularys(from: vocabularies), folders: []) { vocabulary in
                    selectedVocabulary = vocabulary
                }
                .padding(.top, 88)
                .zIndex(0)
            }
            Spacer()
        }
        .navigationBarBackButtonHidden()
        .sheet(item: $selectedVocabulary, onDismiss: {
            selectedVocabulary = nil
        }, content: { vocabulary in
            VStack {
                NavigationStack {
                    DetailVocabularyView(
                        vocabulary: $selectedVocabulary,
                        folders: .constant([]),
                        note: vocabulary.vocabularyNote ?? "",
                        selectedFolder: Folder(name: "", color: "", publishAt: ""),
                        typeOfView: .update,
                        dismiss: {
                            selectedVocabulary = nil
                        }
                    ) { toastStatus, toastMessage, vocabulary in
                        self.toastMessage = toastMessage
                        self.toastStatus = toastStatus
                        guard let vocabulry = selectedVocabulary else { return }
                        if let index = self.vocabularies.firstIndex(of: vocabulry) {
                            if let vocabularyUpdated = vocabulary {
                                self.vocabularies[index].vocabularyNote = vocabularyUpdated.vocabularyNote
                                self.vocabularies[index].folderId = vocabularyUpdated.folderId
                                self.vocabularies[index].isStudy = vocabularyUpdated.isStudy
                                self.vocabularies[index].isFavorite = vocabularyUpdated.isFavorite
                            } else {
                                self.vocabularies.remove(at: index)
                            }
                        }
                        selectedVocabulary = nil
                        isShowToast = true
                    }
                }
            }
            .presentationDetents([.medium, .large])
            .presentationCornerRadius(38)
        })
        .popupToast(isPresented: $isShowToast, message: toastMessage, state: toastStatus)
    }
}

#Preview {
    FavoriteVocabilariesView(vocabularies: .constant(AppConstants.mockVocabularies))
}
