//
//  TrieTests.swift
//  Wombo
//
//  Created by Sahil Prasad on 1/12/17.
//  Copyright © 2017 Trushitha Narla. All rights reserved.
//


class TrieTests {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testBasic() {
        let t1 = Trie()
        t1.insert(word: "cat")
        t1.insert(word: "bat")
        t1.insert(word: "batman")
        
        XCTAssertEqual(
    }
}
