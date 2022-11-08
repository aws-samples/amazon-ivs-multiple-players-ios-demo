import AmazonIVSPlayer
import SwiftUI
import Combine

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

final class DeviceOrientation: ObservableObject {
    enum Orientation {
        case portrait
        case landscape
    }
    @Published var orientation: Orientation
    var isPortrait: Bool {
        orientation == .portrait
    }
    var isLandscape: Bool {
        orientation == .landscape
    }
    private var listener: AnyCancellable?

    init() {
        orientation = UIDevice.current.orientation.isLandscape ? .landscape : .portrait
        listener = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .compactMap { ($0.object as? UIDevice)?.orientation }
            .compactMap { deviceOrientation -> Orientation? in
                if deviceOrientation.isPortrait {
                    return .portrait
                } else if deviceOrientation.isLandscape {
                    return .landscape
                } else {
                    return nil
                }
            }
            .assign(to: \.orientation, on: self)
    }

    deinit {
        listener?.cancel()
    }
}
