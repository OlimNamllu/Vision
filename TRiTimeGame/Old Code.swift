//
//  Old Code.swift
//  TRiTimeGame
//
//  Created by Milo Ullman on 12/4/24.
//

import Foundation

//var index = 0
//while index < hexagons.count-1 {
//    if let hexin = hexagons[index] {
//        if hexin.contains(touch.location(in: self)) {
//            let name = hexin.name?.dropFirst(4)
//            let number = Int(name!)
//
//            let vision = findVision(hex: number!, range: 2)
//
//            for hex in hexagons {
//                if let hex = hex {
//                    if vision.contains(hex.name!) {
//                        if let id = hexagons.firstIndex(where: { hex == $0 ? true : false }) {
//                            hex.removeFromParent()
//                            hexagons[id] = SKSpriteNode(texture: SKTexture(imageNamed: "Red"), size: CGSize(width: 23.9, height: 23.9), name: hex.name!, position: hex.position)
//                            addChild(hexagons[id]!)
//                        }
//                    }
//                }
//            }
//        }
//    }
//    index += 1
//}

//        for child in children {
//            if child.name == "Icon" {
//
//                child.removeFromParent()
//            }
//        }


//        for tile in vision {
//            let number = Int(tile.dropFirst(4))!
//            let icon = SKSpriteNode(texture: SKTexture(imageNamed: "IDK"), size: CGSize(width: 20, height: 20), name: "Icon", position: (hexagons[number-1]?.position)!)
//            icon.zPosition = 20
//            addChild(icon)
//        }
