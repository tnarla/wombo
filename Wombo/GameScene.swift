//
//  GameScene.swift
//  Wombo
//
//  Created by Trushitha Narla on 12/12/16.
//  Copyright (c) 2016 Trushitha Narla. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    var backgroundColorCustom = UIColor(red:0.26, green:0.22, blue:0.39, alpha:1.0)
    
    var level: Level!
    
    let TileWidth: CGFloat = 32.0
    let TileHeight: CGFloat = 36.0
    
    let gameLayer = SKNode()
    let lettersLayer = SKNode()
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = backgroundColorCustom
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        addChild(gameLayer)
        
        let layerPosition = CGPoint(
            x: -TileWidth * CGFloat(NumColumns) / 2,
            y: -TileHeight * CGFloat(NumRows) / 2)
        
        lettersLayer.position = layerPosition
        gameLayer.addChild(lettersLayer)
    }
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
       /* Called when a touch begins */
        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
