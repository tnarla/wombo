//
//  Letter.swift
//  Wombo
//
//  Created by Trushitha Narla on 12/12/16.
//  Copyright © 2016 Trushitha Narla. All rights reserved.
//

import SpriteKit

enum LetterType: Int, CustomStringConvertible {
    case undefined = 0,a,b,c,d,e,f,g,h
    
    // TODO: Instead of random, have a way of getting the right porportion depending on the letter,
    // this porportion will be in a dictionary. Calculated beforehand.
    static func random() -> LetterType {
        return LetterType(rawValue: Int(arc4random_uniform(6)) + 1)!
    }
    
    var spriteName: String {
        let spriteNames = [
            "letter-A",
            "letter-B",
            "letter-C",
            "letter-D",
            "letter-E",
            "letter-F",
            "letter-G",
            "letter-H"]
        
        return spriteNames[rawValue - 1]
    }
    
    var highlightedSpriteName: String {
        return spriteName + "-Selected"
    }
    
    var description: String {
        return spriteName
    }
}

class Letter: CustomStringConvertible {
    var column: Int
    var row: Int
    let letter: LetterType
    var sprite: SKSpriteNode?
    
    init(column: Int, row: Int, letter: LetterType) {
        self.column = column
        self.row = row
        self.letter = letter
    }
    
    var description: String {
        return "type:\(letter) square:(\(column),\(row))"
    }
}