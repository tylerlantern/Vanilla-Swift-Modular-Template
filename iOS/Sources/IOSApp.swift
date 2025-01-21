import RouterImpl
import RouterInterface
import SwiftUI
import TabContainerFeature

@main
struct IOSApp: App {
  var body: some Scene {
    WindowGroup {
      TabContainerView()
        .environment(
          \.router,
          Router.liveValue
        )
    }
  }
}
