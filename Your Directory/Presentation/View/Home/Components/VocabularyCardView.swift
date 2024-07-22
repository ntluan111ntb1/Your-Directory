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
    let folder: Folder
    @State var width: CGFloat = 0.0
    let tapHandle: () -> Void
    let playSound: () -> Void

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                RoundedCornersShape(corners: .allCorners, radius: 12)
                    .fill(
                        ConvertColor.colorFromHex(folder.color)
                            .opacity(0.1)
                    )
                Triangle()
                    .fill(ConvertColor.colorFromHex(folder.color))
                    .frame(width: width, height: 80)
                    .clipShape(RoundedCornersShape(corners: .allCorners, radius: 12))

                VStack(alignment: .leading) {
                    HStack {
                        Text(vocabulary.word)
                            .fontStyle(.mediumBold)
                        Spacer()
                    }
                    Text(vocabulary.phonetics)
                        .fontStyle(.mediumLight)
                }
                .padding(.horizontal)
                .onAppear {
                    width = geometry.size.width
                }
                .overlay(
                    Image("speaker")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .padding(.trailing)
                        .offset(x: 0, y: 8)
                        .onTapGesture {
                            playSound()
                        },
                    alignment: .bottomTrailing
                )
            }
        }
        .background(
            RoundedCornersShape(corners: .allCorners, radius: 12).fill(.white)
                .shadow(radius: 2, x: 0, y: 4)
        )
        .frame(height: 80)
        .onTapGesture {
            tapHandle()
        }
    }
}
