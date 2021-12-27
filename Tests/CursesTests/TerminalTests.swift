//
//  File.swift
//  
//
//  Created by Jonathan Badger on 12/27/21.
//


import Foundation
import XCTest


@testable import Curses

class TerminalTests: XCTestCase {
    var sut: Terminal!
    
    override func setUpWithError() throws {
        sut = Terminal()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func test_lines_populatesOnInit() {
        let lines = sut.lines
        print("hi")
    }
    
    
    
}
