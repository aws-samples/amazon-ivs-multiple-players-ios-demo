import AmazonIVSPlayer
import SwiftUI

struct PlayersListView: View {
    @State private var viewModel = ViewModel()
    @State private var isPaused = false
    @State private var layout: Int = 1

    init() {
        viewModel.updatePlayers(for: layout)
    }

    var body: some View {
        ZStack {
            view(for: layout)
            VStack {
                Spacer()
                ControlButtonsView(
                    playbackButtonAction: togglePlaybackState,
                    layoutButtonAction: toggleLayout,
                    isPaused: isPaused
                )
            }
        }
    }

    private func toggleLayout() {
        layout = layout == 3 ? 1 : layout + 1
        isPaused = false
        viewModel.updatePlayers(for: layout)
    }

    private func togglePlaybackState() {
        isPaused.toggle()
        isPaused ? viewModel.pausePlayers() : viewModel.playPlayers()
    }

    @ViewBuilder private func view(for layout: Int) -> some View {
        switch layout {
        case 1:
            LayoutOneView(
                player1: viewModel.player1,
                player2: viewModel.player2,
                player3: viewModel.player3
            )
        case 2:
            LayoutTwoView(
                player1: viewModel.player1,
                player2: viewModel.player2
            )
        case 3:
            LayoutThreeView(
                player1: viewModel.player1,
                player2: viewModel.player2
            )
        default:
            fatalError("Unsupported layout style: \(layout)")
        }
    }
}

struct PlayersListView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersListView()
    }
}
