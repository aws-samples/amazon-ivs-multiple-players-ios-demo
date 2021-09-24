import SwiftUI

@main
struct MultiplePlayers_SwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                Color.black.ignoresSafeArea()
                PlayersListView()
            }
        }
    }
}
