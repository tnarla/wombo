//
//  Trie.swift
//  Wombo
//
//  Created by Sahil Prasad on 1/12/17.
//  Copyright © 2017 Trushitha Narla. All rights reserved.
//

import Foundation

class Trie {
    
    typealias Node = TrieNode<Character>
    
    fileprivate let root : Node
    
    init() {
        self.root = Node()
    }
    
    public func insert(word: String) {
        guard !word.isEmpty else {
            return
        }
        
        self._insert(node: root, word: word, start: 0)
    }
    
    public func insertAll(words: Array<String>) {
        for word in words {
            insert(word: word)
        }
    }
    
    private func _insert(node: Node, word: String, start: Int) {
        if start == word.length {
            node.setTerminal(terminal: true)
            return
        }
        
        let char = word[start]
        if !node.hasChild(child: char) {
            node.addChild(childValue: char)
        }
        
        return _insert(node: node.getChild(child: char)!, word: word,
                       start: start + 1)
    }
    
    public func findPrefix(prefix: String) -> Node? {
        guard !prefix.isEmpty else {
            return nil
        }
        
        return _findPrefix(prefix: prefix, index: 0, node: root)
    }
    
    private func _findPrefix(prefix: String, index: Int, node: Node) -> Node? {
        if index == prefix.length {
            return node
        } else {
            let char = prefix[index]
            if !node.hasChild(child: char) {
                return nil
            }
            
            return _findPrefix(prefix: prefix, index: index + 1,
                               node: node.getChild(child: char)!)
        }
    }
    
    public func prefixMatch(prefix: String) -> Set<String> {
        let start = findPrefix(prefix: prefix)
        return _findMatches(start: start, acc: prefix)
    }
    
    private func _findMatches(start: Node?, acc: String) -> Set<String> {
        var matches = Set<String>()
        if let current = start {
            if current.terminal {
                matches.insert(acc)
            }
            
            for (char, node) in current.getChildren() {
                for match in _findMatches(start: node, acc: acc + String(char)) {
                    matches.insert(match)
                }
            }
        }
        
        return matches
    }
}






