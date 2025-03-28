import AmazonIVSPlayer
import SwiftUI
import Combine

enum MaxQuality: String {
    case high = "1920p"
    case medium = "1080p"
    case low = "480p"
}

struct IVSPlayerViewWrapper: UIViewRepresentable {
    let playerModel: PlayerModel

    func makeUIView(context: Context) -> IVSPlayerView {
        let playerView = IVSPlayerView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        playerView.videoGravity = .resizeAspectFill
        return playerView
    }

    func updateUIView(_ uiView: IVSPlayerView, context: Context) {
        uiView.player = playerModel.player
    }
}

struct PrimaryButtonStyle: ButtonStyle {
    let height: CGFloat = 50
    let width: CGFloat = 50

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.title)
            .frame(minWidth: width, minHeight: height)
            .foregroundColor(.black)
            .background(configuration.isPressed ? Color(.sRGB, white: 0.9, opacity: 1) : Color.white)
            .cornerRadius(50)
            .labelStyle(IconOnlyLabelStyle())
    }
}
