import AmazonIVSPlayer

class PlayerModel: Hashable {
    let url: String
    let playerDelegate: IVSPlayer.Delegate?

    var playerView: IVSPlayerView?
    var player: IVSPlayer?
    var maxQuality: MaxQuality

    init(delegate: IVSPlayer.Delegate?) {
        self.url = ""
        self.maxQuality = .high
        self.playerDelegate = delegate

        if let delegate = delegate as? PlayerDelegateViewController {
            delegate.playerModel = self
        }
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(url)
        hasher.combine(playerView)
        hasher.combine(player)
    }

    static func == (lhs: PlayerModel, rhs: PlayerModel) -> Bool {
        return lhs.url == rhs.url && lhs.playerView == rhs.playerView && lhs.player == rhs.player
    }

    func availableQualitiesChanged(_ qualities: [IVSQuality]) {
        let max = qualities
            .filter { $0.name.contains(maxQuality.rawValue) }
            .first
        player?.setAutoMaxQuality(max)
    }

    func play(_ stringUrl: String, maxAllowedQuality: MaxQuality = .high) {
        maxQuality = maxAllowedQuality
        player = IVSPlayer()
        playerView = IVSPlayerView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))

        player?.delegate = playerDelegate
        player?.muted = true

        playerView?.player = player
        playerView?.videoGravity = .resizeAspectFill

        if let url = URL(string: stringUrl) {
            player?.load(url)
        }
    }
}
