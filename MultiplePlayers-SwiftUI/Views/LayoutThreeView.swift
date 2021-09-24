import SwiftUI

struct LayoutThreeView: View {
    var player1: PlayerModel
    var player2: PlayerModel
    var orientation: UIDeviceOrientation

    private var largeVideoHeight: CGFloat {
        orientation.isPortrait ? largeVideoWidth * 9 / 16 : UIScreen.main.bounds.height * 0.9
    }
    private var largeVideoWidth: CGFloat {
        orientation.isPortrait ? UIScreen.main.bounds.width - 16 : UIScreen.main.bounds.width * 0.6
    }

    var body: some View {
        if orientation.isPortrait {
            ZStack(alignment: .trailing) {
                VStack(spacing: 8, content: {
                    Spacer()
                    PlayerView(playerModel: player1)
                        .frame(width: largeVideoWidth, height: largeVideoHeight)
                        .overlay(
                            PlayerView(playerModel: player2)
                                .frame(width: 150, height: 260)
                                .offset(x: -20, y: 180),
                            alignment: .bottomTrailing)
                    Spacer()
                    Spacer()
                    Spacer()
                })
            }
            .padding(8)
        } else {
            LazyVGrid(columns: [
                GridItem(.flexible(minimum: UIScreen.main.bounds.width * 0.7)),
                GridItem(.flexible())
            ], alignment: .center, spacing: 8, content: {
                PlayerView(playerModel: player1)
                    .frame(height: largeVideoHeight)
                PlayerView(playerModel: player2)
                    .frame(height: largeVideoHeight - 32)
            })
            .padding(8)
        }
    }
}
