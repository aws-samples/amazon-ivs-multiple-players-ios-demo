import Foundation

extension PlayersListView {
    class ViewModel {
        var player1 = PlayerModel(delegate: PlayerDelegateViewController())
        var player2 = PlayerModel(delegate: PlayerDelegateViewController())
        var player3 = PlayerModel(delegate: PlayerDelegateViewController())

        private let videoUrls = [
            "https://4c62a87c1810.us-west-2.playback.live-video.net/api/video/v1/us-west-2.049054135175.channel.QidZjoGOhfDp.m3u8",
            "https://4c62a87c1810.us-west-2.playback.live-video.net/api/video/v1/us-west-2.049054135175.channel.LaSuL3bHBRR7.m3u8",
            "https://4c62a87c1810.us-west-2.playback.live-video.net/api/video/v1/us-west-2.049054135175.channel.rqyuAWXUrvUS.m3u8",
            "https://4c62a87c1810.us-west-2.playback.live-video.net/api/video/v1/us-west-2.049054135175.channel.FMaC7IMoyDEA.m3u8",
            "https://4c62a87c1810.us-west-2.playback.live-video.net/api/video/v1/us-west-2.049054135175.channel.WP4bWqiALo67.m3u8",
            "https://4c62a87c1810.us-west-2.playback.live-video.net/api/video/v1/us-west-2.049054135175.channel.HPz5Ug1fjNTO.m3u8",
            "https://4c62a87c1810.us-west-2.playback.live-video.net/api/video/v1/us-west-2.049054135175.channel.iNMK0w9JnUkC.m3u8"
        ]

        func updatePlayers(for layout: Int) {
            switch layout {
            case 1:
                player1.play(videoUrls[0], maxAllowedQuality: .medium)
                player2.play(videoUrls[1], maxAllowedQuality: .low)
                player3.play(videoUrls[2], maxAllowedQuality: .low)
            case 2:
                player1.play(videoUrls[3], maxAllowedQuality: .medium)
                player2.play(videoUrls[4], maxAllowedQuality: .medium)
            case 3:
                player1.play(videoUrls[5], maxAllowedQuality: .medium)
                player2.play(videoUrls[6], maxAllowedQuality: .low)
            default:
                fatalError("Unsupported layout style: \(layout)")
            }
        }

        func pausePlayers() {
            player1.player?.pause()
            player2.player?.pause()
            player3.player?.pause()
        }

        func playPlayers() {
            player1.player?.play()
            player2.player?.play()
            player3.player?.play()
        }
    }
}
