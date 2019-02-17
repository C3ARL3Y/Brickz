//
//  StoreScene.swift
//  Brickz
//
//  Created by Julian Cearley on 6/9/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import SpriteKit
import UIKit

class StoreScene: SKScene {
    
    let background = SKSpriteNode(imageNamed: "titleBackground")
    let storeTitle = SKSpriteNode(imageNamed: "")
    
    let ballBtn = SKSpriteNode(imageNamed: "ballzBtn")
    let paddleBtn = SKSpriteNode(imageNamed: "paddlezBtn")
    
    override func didMove(to view: SKView) {
        
        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        background.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        background.zPosition = 0
        self.addChild(background)
        
        ballBtn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ballBtn.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 + (ballBtn.size.height * 1))
        ballBtn.name = "ballBtn"
        ballBtn.zPosition = 1
        ballBtn.color = SKColor.yellow
        self.addChild(ballBtn)
        
        paddleBtn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        paddleBtn.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2 - (paddleBtn.size.height * 1))
        paddleBtn.name = "paddleBtn"
        paddleBtn.zPosition = 1
        paddleBtn.color = SKColor.red
        self.addChild(paddleBtn)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if touchedNode.name == "ballBtn" {
                let scene = BallStoreScene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 1)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            }
            
            if touchedNode.name == "paddleBtn" {
                let scene = PaddleStoreScene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 1)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            }
            
        }
    }
    
}
