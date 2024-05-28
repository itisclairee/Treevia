//
//  TriviaFunctions.swift
//  Treevia2
//
//  Created by Gennaro Iannicelli on 04/06/23.
//

import SwiftUI

func getUniqueRandomNumbers(min: Int, max: Int, count: Int) -> [Int] {
    var set = Set<Int>()
    while set.count < count {
        set.insert(Int.random(in: min...max))
    }
    return Array(set)
}

