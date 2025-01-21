import Router
import RouterLive
import SwiftUI

@main
struct IOSApp: App {
  var body: some Scene {
    WindowGroup {
      Router.liveValue.route(.tabContainer)
        .environment(\.router, Router.liveValue)
    }
  }
}
