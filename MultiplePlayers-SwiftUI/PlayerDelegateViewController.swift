import AmazonIVSPlayer

class PlayerDelegateViewController: UIViewController, IVSPlayer.Delegate {
    var playerModel: PlayerModel?

    func player(_ player: IVSPlayer, didChangeState state: IVSPlayer.State) {
        if state == .ready {
            player.play()
            playerModel?.availableQualitiesChanged(player.qualities)
        }
    }
}
