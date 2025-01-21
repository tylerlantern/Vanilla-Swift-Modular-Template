import ChatListFeature
import ExploreFeature
import HomeFeature
import ProfileFeature
import RouterInterface
import SwiftUI

enum Tab: Equatable {
  case home
  case explore
  case chatList
  case profile
}

public struct TabContainerView: View {
  @State var currentTab: Tab = .home
  @Environment(\.router) var router

  public init() {}

  public var body: some View {
    TabView(
      selection: self.$currentTab
    ) {
      HomeView()
        .navigationViewStyle(.stack)
        .navigationBarHidden(true)
        .tag(Tab.home)
        .tabItem {
          Text("Home")
        }

      NavigationStack {
        ExploreView()
      }
      .navigationViewStyle(.stack)
      .navigationBarHidden(true)
      .tag(Tab.explore)
      .tabItem {
        Text("Explore")
      }

      NavigationStack {
        ChatListView()
      }
      .navigationViewStyle(.stack)
      .navigationBarHidden(true)
      .tag(Tab.chatList)
      .tabItem {
        Text("Chat")
      }

      NavigationStack {
        ProfileView()
      }
      .navigationViewStyle(.stack)
      .navigationBarHidden(true)
      .tag(Tab.profile)
      .tabItem {
        Text("Profile")
      }
    }
  }
}
