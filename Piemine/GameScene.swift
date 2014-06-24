//
//  GameScene.swift
//  Piemine
//
//  Created by dylan on 6/23/14.
//  Copyright (c) 2014 whoisdylan. All rights reserved.
//

import SpriteKit

let kWorldTileDivisor = 32  // number of tiles
let kWorldSize = 4096       // pixel size of world (square)
let kWorldTileSize = (kWorldSize / kWorldTileDivisor)

let kWorldCenter = 2048

let kLevelMapSize = 256    // pixel size of level map (square)
let kLevelMapDivisor = (kWorldSize / kLevelMapSize)

class GameScene: SKScene {
    
    var backgroundTiles: SKSpriteNode[]
    
    init(size: CGSize) {
        backgroundTiles = Array<SKSpriteNode>()
        super.init(size: size)
        loadAssets()
    }
    
    func loadAssets() {
        let tileAtlas = SKTextureAtlas(named: "Background")
        
        for row in 0..kWorldTileDivisor {
            for col in 0..kWorldTileDivisor {
                let tileNode = SKSpriteNode(texture: tileAtlas.textureNamed("tile5.png"))
                let xPos = row * kWorldTileSize - kWorldCenter
                let yPos = kWorldSize - col * kWorldTileSize - kWorldCenter
                tileNode.position = CGPointMake(Float(xPos), Float(yPos))
//                tileNode.position = CGPointMake(x: row * kWorldTileSize - kWorldCenter, y: (kWorldSize - (col * kWorldTileSize)) - kWorldCenter)
                tileNode.zPosition = -1.0
                tileNode.blendMode = .Replace
                backgroundTiles.append(tileNode)
            }
        }
    }
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        
        self.addChild(myLabel)
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
