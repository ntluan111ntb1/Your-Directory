//
//  VocabularyCardView.swift
//  Your Directory
//
//  Created by LuanNT29 on 20/06/2024.
//

import SwiftUI
struct Triangle: Shape {
   func path(in rect: CGRect) -> Path {
       var path = Path()
       path.move(to: CGPoint(x: rect.minX, y: rect.maxY))
       path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
       path.addCurve(
           to: CGPoint(x: rect.maxX, y: rect.minY),
           control1: CGPoint(
               x: rect.midX - rect.width/6,
               y: rect.midY
           ),
           control2: CGPoint(x: rect.midX + rect.width/6, y: rect.maxY)
       )
       path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
       return path
   }
}
struct VocabularyCardView: View {

    let vocabulary: Vocabulary
    @State var width: CGFloat = 0.0
    let tapHandle: () -> Void
    let playSound: () -> Void

    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading) {
                HStack {
                    Text(vocabulary.word)
                        .fontStyle(.mediumBold)
                    Spacer()
                }
                Text(vocabulary.phonetics)
                    .fontStyle(.mediumLight)
            }
            .onAppear {
                width = geometry.size.width
            }
            .overlay(
                Image("speaker")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .offset(x: -16 ,y: 12)
                    .onTapGesture {
                        playSound()
                    },
                alignment: .bottomTrailing
            )
        }
        .padding([.top, .leading])
        .frame(height: 80)
        .background(
            Triangle()
                .fill(ConvertColor.colorFromHex(vocabulary.folder?.color ?? ""))
                .frame(width: width, height: 80)
                .clipShape(RoundedCornersShape(corners: .allCorners, radius: 12))
                .background(
                    RoundedCornersShape(corners: .allCorners, radius: 12)
                        .fill(.white)
                        .shadow(radius: 2, x: 0, y: 4)
                )
        )
        .onTapGesture {
            tapHandle()
        }
    }
}
