#!/usr/bin/swift
//
//  Created by Jonathan Badger on 12/22/21.
//

import Foundation

print("Looking for local ncurses installation...")
let fileManager = FileManager.default
let ncursesPath = "/usr/local/Cellar/ncurses"
if !fileManager.fileExists(atPath: ncursesPath) {
    print("Could not find ncurses library at \(ncursesPath)! Please install using Homebrew 'brew install ncurses'.")
    exit(1)
}
do {
    let contents = try fileManager.contentsOfDirectory(at: URL(fileURLWithPath: ncursesPath), includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
    let version  = contents[0].lastPathComponent
    
    print("Found version \(version) at \(ncursesPath)")
    print("Copying header files...")
    let includePath = [ncursesPath, version, "include"].joined(separator: "/")
    print(includePath)
    var process = Process()
    process.executableURL = URL(fileURLWithPath: "/bin/cp")
    process.arguments = ["-r", includePath, "Sources/Cncurses"]
    try process.run()
    process.waitUntilExit()
    print("Fixing headers...")
    //couldn't get sed to work from swift as escaping is not done
    process = Process()
    let fixHeadersPath = fileManager.currentDirectoryPath
    process.executableURL = URL(fileURLWithPath: fixHeadersPath.appending("/fix_headers.sh"))
    try process.run()
    process.waitUntilExit()
    print("Success.  Headers imported and fixed.")
    
} catch {
    print(error.localizedDescription)
}




