import SwiftUI

struct LayoutOneView: View {
    @EnvironmentObject var orientation: DeviceOrientation
    var player1: PlayerModel
    var player2: PlayerModel
    var player3: PlayerModel

    private var largeVideoHeight: CGFloat {
        orientation.isPortrait ? largeVideoWidth * 9 / 16 : UIScreen.main.bounds.height * 0.8
    }
    private var largeVideoWidth: CGFloat {
        orientation.isPortrait ? UIScreen.main.bounds.width - 16 : UIScreen.main.bounds.width * 0.6
    }
    private var smallVideoHeight: CGFloat {
        orientation.isPortrait ? largeVideoHeight / 2 : largeVideoHeight / 2 - 4
    }
    private var gridColumns: [GridItem] {
        if orientation.isPortrait {
            return [GridItem(.flexible())]
        } else {
            return [
                GridItem(.flexible(minimum: orientation.isPortrait ? UIScreen.main.bounds.width - 16 : UIScreen.main.bounds.width * 0.6)),
                GridItem(.flexible())
            ]
        }
    }

    var body: some View {
        if #available(iOS 16.0, *) {
            Grid {
                GridRow {
                    PlayerView(playerModel: player1)
                        .frame(height: largeVideoHeight)
                        .gridCellColumns(2)

                    if orientation.isLandscape {
                        VStack(spacing: 8, content: {
                            PlayerView(playerModel: player2)
                                .frame(height: smallVideoHeight)
                            PlayerView(playerModel: player3)
                                .frame(height: smallVideoHeight)
                        })
                    }
                }

                if orientation.isPortrait {
                    GridRow {
                        PlayerView(playerModel: player2)
                            .frame(height: smallVideoHeight)
                        PlayerView(playerModel: player3)
                            .frame(height: smallVideoHeight)
                    }
                }
            }
        } else {
            LazyVGrid(columns: gridColumns, spacing: 8, content: {
                PlayerView(playerModel: player1)
                    .frame(height: largeVideoHeight)

                if orientation.isPortrait {
                    HStack(spacing: 8, content: {
                        PlayerView(playerModel: player2)
                            .frame(height: smallVideoHeight)
                        PlayerView(playerModel: player3)
                            .frame(height: smallVideoHeight)
                    })
                } else {
                    VStack(spacing: 8, content: {
                        PlayerView(playerModel: player2)
                            .frame(height: smallVideoHeight)
                        PlayerView(playerModel: player3)
                            .frame(height: smallVideoHeight)
                    })
                }
            })
            .padding(8)
        }
    }
}
