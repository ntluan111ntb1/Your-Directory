import SwiftUI

enum BackgroundColor: CaseIterable {
    case pink
    case yellow
    case orange
    case blue

    var color: Color {
        switch self {
        case .pink:
            return ConvertColor.colorFromHex("fbe9f5")
        case .yellow:
            return ConvertColor.colorFromHex("fef5e4")
        case .orange:
            return ConvertColor.colorFromHex("fff1f0")
        case .blue:
            return ConvertColor.colorFromHex("eaf9fe")
        }
    }

    static func random() -> BackgroundColor {
        return BackgroundColor.allCases.randomElement()!
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
                .fill(vocabulary.isFavorite ? Color.lightYellowCustome : Color.lightBlueCustome)
        )
        .onTapGesture {
            tapHandle()
        }
    }
}
