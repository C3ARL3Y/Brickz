//
//  Chapter1lvlSelectScene.swift
//  Brickz
//
//  Created by Julian Cearley on 1/23/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import UIKit
import SpriteKit

class Chapter1lvlSelectScene: SKScene, SKPhysicsContactDelegate {
    
    var ch1lvl2Unlocked = UserDefaults.standard.bool(forKey: "ch1lvl2Unlocked")
    var ch1lvl3Unlocked = UserDefaults.standard.bool(forKey: "ch1lvl3Unlocked")
    var ch1lvl4Unlocked = UserDefaults.standard.bool(forKey: "ch1lvl4Unlocked")
    var ch1lvl5Unlocked = UserDefaults.standard.bool(forKey: "ch1lvl5Unlocked")
    var ch1lvl6Unlocked = UserDefaults.standard.bool(forKey: "ch1lvl6Unlocked")
    var ch1lvl7Unlocked = UserDefaults.standard.bool(forKey: "ch1lvl7Unlocked")
    var ch1lvl8Unlocked = UserDefaults.standard.bool(forKey: "ch1lvl8Unlocked")
    var ch1lvl9Unlocked = UserDefaults.standard.bool(forKey: "ch1lvl9Unlocked")
    var ch1lvl10Unlocked = UserDefaults.standard.bool(forKey: "ch1lvl10Unlocked")
    
    let bg = SKSpriteNode(imageNamed: "ch1Background")
    
    let chapter1Title = SKSpriteNode(imageNamed: "ch1Title")
    
    let backBtn = SKSpriteNode(imageNamed: "backBtn")
    
    let lvl1Btn = SKSpriteNode(imageNamed: "ch1lvl1BtnImg"), lvl2Btn = SKSpriteNode(imageNamed: "ch1lvl2BtnImg"), lvl3Btn = SKSpriteNode(imageNamed: "ch1lvl3BtnImg"), lvl4Btn = SKSpriteNode(imageNamed: "ch1lvl4BtnImg"), lvl5Btn = SKSpriteNode(imageNamed: "ch1lvl5BtnImg"), lvl6Btn = SKSpriteNode(imageNamed: "ch1lvl6BtnImg"), lvl7Btn = SKSpriteNode(imageNamed: "ch1lvl7BtnImg"), lvl8Btn = SKSpriteNode(imageNamed: "ch1lvl8BtnImg"), lvl9Btn = SKSpriteNode(imageNamed: "ch1lvl9BtnImg"), lvl10Btn = SKSpriteNode(imageNamed: "ch1lvl10BtnImg")
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.physicsWorld.contactDelegate = self
        
        chapter1Title.size = CGSize(width: self.frame.width / 2, height: self.frame.height / 8)
        chapter1Title.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.15)
        chapter1Title.zPosition = 1
        self.addChild(chapter1Title)
        
        bg.size = CGSize(width: self.frame.width, height: self.frame.height)
        bg.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        bg.zPosition = 0
        self.addChild(bg)
        
        backBtn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        backBtn.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 10)
        backBtn.zPosition = 1
        backBtn.name = "backBtn"
        self.addChild(backBtn)
        
        if ch1lvl2Unlocked == false {
            lvl2Btn.color = SKColor.black
            lvl2Btn.colorBlendFactor = 0.8
        }
        lvl2Btn.size = CGSize(width: self.frame.width / 6, height: self.frame.width / 6)
        lvl2Btn.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.4)
        lvl2Btn.name = "lvl2Btn"
        lvl2Btn.zPosition = 1
        self.addChild(lvl2Btn)
        
        lvl1Btn.position = CGPoint(x: lvl2Btn.position.x - (lvl2Btn.size.width * 1.5), y: lvl2Btn.position.y)
        lvl1Btn.size = CGSize(width: self.frame.width / 6, height: self.frame.width / 6)
        lvl1Btn.name = "lvl1Btn"
        lvl1Btn.zPosition = 1
        self.addChild(lvl1Btn)
        
        if ch1lvl3Unlocked == false {
            lvl3Btn.color = SKColor.black
            lvl3Btn.colorBlendFactor = 0.8
        }
        lvl3Btn.position = CGPoint(x: lvl2Btn.position.x + (lvl2Btn.size.width * 1.5), y: lvl2Btn.position.y)
        lvl3Btn.size = CGSize(width: self.frame.width / 6, height: self.frame.width / 6)
        lvl3Btn.name = "lvl3Btn"
        lvl3Btn.zPosition = 1
        self.addChild(lvl3Btn)
        
        if ch1lvl4Unlocked == false {
            lvl4Btn.color = SKColor.black
            lvl4Btn.colorBlendFactor = 0.8
        }
        lvl4Btn.position = CGPoint(x: lvl1Btn.position.x, y: lvl1Btn.position.y - (lvl1Btn.size.height * 1.5))
        lvl4Btn.size = CGSize(width: self.frame.width / 6, height: self.frame.width / 6)
        lvl4Btn.name = "lvl4Btn"
        lvl4Btn.zPosition = 1
        self.addChild(lvl4Btn)
        
        if ch1lvl5Unlocked == false {
            lvl5Btn.color = SKColor.black
            lvl5Btn.colorBlendFactor = 0.8
        }
        lvl5Btn.position = CGPoint(x: lvl2Btn.position.x, y: lvl4Btn.position.y)
        lvl5Btn.size = CGSize(width: self.frame.width / 6, height: self.frame.width / 6)
        lvl5Btn.name = "lvl5Btn"
        lvl5Btn.zPosition = 1
        self.addChild(lvl5Btn)
        
        if ch1lvl6Unlocked == false {
            lvl6Btn.color = SKColor.black
            lvl6Btn.colorBlendFactor = 0.8
        }
        lvl6Btn.position = CGPoint(x: lvl3Btn.position.x, y: lvl5Btn.position.y)
        lvl6Btn.size = CGSize(width: self.frame.width / 6, height: self.frame.width / 6)
        lvl6Btn.name = "lvl6Btn"
        lvl6Btn.zPosition = 1
        self.addChild(lvl6Btn)
        
        if ch1lvl7Unlocked == false {
            lvl7Btn.color = SKColor.black
            lvl7Btn.colorBlendFactor = 0.8
        }
        lvl7Btn.position = CGPoint(x: lvl4Btn.position.x, y: lvl4Btn.position.y - (lvl4Btn.size.height * 1.5))
        lvl7Btn.size = CGSize(width: self.frame.width / 6, height: self.frame.width / 6)
        lvl7Btn.name = "lvl7Btn"
        lvl7Btn.zPosition = 1
        self.addChild(lvl7Btn)
        
        if ch1lvl8Unlocked == false {
            lvl8Btn.color = SKColor.black
            lvl8Btn.colorBlendFactor = 0.8
        }
        lvl8Btn.position = CGPoint(x: lvl5Btn.position.x, y: lvl7Btn.position.y)
        lvl8Btn.size = CGSize(width: self.frame.width / 6, height: self.frame.width / 6)
        lvl8Btn.name = "lvl8Btn"
        lvl8Btn.zPosition = 1
        self.addChild(lvl8Btn)
        
        if ch1lvl9Unlocked == false {
            lvl9Btn.color = SKColor.black
            lvl9Btn.colorBlendFactor = 0.8
        }
        lvl9Btn.position = CGPoint(x: lvl6Btn.position.x, y: lvl8Btn.position.y)
        lvl9Btn.size = CGSize(width: self.frame.width / 6, height: self.frame.width / 6)
        lvl9Btn.name = "lvl9Btn"
        lvl9Btn.zPosition = 1
        self.addChild(lvl9Btn)
        
        if ch1lvl10Unlocked == false {
            lvl10Btn.color = SKColor.black
            lvl10Btn.colorBlendFactor = 0.8
        }
        lvl10Btn.position = CGPoint(x: lvl8Btn.position.x, y: lvl8Btn.position.y - (lvl8Btn.size.height * 1.5))
        lvl10Btn.size = CGSize(width: self.frame.width / 6, height: self.frame.width / 6)
        lvl10Btn.name = "lvl10Btn"
        lvl10Btn.zPosition = 1
        self.addChild(lvl10Btn)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if touchedNode.name == "backBtn" {
            let scene = ChapterSelectScene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 0.5)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        }
        if touchedNode.name == "lvl1Btn" {
            let scene = ch1lvl1Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 0.5)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        }
        if touchedNode.name == "lvl2Btn" {
            if ch1lvl2Unlocked == true {
                let scene = ch1lvl2Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl3Btn" {
            if ch1lvl3Unlocked == true {
                let scene = ch1lvl3Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl4Btn" {
            if ch1lvl4Unlocked == true {
                let scene = ch1lvl4Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl5Btn" {
            if ch1lvl5Unlocked == true {
                let scene = ch1lvl5Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl6Btn" {
            if ch1lvl6Unlocked == true {
                let scene = ch1lvl6Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl7Btn" {
            if ch1lvl7Unlocked == true {
                let scene = ch1lvl7Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl8Btn" {
            if ch1lvl8Unlocked == true {
                let scene = ch1lvl8Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl9Btn" {
            if ch1lvl9Unlocked == true {
                let scene = ch1lvl9Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl10Btn" {
            if ch1lvl10Unlocked == true {
                let scene = ch1lvl10Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
    }
    
}
