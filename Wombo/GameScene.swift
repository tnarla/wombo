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
    
    private var dragFromColumn =  [Int]()
    private var dragFromRow = [Int]()
    
    // change this to be porportional to the screen size
    let TileWidth: CGFloat = 44.0
    let TileHeight: CGFloat = 48.0
    
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
//        gameLayer.addChild(tilesLayer)
        lettersLayer.position = layerPosition
        gameLayer.addChild(lettersLayer)
        dragFromColumn = []
        dragFromRow = []
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
            y: CGFloat(row)*TileHeight + TileHeight/4)
    }
    
    /*
     Input: CGPoint
     Output: Coverts CGPoint into column and row numbers
    */
    func convertPoint(point: CGPoint) -> (success: Bool, column: Int, row: Int) {
        if point.x >= 0 && point.x < CGFloat(NumColumns)*TileWidth &&
            point.y >= 0 && point.y < CGFloat(NumRows)*TileHeight {
            return (true, Int(point.x / TileWidth), Int(point.y / TileHeight))
        } else {
            return (false, 0, 0)  // invalid location
        }
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
        // 1
        guard let touch = touches.first else { return }
        let location = touch.location(in: lettersLayer)
        // 2
        let (success, column, row) = convertPoint(point: location)
        if success {
            dragFromColumn.append(column)
            dragFromRow.append(row)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard dragFromColumn != [] else {return}
        
        guard let touch = touches.first else {return}
        let location = touch.location(in: lettersLayer)
        
        let (success, column, row) = convertPoint(point: location)
        
        print(dragFromColumn.last!)
        if success {
            var horizDelta = 0, vertDelta = 0
            
            if dragFromColumn.last! < column && abs(dragFromColumn.last! - column) == 1{
                horizDelta = 1
            }
            else if dragFromColumn.last! > column && abs(dragFromColumn.last! - column) == 1 {
                horizDelta = -1
            }
            else if dragFromRow.last! < row && abs(dragFromRow.last! - row) == 1 {
                vertDelta = 1
            }
            else if dragFromRow.last! > row && abs(dragFromRow.last! - row) == 1 {
                vertDelta = -1
            }
            
            print(column)
            print(row)
            
        }
        
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        dragFromColumn = []
        dragFromRow = []
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchesEnded(touches, with: event)
    }
   
    override func update(_ currentTime: TimeInterval) {
        /* Called before each frame is rendered */
    }
}
