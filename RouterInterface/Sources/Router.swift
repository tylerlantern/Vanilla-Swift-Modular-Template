import SwiftUI

public enum Route {
  case home(HomeRoute)
  case explore(ExploreRoute)

  public enum HomeRoute {
    case detail(String)
    case profile(String)
  }

  public enum ExploreRoute {
    case detail(String)
  }
}

public struct Router {
  public let route: (Route) -> AnyView

  public init(route: @escaping (Route) -> AnyView) {
    self.route = route
  }
}

extension Router: EnvironmentKey {
  public static let defaultValue: Router = .init { _ in
    AnyView(EmptyView())
  }
}

extension EnvironmentValues {
  public var router: Router {
    get { self[Router.self] }
    set { self[Router.self] = newValue }
  }
}

// extension Router: EnvironmentKey {
//	public static let defaultValue: Router = .init { route in
//		//    AnyView(Text("Yeeha"))
//		AnyView(RouteView(route: route))
//	}
// }
// struct RouteView: View {
//	let route: Route
//
//	var body: some View {
//		Text("Empty Route")
////		switch route {
////			case let .home(.detail(name, path, onUpdateName)):
////				DetailView(path: path, name: name, onUpdateName: onUpdateName)
////
////			case .home(.profile(let name)):
////				ProfileView(name: name)
////
////			case let .detail(.alert(name)):
////				Text(name)
////		}
//	}
// }
