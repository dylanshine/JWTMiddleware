// swift-tools-version:5.2
import PackageDescription

let package = Package(
    name: "JWTMiddleware",
    platforms: [
       .macOS(.v10_15),
    ],
    products: [
        .library(name: "JWTMiddleware", targets: ["JWTMiddleware"]),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/jwt.git", .branch("master")),
    ],
    targets: [
        .target(name: "JWTMiddleware", dependencies: [
            .product(name: "JWT", package: "jwt"),
        ]),
        .testTarget(name: "JWTMiddlewareTests", dependencies: [
            .target(name: "JWTMiddleware"),
        ])
    ]
)
