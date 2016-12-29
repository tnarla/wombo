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
    
    override func didMoveToView(view: SKView) {
        self.backgroundColor = backgroundColorCustom
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
