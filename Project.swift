import ProjectDescription

let project = Project(
    name: "CandleHub",
    targets: [
        .target(
            name: "CandleHub",
            destinations: .iOS,
            product: .app,
            bundleId: "io.tuist.CandleHub",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["CandleHub/Sources/**"],
            resources: ["CandleHub/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "CandleHubTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "io.tuist.CandleHubTests",
            infoPlist: .default,
            sources: ["CandleHub/Tests/**"],
            resources: [],
            dependencies: [.target(name: "CandleHub")]
        ),
    ]
)
