import AmazonIVSPlayer
import SwiftUI

struct PlayerView: View {
    var playerModel: PlayerModel

    var body: some View {
        IVSPlayerViewWrapper(playerModel: playerModel)
            .background(Color(.sRGB, red: 0.1, green: 0.1, blue: 0.1, opacity: 1))
            .cornerRadius(10)
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView(playerModel: PlayerModel(delegate: PlayerDelegateViewController()))
    }
}
