// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription
var pkgConfig: String? = nil

#if os(macOS)
    pkgConfig = "ncurses"
#endif

let package = Package(
  name:  "Curses",
  products: [
    .library(name: "Curses",
             type: .dynamic,
             targets: ["Curses"]),
  ], 
  targets: [
    .systemLibrary(name: "ncurses", pkgConfig: pkgConfig, providers: [.apt(["ncurses"]),.brew(["ncurses"])]),
    .target(name: "Curses", dependencies: ["ncurses"],cSettings: [.define("__NCURSES_H", .when(platforms: [.macOS])),
                                                                  ])
  ]
)

