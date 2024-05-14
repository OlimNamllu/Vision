//
//  Adjacent Hex.swift
//  TRiTimeGame
//
//  Created by Milo Ullman on 9/4/24.
//

import Foundation


func findAdj(hex: Int) -> [String] {
    var adj: [String] = []
    
    if hex % 56 > 28 {
        adj.append("Hex \(hex+1)")
        adj.append("Hex \(hex-1)")
        adj.append("Hex \(hex-27)")
        adj.append("Hex \(hex-28)")
        adj.append("Hex \(hex+28)")
        adj.append("Hex \(hex+29)")
    } else {
        adj.append("Hex \(hex+1)")
        adj.append("Hex \(hex-1)")
        adj.append("Hex \(hex-29)")
        adj.append("Hex \(hex-28)")
        adj.append("Hex \(hex+28)")
        adj.append("Hex \(hex+27)")
    }
    
    return adj
}

func findVision(hex: Int, range: Int) -> [String] {
    var vision: [String] = findAdj(hex: hex)
    
    guard range > 1 else {
        return vision
    }
    
    for _ in 1...range-1 {
        for tile in vision {
            vision.append(contentsOf: findAdj(hex: Int(tile.dropFirst(4))!))
        }
    }
    
    return removeDuplicateElements(arr: vision)
    
    
}

func findMoves(hex: Int, speed: Int) -> [String] {
    var moves: [String] = []
    
        moves.append(contentsOf: findVision(hex: hex, range: speed))
    
    moves = moves.filter({
        guard $0 != "Hex \(hex)" else {
            return false
        }
        return true
    })
    
    return moves
}
