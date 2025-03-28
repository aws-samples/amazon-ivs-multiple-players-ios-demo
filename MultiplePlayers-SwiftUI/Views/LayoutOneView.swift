import SwiftUI

struct LayoutOneView: View {
    @Environment(\.verticalSizeClass) private var verticalSizeClass

    var player1: PlayerModel
    var player2: PlayerModel
    var player3: PlayerModel

    private var largeVideoHeight: CGFloat {
        verticalSizeClass == .regular ? largeVideoWidth * 9 / 16 : UIScreen.main.bounds.height * 0.8
    }
    private var largeVideoWidth: CGFloat {
        verticalSizeClass == .regular ? UIScreen.main.bounds.width - 16 : UIScreen.main.bounds.width * 0.6
    }
    private var smallVideoHeight: CGFloat {
        verticalSizeClass == .regular ? largeVideoHeight / 2 : largeVideoHeight / 2 - 4
    }

    @ViewBuilder var playerView1: some View {
        PlayerView(playerModel: player1)
            .frame(height: largeVideoHeight)
    }
    @ViewBuilder var playerView2: some View {
        PlayerView(playerModel: player2)
            .frame(height: smallVideoHeight)
    }
    @ViewBuilder var playerView3: some View {
        PlayerView(playerModel: player3)
            .frame(height: smallVideoHeight)
    }

    var body: some View {
        if verticalSizeClass == .regular {
            VStack(spacing: 8) {
                playerView1
                HStack(spacing: 8) {
                    playerView2
                    playerView3
                }
            }
            .padding(8)
        } else {
            HStack(spacing: 8) {
                playerView1
                    .frame(width: largeVideoHeight * 16 / 9)
                VStack(spacing: 8) {
                    playerView2
                    playerView3
                }
            }
            .padding(8)
        }
    }
}
