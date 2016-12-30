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
    let tilesLayer = SKNode()
    
    override func didMove(to view: SKView) {
        self.backgroundColor = backgroundColorCustom
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        anchorPoint = CGPoint(x: 0.5, y: 0.5)
        
        addChild(gameLayer)
        
        let layerPosition = CGPoint(
            x: -TileWidth * CGFloat(NumColumns) / 2,
            y: -TileHeight * CGFloat(NumRows) / 2)
        
//        tilesLayer.position = layerPosition
//        tilesLayer.zPosition = -5
//        gameLayer.addChild(tilesLayer)
        lettersLayer.position = layerPosition
        gameLayer.addChild(lettersLayer)
    }
    
    func addSprites(for letters: Set<Letter>) {
        for letter in letters {
            let sprite = SKSpriteNode(imageNamed: letter.letterType.spriteName)
            sprite.size = CGSize(width: TileWidth, height: TileHeight)
            sprite.position = pointFor(column: letter.column, row: letter.row)
            lettersLayer.addChild(sprite)
            letter.sprite = sprite
        }
    }
    
    func pointFor(column: Int, row: Int) -> CGPoint {
        return CGPoint(
            x: CGFloat(column)*TileWidth + TileWidth/2,
            y: CGFloat(row)*TileHeight + TileHeight/2)
    }
    
    func addTiles() {
        for row in 0..<NumRows {
            for column in 0..<NumColumns {
                let tileNode = SKSpriteNode(imageNamed: "Tile")
                tileNode.size = CGSize(width: TileWidth, height: TileHeight)
                tileNode.position = pointFor(column: column, row: row)
                tilesLayer.addChild(tileNode)
            }
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
       /* Called when a touch begins */
        
//        for touch in touches {
//            let location = touch.locationInNode(self)
//        }
    }
   
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
