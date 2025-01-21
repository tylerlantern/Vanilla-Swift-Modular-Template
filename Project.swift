import ProjectDescription

let project = Project(
	name: "iOS",
	targets: [
		.target(
			name: "iOS",
			destinations: .iOS,
			product: .app,
			bundleId: "io.tuist.iOS",
			infoPlist: .extendingDefault(
				with: [
					"UILaunchScreen": [
						"UIColorName": "",
						"UIImageName": "",
					],
				]
			),
			sources: ["iOS/Sources/**"],
			resources: ["iOS/Resources/**"],
			dependencies: [
				.target(name: "TabContainerFeature"),
				.target(name: "RouterInterface"),
				.target(name: "RouterImpl")
      ]
		),
		.target(
			name: "RouterInterface",
			destinations: .iOS,
			product: .framework,
			bundleId: "io.tuist.RouterInterface",
			infoPlist: .default,
			sources: ["RouterInterface/Sources/**"],
			dependencies: []
		),
		.target(
			name: "RouterImpl",
			destinations: .iOS,
			product: .framework,
			bundleId: "io.tuist.RouterImpl",
			infoPlist: .default,
			sources: ["RouterImpl/Sources/**"],
			dependencies: [
				.target(name: "RouterInterface"),
				.target(name: "DetailFeature")
			]
		),
		.target(
			name: "TabContainerFeature",
			destinations: .iOS,
			product: .framework,
			bundleId: "io.tuist.TabContainerFeature",
      infoPlist: .default,
      sources: ["TabContainerFeature/Sources/**"],
			dependencies: [
				.target(name: "HomeFeature"),
				.target(name: "ExploreFeature"),
				.target(name: "ChatListFeature"),
				.target(name: "ProfileFeature"),
				.target(name: "RouterInterface")
			]
		),
		.target(
			name: "HomeFeature",
			destinations: .iOS,
			product: .framework,
			bundleId: "io.tuist.HomeFeature",
      infoPlist: .default,
      sources: ["HomeFeature/Sources/**"],
			dependencies: []
		),
		.target(
			name: "DetailFeature",
			destinations: .iOS,
			product: .framework,
			bundleId: "io.tuist.DetailFeature",
			infoPlist: .default,
			sources: ["DetailFeature/Sources/**"],
			dependencies: []
		),
		.target(
			name: "ExploreFeature",
			destinations: .iOS,
			product: .framework,
			bundleId: "io.tuist.ExploreFeature",
      infoPlist: .default,
      sources: ["ExploreFeature/Sources/**"],
			dependencies: []
		),
		.target(
			name: "ChatListFeature",
			destinations: .iOS,
			product: .framework,
			bundleId: "io.tuist.ChatListFeature",
      infoPlist: .default,
      sources: ["ChatListFeature/Sources/**"],
			dependencies: []
		),
		.target(
			name: "ProfileFeature",
			destinations: .iOS,
			product: .framework,
			bundleId: "io.tuist.ProfileFeature",
      infoPlist: .default,
      sources: ["ProfileFeature/Sources/**"],
			dependencies: []
		),
		.target(
			name: "iOSTests",
			destinations: .iOS,
			product: .unitTests,
			bundleId: "io.tuist.iOSTests",
			infoPlist: .default,
			sources: ["iOS/Tests/**"],
			resources: [],
			dependencies: [.target(name: "iOS")]
		),
	]
)
