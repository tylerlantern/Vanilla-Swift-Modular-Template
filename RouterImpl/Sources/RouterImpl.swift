import DetailFeature
import RouterInterface
import SwiftUI

extension Router {
  public static let liveValue: Router = .init { route in
    AnyView(RouteView(route: route))
  }
}

struct RouteView: View {
  let route: Route

  var body: some View {
    switch self.route {
    case let .home(.detail(title)):
      DetailView(title: title)
    case .home(.profile(_)):
      Text("Profile")
    case let .explore(exploreRoute):
      EmptyView()
    }
  }
}
