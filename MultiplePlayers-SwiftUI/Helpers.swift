import AmazonIVSPlayer
import SwiftUI

enum MaxQuality: String {
    case high = "1920p"
    case medium = "1080p"
    case low = "480p"
}

struct IVSPlayerViewWrapper: UIViewRepresentable {
    let actualView: IVSPlayerView?

    func makeUIView(context: Context) -> IVSPlayerView {
        guard let view = actualView else {
            return IVSPlayerView()
        }
        return view
    }

    func updateUIView(_ uiView: IVSPlayerView, context: Context) {
        uiView.setNeedsLayout()
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
