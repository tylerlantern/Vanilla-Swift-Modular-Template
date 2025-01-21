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
