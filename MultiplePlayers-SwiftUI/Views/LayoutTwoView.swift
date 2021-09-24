import SwiftUI

struct LayoutTwoView: View {
    var player1: PlayerModel
    var player2: PlayerModel
    var orientation: UIDeviceOrientation

    private let portraitColumns = [
        GridItem(.flexible())
    ]
    private let landscapeColumns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    private var videoSize: CGFloat {
        let padding: CGFloat = 24
        var size = orientation.isPortrait ? UIScreen.main.bounds.width - padding : UIScreen.main.bounds.height - padding
        while size * 2 + padding > (orientation.isPortrait ? UIScreen.main.bounds.height : UIScreen.main.bounds.width) {
            size -= padding
        }
        return size
    }

    var body: some View {
        LazyVGrid(columns: orientation.isPortrait ? portraitColumns : landscapeColumns, spacing: 12, content: {
            PlayerView(playerModel: player1)
                .frame(width: videoSize, height: videoSize)
            PlayerView(playerModel: player2)
                .frame(width: videoSize, height: videoSize)
        })
    }
}
