import RouterInterface
import SwiftUI

public struct HomeView: View {
  enum Destination: Hashable {
    case detail
  }

  @Environment(\.router) var router
  @State var path = NavigationPath()

  public init() {}

  public var body: some View {
    NavigationStack(path: self.$path) {
      VStack {
        Text("Hello, Home!")
        Button.init {
          self.path.append(Destination.detail)
        } label: {
          Text("Go to Detail")
        }
      }
      .navigationDestination(for: Destination.self) { destination in
        let route = switch destination {
        case .detail:
          Route.home(.detail("YEEHA DETAIL"))
        }
        self.router.route(route)
      }
    }
  }
}
