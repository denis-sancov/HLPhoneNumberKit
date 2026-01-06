// swift-tools-version: 5.5
import PackageDescription

let package = Package(
    name: "HLPhoneNumberKit",
    platforms: [
        .iOS(.v12), .macOS(.v10_13), .tvOS(.v12), .watchOS(.v4)
    ],
    products: [
        .library(name: "HLPhoneNumberKit", targets: ["HLPhoneNumberKit"]),
        .library(name: "HLPhoneNumberKit-Static", type: .static, targets: ["HLPhoneNumberKit"]),
        .library(name: "HLPhoneNumberKit-Dynamic", type: .dynamic, targets: ["HLPhoneNumberKit"])
    ],
    targets: [
        .target(name: "HLPhoneNumberKit",
                path: "HLPhoneNumberKit",
                exclude: ["Resources/Original",
                          "Resources/README.md",
                          "Resources/update_metadata.sh",
                          "Info.plist"],
                resources: [
                    .process("Resources/PhoneNumberMetadata.json"),
                    .copy("Resources/PrivacyInfo.xcprivacy")
                ]),
        .testTarget(name: "HLPhoneNumberKitTests",
                    dependencies: ["HLPhoneNumberKit"],
                    path: "HLPhoneNumberKitTests",
                    exclude: ["Info.plist"])
    ]
)
