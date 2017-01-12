//
//  WomboTests.swift
//  WomboTests
//
//  Created by Sahil Prasad on 1/12/17.
//  Copyright © 2017 Trushitha Narla. All rights reserved.
//

import XCTest

@testable import Wombo

class WomboTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testPrefixMatching() {
        let trie = Trie()
        trie.insertAll(words: ["cat", "cattle", "bat", "batman"])
        
        let catMatches = trie.prefixMatch(prefix: "cat")
        
        XCTAssert(catMatches.count == 2)
        XCTAssert(catMatches.contains("cat"))
        XCTAssert(catMatches.contains("cattle"))
        
        let batMatches = trie.prefixMatch(prefix: "bat")
        
        XCTAssert(batMatches.count == 2)
        XCTAssert(batMatches.contains("bat"))
        XCTAssert(batMatches.contains("batman"))
        
        let badMatches = trie.prefixMatch(prefix: "nothing")
        
        XCTAssert(badMatches.count == 0)
        
        let allMatches = trie.prefixMatch(prefix: "")
        
        XCTAssert(allMatches.isEmpty)
    }
    
    func testPrefixFinding() {
        let trie = Trie()
        trie.insertAll(words: ["cat", "cattle", "catastrophe", "catdaddy"])
        
        let t = trie.findPrefix(prefix: "cat")!
        
        XCTAssert(t.value == "t")
        XCTAssert(t.terminal)
        XCTAssert(t.hasChild(child: "t"))
        XCTAssert(t.hasChild(child: "a"))
        XCTAssert(t.hasChild(child: "d"))
        
        let exceeding = trie.findPrefix(prefix: "catastrophic")
        
        XCTAssert(exceeding == nil)
        
        let empty = trie.findPrefix(prefix: "")
        
        XCTAssert(empty == nil)
    }
    
    func testOverlap() {
        let trie = Trie()
        trie.insert(word: "catastrophe")
        
        var cat = trie.findPrefix(prefix: "cat")!
        
        XCTAssert(cat.value == "t")
        XCTAssert(!cat.terminal)
        XCTAssert(cat.hasChild(child: "a"))
        XCTAssert(cat.getChildren().count == 1)
        
        trie.insert(word: "cat")
        
        cat = trie.findPrefix(prefix: "cat")!
        
        XCTAssert(cat.value == "t")
        XCTAssert(cat.terminal)
        XCTAssert(cat.hasChild(child: "a"))
        XCTAssert(cat.getChildren().count == 1)
    }
    
}
