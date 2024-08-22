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
        HStack(spacing: 16) {
            Image("study")
                .resizable()
                .frame(width: 40, height: 40)
            VStack(alignment: .leading) {
                HStack {
                    Text(vocabulary.word)
                        .fontStyle(.mediumBold)
                    Spacer()
                }
                Button {
                    playSound()
                } label: {
                    HStack {
                        Image(systemName: "speaker.wave.3.fill")
                        Text("/\(vocabulary.phonetics)/")
                            .fontStyle(.mediumLight)
                    }
                }
            }
            Image(systemName: vocabulary.isStudy ? "checkmark.circle.fill" : "checkmark.circle")
                .font(.system(size: 24))
                .foregroundStyle(vocabulary.isStudy ? .green : .black.opacity(0.5))
        }
        .padding()
        .background(
            RoundedCornersShape(corners: .allCorners, radius: 12)
                .fill(.white)
        )
        .onTapGesture {
            tapHandle()
        }
    }
}
