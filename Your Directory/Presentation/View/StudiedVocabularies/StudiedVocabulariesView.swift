//
//  StudiedVocabulariesView.swift
//  Your Directory
//
//  Created by LuanNT29 on 16/09/2024.
//

import SwiftUI

struct StudiedVocabulariesView: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var vocabularies: [Vocabulary]
    @State var selectedVocabulary: Vocabulary? = nil

    // Toast
    @State var isShowToast = false
    @State var toastMessage: String? = nil
    @State var toastStatus: Status? = nil
    @State var vocabulariesState: VocabulariesState = .studied

    var progress: CGFloat {
        CGFloat(VocabulariesState.favoriteAndStudied.vocabularys(from: vocabularies).count) / CGFloat(VocabulariesState.favorited.vocabularys(from: vocabularies).count)
    }

    var body: some View {
        VStack {
            VStack(spacing: 16) {
                makeNavigation()
            }
            makeListVocabulary()
        }
        .background(alignment: .top, content: {
            Image("bg_favorite_vocabularies")
                .resizable()
                .frame(height: 240)
                .scaledToFit()
                .clipShape(
                    RoundedCornersShape(corners: [.bottomLeft, .bottomRight], radius: 48)
                )
                .ignoresSafeArea()
        })
        .sheet(item: $selectedVocabulary, onDismiss: {
            selectedVocabulary = nil
        }, content: { vocabulary in
            makeDetailVocabulary(vocabulary: vocabulary)
        })
        .popupToast(isPresented: $isShowToast, message: toastMessage, state: toastStatus)
    }
}

#Preview {
    StudiedVocabulariesView(vocabularies: .constant(AppConstants.mockVocabularies))
}
