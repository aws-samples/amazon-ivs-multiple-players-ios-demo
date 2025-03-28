import SwiftUI

struct LayoutTwoView: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    var player1: PlayerModel
    var player2: PlayerModel

    private var videoSize: CGFloat {
        let padding: CGFloat = 24
        var size = verticalSizeClass == .regular ? UIScreen.main.bounds.width - padding : UIScreen.main.bounds.height - padding
        while size * 2 + padding > (verticalSizeClass == .regular ? UIScreen.main.bounds.height : UIScreen.main.bounds.width) {
            size -= padding
        }
        return size
    }

    var body: some View {
        if verticalSizeClass == .regular {
            VStack(spacing: 12) {
                PlayerView(playerModel: player1)
                    .frame(width: videoSize, height: videoSize)
                PlayerView(playerModel: player2)
                    .frame(width: videoSize, height: videoSize)
            }
        } else {
            HStack(spacing: 12) {
                PlayerView(playerModel: player1)
                    .frame(width: videoSize, height: videoSize)
                PlayerView(playerModel: player2)
                    .frame(width: videoSize, height: videoSize)
            }
        }
    }
}
