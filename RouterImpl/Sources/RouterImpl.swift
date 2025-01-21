import SwiftUI
import RouterInterface
import DetailFeature

extension Router {
	public static let liveValue: Router = .init { route in
		AnyView(RouteView(route: route))
	}
}

struct RouteView: View {
	let route: Route
	
	var body: some View {
		switch route {
		case .home(.detail(let title)):
			DetailView(title: title)
		case .home(.profile(_)):
			Text("Profile")
		case .explore(let exploreRoute):
			EmptyView()
		}
	}
}
