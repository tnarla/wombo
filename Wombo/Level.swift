//
//  Level.swift
//  Wombo
//
//  Created by Trushitha Narla on 12/29/16.
//  Copyright © 2016 Trushitha Narla. All rights reserved.
//

import Foundation

let NumColumns = 9
let NumRows = 9

class Level {
    var letters = Array2D<Letter>(columns: NumColumns, rows: NumRows)
    
    func letterAt(column: Int, row: Int) -> Letter? {
        assert(column >= 0 && column < NumColumns)
        assert(row >= 0 && row < NumRows)
        return letters[column, row]
    }
    
    func shuffle() -> Set<Letter> {
        return createInitialLetters()
    }
    
    private func createInitialLetters() -> Set<Letter> {
        var set = Set<Letter>()
        
        // 1
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                
                // 2
                let letterType = LetterType.random()
                
                // 3
                let letter = Letter(column: column, row: row, letter: letterType)
                letters[column, row] = letter
                
                // 4
                set.insert(letter)
            }
        }
        return set
    }
}

