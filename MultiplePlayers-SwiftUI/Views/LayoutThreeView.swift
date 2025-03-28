import SwiftUI

struct LayoutThreeView: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    var player1: PlayerModel
    var player2: PlayerModel

    private var largeVideoHeight: CGFloat {
        verticalSizeClass == .regular ? largeVideoWidth * 9 / 16 : UIScreen.main.bounds.height * 0.9
    }
    private var largeVideoWidth: CGFloat {
        verticalSizeClass == .regular ? UIScreen.main.bounds.width - 16 : UIScreen.main.bounds.width * 0.6
    }

    var body: some View {
        if verticalSizeClass == .regular {
            VStack(alignment: .trailing, spacing: 8, content: {
                PlayerView(playerModel: player1)
                    .frame(width: largeVideoWidth, height: largeVideoHeight)
                PlayerView(playerModel: player2)
                    .frame(width: 150, height: 260)
                    .offset(x: -20, y: -80)
            })
            .padding(8)
        } else {
            HStack(alignment: .center, spacing: 8) {
                PlayerView(playerModel: player1)
                    .frame(width: largeVideoWidth)
                PlayerView(playerModel: player2)
            }
            .padding(8)
        }
    }
}
