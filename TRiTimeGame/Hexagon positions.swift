//
//  Hexagon positions.swift
//  TRiTimeGame
//
//  Created by Milo Ullman on 8/4/24.
//

import Foundation

func outputpositions() -> [(Double, Double)] {
    var outputs: [(Double, Double)] = []
    let sx:Double = 24
    let sy:Double = 18
    
    for y in -8...8 {
        for x in -13...14 {
            if !((-y).isMultiple(of: 2)) {
                outputs.append((sx*Double(x), Double(sy)*Double(-y)))
            } else {
                outputs.append((sx*Double(x)-Double(12), sy*Double(-y)))
            }
        }
    }
    
    return outputs
}
