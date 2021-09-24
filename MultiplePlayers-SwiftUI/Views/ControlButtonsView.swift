import SwiftUI

struct ControlButtonsView: View {
    let playbackButtonAction: () -> Void
    let layoutButtonAction: () -> Void
    let isPaused: Bool

    var body: some View {
        HStack(spacing: 10) {
            Button(action: {
                playbackButtonAction()
            }, label: {
                Image(isPaused ? "icon-play" : "icon-pause")
            })

            Button(action: {
                layoutButtonAction()
            }, label: {
                Image("icon-layout")
            })
        }
        .buttonStyle(PrimaryButtonStyle())
        .frame(width: 160, height: 60)
        .background(Color.white)
        .cornerRadius(50)
        .padding(.bottom, 20)
    }
}

struct ControlButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ControlButtonsView(playbackButtonAction: {}, layoutButtonAction: {}, isPaused: false)
        }
    }
}
