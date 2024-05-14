//
//  GameScene.swift
//  TRiTimeGame
//
//  Created by Milo Ullman on 8/4/24.
//

import SpriteKit



class GameScene: SKScene {
    
    var hexagons: [SKNode?] = []
    var rings: [SKNode?] = []
    var spaceship: SKNode? = nil
    var spaceship2: SKNode? = nil
    var moveSpeed: Int = 3
    var visionRange: Int = 3
    
    
    override func didMove(to view: SKView) {
        var hexNumber = 0
        let tile = SKTexture(imageNamed: "Hexagon")
        let spaceshipTexture = SKTexture(imageNamed: "Spaceship")
        
        for pos in outputpositions() {
            hexNumber += 1
            var hex: SKNode! = nil
            hex = SKSpriteNode(texture: tile, size: CGSize(width: 23.9, height: 23.9))
            hex.position = CGPoint(x: pos.0, y: pos.1)
            print(hex.position)
            addChild(hex)
            hex.name = "Hex \(hexNumber)"
            hexagons.append(hex)
        }
        
        spaceship = SKSpriteNode(texture: spaceshipTexture, size: CGSize(width: 22, height: 22), name: "Spaceship", position: hexagons[200]!.position)
        spaceship!.zPosition = 5
        
        spaceship2 = SKSpriteNode(texture: spaceshipTexture, size: CGSize(width: 22, height: 22), name: "Spaceship 202", position: hexagons[202]!.position)
        spaceship2!.zPosition = 5
        
        spaceship2?.alpha = 1
        
        
        let adj = findMoves(hex: 200+1, speed: moveSpeed)
        
        for hexagon in hexagons {
            if let name = hexagon?.name {
                if adj.contains(name) {
                    let ring: SKNode = SKSpriteNode(texture: SKTexture(imageNamed: "Ring"), size: CGSize(width: 18, height: 18), name: "Ring \(name.dropFirst(4))", position: hexagon!.position)
                    ring.zPosition = 5
                    addChild(ring)
                    rings.append(ring)
                }
            }
        }
        addChild(spaceship2!)
        addChild(spaceship!)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        
        for ring in rings {
            guard ring != nil else { return }
            
            if ring!.contains(touch.location(in: self)) {
                spaceship?.position = ring!.position
                spaceship?.name = "Hex \(ring!.name!.dropFirst(5))"
                for ring in rings {
                    ring?.removeFromParent()
                }
                rings = []
                
                let adj = findMoves(hex: Int((ring?.name?.dropFirst(5))!)!, speed: moveSpeed)
                
                for hexagon in hexagons {
                    if let name = hexagon?.name {
                        if adj.contains(name) {
                            let ring: SKNode = SKSpriteNode(texture: SKTexture(imageNamed: "Ring"), size: CGSize(width: 18, height: 18), name: "Ring \(name.dropFirst(4))", position: hexagon!.position)
                            ring.zPosition = 5
                            addChild(ring)
                            rings.append(ring)
                        }
                    }
                }
                
                
            }
        }
        
        let vision = findVision(hex: Int((spaceship?.name?.dropFirst(4))!)!, range: visionRange)
        
        

        
        print(vision)
        
        for tile in vision {
            let number = Int(tile.dropFirst(4))!-1
            
            if number == 202 {
                spaceship2?.alpha = 1
                break
            }
            spaceship2?.alpha = 0
            
            
        }
        
//        for tile in vision {
//            let number = Int(tile.dropFirst(4))!
//            let icon = SKSpriteNode(texture: SKTexture(imageNamed: "IDK"), size: CGSize(width: 20, height: 20), name: "Icon", position: (hexagons[number-1]?.position)!)
//            icon.zPosition = 20
//            addChild(icon)
//        }
    }
    
    
}


extension SKSpriteNode {
    convenience init(texture: SKTexture, size: CGSize, name: String, position: CGPoint) {
        self.init(texture: texture, size: size)
        self.name = name
        self.position = position
    }
}
