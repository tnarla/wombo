//
//  GameViewController.swift
//  Wombo
//
//  Created by Trushitha Narla on 12/12/16.
//  Copyright (c) 2016 Trushitha Narla. All rights reserved.
//

import UIKit
import SpriteKit

class GameViewController: UIViewController {
    var scene: GameScene!
    var level: Level!
    
    func beginGame() {
        shuffle()
    }
    
    func shuffle() {
        let newLetters = level.shuffle()
        scene.addSprites(for: newLetters)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure the view.
        let skView = view as! SKView
        
        level = Level()
        
        // Create and configure the scene.
        scene = GameScene(size: skView.bounds.size)
        scene.level = level
        scene.addTiles()
        
        // Present the scene.
        skView.presentScene(scene)
        beginGame()
    }
    
    override var shouldAutorotate : Bool {
        return true
    }

    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden : Bool {
        return true
    }
}
