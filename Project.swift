import ProjectDescription

let project = Project(
  name: "Clean-Swift-Template",
  targets: [
    .target(
      name: "AppCore",
      destinations: .iOS,
      product: .app,
      bundleId: "io.tuist.appcore",
      infoPlist: .extendingDefault(
        with: [
          "UILaunchScreen": [
            "UIColorName": "",
            "UIImageName": ""
          ]
        ]
      ),
      sources: ["AppCore/Sources/**"],
      resources: ["AppCore/Resources/**"],
      dependencies: [
        .target(name: "Router"),
        .target(name: "RouterLive")
      ],
      settings: .settings(
        base: [
          "PRODUCT_NAME": "DuckHorde"
        ]
      )
    ),
    // TEST Example
    //		.target(
    //			name: "iOSTests",
    //			destinations: .iOS,
    //			product: .unitTests,
    //			bundleId: "io.tuist.iOSTests",
    //			infoPlist: .default,
    //			sources: ["iOS/Tests/**"],
    //			resources: [],
    //			dependencies: [.target(name: "iOS")]
    //		)
    .target(
      name: "Router",
      destinations: .iOS,
      product: .framework,
      bundleId: "io.tuist.Router",
      infoPlist: .default,
      sources: ["Router/Sources/**"],
      dependencies: []
    ),
    .target(
      name: "RouterLive",
      destinations: .iOS,
      product: .framework,
      bundleId: "io.tuist.RouterLive",
      infoPlist: .default,
      sources: ["RouterLive/Sources/**"],
      dependencies: [
        .target(name: "Router"),
        // Features
        .target(name: "TabContainerFeature"),
        .target(name: "HomeFeature"),
        .target(name: "DetailFeature"),
        .target(name: "ExploreFeature"),
        .target(name: "ChatListFeature"),
        .target(name: "ProfileFeature"),
        .target(name: "CommentFeature"),
        .target(name: "ExpandedCommentFeature")
      ]
    ),
    .framework(
      name: "TabContainerFeature",
      dependencies: [
        .target(name: "Router")
      ]
    ),

    .framework(
      name: "HomeFeature",
      dependencies: [
        .target(name: "Router")
      ]
    ),
    .framework(
      name: "DetailFeature",
      dependencies: [
        .target(name: "Router")
      ]
    ),
    .framework(
      name: "CommentFeature",
      dependencies: [
        .target(name: "Router")
      ]
    ),
    .framework(
      name: "ExpandedCommentFeature",
      dependencies: [
        .target(name: "Router")
      ]
    ),

    .framework(
      name: "ExploreFeature",
      dependencies: [
        .target(name: "Router")
      ]
    ),
    .framework(
      name: "ChatListFeature",
      dependencies: [
        .target(name: "Router")
      ]
    ),
    .framework(
      name: "ProfileFeature",
      dependencies: [
        .target(name: "Router")
      ]
    )
  ]
)

public extension Target {
  static func framework(
    name: String,
    hasResource: Bool = false,
    dependencies: [TargetDependency] = []
  ) -> Target {
    .target(
      name: name,
      destinations: .iOS,
      product: .framework,
      bundleId: "io.tuist.\(name)",
      infoPlist: .default,
      sources: ["\(name)/Sources/**"],
      resources: hasResource ? ["\(name)/Resources/**"] : nil,
      dependencies: dependencies
    )
  }
}

public func productType() -> Product {
  if case let .string(productType) = Environment.productType {
    return productType == "static-library" ? .staticLibrary : .framework
  } else {
    return .framework
  }
}

public enum TargetInclude {
  case sources
  case resources
}
