//
//  TrieNode.swift
//  Wombo
//
//  Created by Sahil Prasad on 1/12/17.
//  Copyright © 2017 Trushitha Narla. All rights reserved.
//

import Foundation

class TrieNode<T : Hashable> {
    
    var value : T?
    var terminal = false
    
    weak var parent: TrieNode?
    private var children : [T : TrieNode]
    
    init(value: T? = nil, parent: TrieNode? = nil) {
        self.value = value
        self.parent = parent
        self.children = [:]
    }
    
    public func addChild(childValue: T) -> Bool {
        guard children[childValue] == nil else {
            return false
        }
        
        children[childValue] = TrieNode(value: childValue,
                                        parent: self)
        return true
    }
    
    public func hasChild(child: T) -> Bool {
        if children[child] == nil {
            return false
        } else {
            return true
        }
    }
    
    public func getChild(child: T) -> TrieNode? {
        guard children[child] != nil else {
            return nil
        }
        
        return children[child]
    }
    
    public func getChildren() -> [T : TrieNode] {
        let copy = children
        return copy
    }
    
    public func setTerminal(terminal: Bool) {
        self.terminal = terminal
    }

}
