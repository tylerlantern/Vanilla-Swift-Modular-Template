import SwiftUI
import TabContainerFeature
import RouterInterface
import RouterImpl

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
