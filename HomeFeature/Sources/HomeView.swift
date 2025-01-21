import SwiftUI
import RouterInterface

public struct HomeView : View {
	
	enum Destination: Hashable {
		case detail
	}

	@Environment(\.router) var router
	@State var path = NavigationPath()
	
	public init(){}
	
	public var body: some View {
		NavigationStack(path: $path) {
			VStack {
				Text("Hello, Home!")
				Button.init {
					path.append(Destination.detail)
				} label: {
					Text("Go to Detail")
				}
			}
			.navigationDestination(for: Destination.self) { destination in
				let route = switch destination {
				case .detail:
					Route.home(.detail("YEEHA DETAIL"))
				}
				router.route(route)
			}
		}
	}
	
}
