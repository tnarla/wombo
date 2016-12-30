//
//  Array2D.swift
//  Wombo
//
//  Created by Trushitha Narla on 12/29/16.
//  Copyright © 2016 Trushitha Narla. All rights reserved.
//

import Foundation

struct Array2D<T> {
    let columns: Int
    let rows: Int
    var array: Array<T?>
    
    init(columns: Int, rows: Int) {
        self.columns = columns
        self.rows = rows
        array = Array<T?>(repeating: nil, count: rows*columns)
    }
    
    subscript(column: Int, row: Int) -> T? {
        get {
            return array[row*columns + column]
        }
        set {
            array[row*columns + column] = newValue
        }
    }
}
