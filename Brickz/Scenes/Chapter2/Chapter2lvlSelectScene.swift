//
//  Chapter2lvlSelectScene.swift
//  Brickz
//
//  Created by Julian Cearley on 6/1/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import UIKit
import SpriteKit

class Chapter2lvlSelectScene: SKScene, SKPhysicsContactDelegate {
    
    var ch2lvl2Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl2Unlocked")
    var ch2lvl3Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl3Unlocked")
    var ch2lvl4Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl4Unlocked")
    var ch2lvl5Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl5Unlocked")
    var ch2lvl6Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl6Unlocked")
    var ch2lvl7Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl7Unlocked")
    var ch2lvl8Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl8Unlocked")
    var ch2lvl9Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl9Unlocked")
    var ch2lvl10Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl10Unlocked")
    var ch2lvl11Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl11Unlocked")
    var ch2lvl12Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl12Unlocked")
    var ch2lvl13Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl13Unlocked")
    var ch2lvl14Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl14Unlocked")
    var ch2lvl15Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl15Unlocked")
    
    var scrollView: SwiftySKScrollView?
    let moveableNode = SKNode()
    
    var page1ScrollView = SKSpriteNode(), page2ScrollView = SKSpriteNode(), page3ScrollView = SKSpriteNode(), page4ScrollView = SKSpriteNode(), page5ScrollView = SKSpriteNode()
    
    let buttonScrollFadeOut = SKAction.fadeOut(withDuration: 0.2)
    let buttonScrollFadeIn = SKAction.fadeIn(withDuration: 0.2)
    
    let scrollViewTop = SKSpriteNode()
    let scrollViewBottom = SKSpriteNode()
    
    let topScrollSensor = SKSpriteNode()
    let bottomScrollSensor = SKSpriteNode()
    
    let bg = SKSpriteNode(imageNamed: "ch2Background")
    
    let chapter2Title = SKSpriteNode(imageNamed: "ch2Title")
    
    let backBtn = SKSpriteNode(imageNamed: "backBtn")
    
    let lvl1Btn = SKSpriteNode(imageNamed: "ch2lvl1BtnImg"), lvl2Btn = SKSpriteNode(imageNamed: "ch2lvl2BtnImg"), lvl3Btn = SKSpriteNode(imageNamed: "ch2lvl3BtnImg"), lvl4Btn = SKSpriteNode(imageNamed: "ch2lvl4BtnImg"), lvl5Btn = SKSpriteNode(imageNamed: "ch2lvl5BtnImg"), lvl6Btn = SKSpriteNode(imageNamed: "ch2lvl6BtnImg"), lvl7Btn = SKSpriteNode(imageNamed: "ch2lvl7BtnImg"), lvl8Btn = SKSpriteNode(imageNamed: "ch2lvl8BtnImg"), lvl9Btn = SKSpriteNode(imageNamed: "ch2lvl9BtnImg"), lvl10Btn = SKSpriteNode(imageNamed: "ch2lvl10BtnImg"), lvl11Btn = SKSpriteNode(imageNamed: "ch2lvl11BtnImg"), lvl12Btn = SKSpriteNode(imageNamed: "ch2lvl12BtnImg"), lvl13Btn = SKSpriteNode(imageNamed: "ch2lvl13BtnImg"), lvl14Btn = SKSpriteNode(imageNamed: "ch2lvl14BtnImg"), lvl15Btn = SKSpriteNode(imageNamed: "ch2lvl15BtnImg")
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.physicsWorld.contactDelegate = self
        
        addChild(moveableNode)
        createScrollView()
        
        chapter2Title.size = CGSize(width: self.frame.width / 2, height: self.frame.height / 8)
        chapter2Title.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.15)
        chapter2Title.zPosition = 1
        self.addChild(chapter2Title)
        
        scrollViewTop.size = CGSize(width: 50, height: 50)
        scrollViewTop.position = CGPoint(x: self.frame.width / 2, y: page1ScrollView.position.y + (page1ScrollView.size.height * 1))
        scrollViewTop.color = SKColor.clear
        scrollViewTop.name = "scrollViewTop"
        scrollViewTop.zPosition = 1
        self.addChild(scrollViewTop)
        scrollViewTop.physicsBody = SKPhysicsBody(rectangleOf: scrollViewTop.size)
        scrollViewTop.physicsBody?.affectedByGravity = false
        scrollViewTop.physicsBody?.isDynamic = true
        scrollViewTop.physicsBody?.categoryBitMask = PhysicsCategory.scrollBarriers
        scrollViewTop.physicsBody?.collisionBitMask = 0
        scrollViewTop.physicsBody?.contactTestBitMask = PhysicsCategory.scrollButtons
        
        scrollViewBottom.size = CGSize(width: 50, height: 50)
        scrollViewBottom.position = CGPoint(x: self.frame.width / 2, y: page3ScrollView.position.y - (page3ScrollView.size.height * 2.2))
        scrollViewBottom.color = SKColor.clear
        scrollViewBottom.name = "scrollViewBottom"
        scrollViewBottom.zPosition = 1
        self.addChild(scrollViewBottom)
        scrollViewBottom.physicsBody = SKPhysicsBody(rectangleOf: scrollViewBottom.size)
        scrollViewBottom.physicsBody?.affectedByGravity = false
        scrollViewBottom.physicsBody?.isDynamic = true
        scrollViewBottom.physicsBody?.categoryBitMask = PhysicsCategory.scrollBarriers
        scrollViewBottom.physicsBody?.collisionBitMask = 0
        scrollViewBottom.physicsBody?.contactTestBitMask = PhysicsCategory.scrollButtons
        
        bg.size = CGSize(width: self.frame.width, height: self.frame.height)
        bg.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        bg.zPosition = 0
        self.addChild(bg)
        
        lvl1Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl1Btn.name = "lvl1Btn"
        lvl1Btn.zPosition = 1
        lvl1Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl1Btn.size)
        lvl1Btn.physicsBody?.affectedByGravity = false
        lvl1Btn.physicsBody?.isDynamic = true
        lvl1Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl1Btn.physicsBody?.collisionBitMask = 0
        lvl1Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl2Unlocked == false {
            lvl2Btn.color = SKColor.black
            lvl2Btn.colorBlendFactor = 0.8
        } else {
            lvl2Btn.colorBlendFactor = 0
        }
        lvl2Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl2Btn.name = "lvl2Btn"
        lvl2Btn.zPosition = 1
        lvl2Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl2Btn.size)
        lvl2Btn.physicsBody?.affectedByGravity = false
        lvl2Btn.physicsBody?.isDynamic = true
        lvl2Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl2Btn.physicsBody?.collisionBitMask = 0
        lvl2Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl3Unlocked == false {
            lvl3Btn.color = SKColor.black
            lvl3Btn.colorBlendFactor = 0.8
        } else {
            lvl3Btn.colorBlendFactor = 0
        }
        lvl3Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl3Btn.name = "lvl3Btn"
        lvl3Btn.zPosition = 1
        lvl3Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl3Btn.size)
        lvl3Btn.physicsBody?.affectedByGravity = false
        lvl3Btn.physicsBody?.isDynamic = true
        lvl3Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl3Btn.physicsBody?.collisionBitMask = 0
        lvl3Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl4Unlocked == false {
            lvl4Btn.color = SKColor.black
            lvl4Btn.colorBlendFactor = 0.8
        } else {
            lvl4Btn.colorBlendFactor = 0
        }
        lvl4Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl4Btn.name = "lvl4Btn"
        lvl4Btn.zPosition = 1
        lvl4Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl4Btn.size)
        lvl4Btn.physicsBody?.affectedByGravity = false
        lvl4Btn.physicsBody?.isDynamic = true
        lvl4Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl4Btn.physicsBody?.collisionBitMask = 0
        lvl4Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl5Unlocked == false {
            lvl5Btn.color = SKColor.black
            lvl5Btn.colorBlendFactor = 0.8
        } else {
            lvl5Btn.colorBlendFactor = 0
        }
        lvl5Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl5Btn.name = "lvl5Btn"
        lvl5Btn.zPosition = 1
        lvl5Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl5Btn.size)
        lvl5Btn.physicsBody?.affectedByGravity = false
        lvl5Btn.physicsBody?.isDynamic = true
        lvl5Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl5Btn.physicsBody?.collisionBitMask = 0
        lvl5Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl6Unlocked == false {
            lvl6Btn.color = SKColor.black
            lvl6Btn.colorBlendFactor = 0.8
        } else {
            lvl6Btn.colorBlendFactor = 0
        }
        lvl6Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl6Btn.name = "lvl6Btn"
        lvl6Btn.zPosition = 1
        lvl6Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl6Btn.size)
        lvl6Btn.physicsBody?.affectedByGravity = false
        lvl6Btn.physicsBody?.isDynamic = true
        lvl6Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl6Btn.physicsBody?.collisionBitMask = 0
        lvl6Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl7Unlocked == false {
            lvl7Btn.color = SKColor.black
            lvl7Btn.colorBlendFactor = 0.8
        } else {
            lvl7Btn.colorBlendFactor = 0
        }
        lvl7Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl7Btn.name = "lvl7Btn"
        lvl7Btn.zPosition = 1
        lvl7Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl7Btn.size)
        lvl7Btn.physicsBody?.affectedByGravity = false
        lvl7Btn.physicsBody?.isDynamic = true
        lvl7Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl7Btn.physicsBody?.collisionBitMask = 0
        lvl7Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
    
        if ch2lvl8Unlocked == false {
            lvl8Btn.color = SKColor.black
            lvl8Btn.colorBlendFactor = 0.8
        } else {
            lvl8Btn.colorBlendFactor = 0
        }
        lvl8Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl8Btn.name = "lvl8Btn"
        lvl8Btn.zPosition = 1
        lvl8Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl8Btn.size)
        lvl8Btn.physicsBody?.affectedByGravity = false
        lvl8Btn.physicsBody?.isDynamic = true
        lvl8Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl8Btn.physicsBody?.collisionBitMask = 0
        lvl8Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl9Unlocked == false {
            lvl9Btn.color = SKColor.black
            lvl9Btn.colorBlendFactor = 0.8
        } else {
            lvl9Btn.colorBlendFactor = 0
        }
        lvl9Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl9Btn.name = "lvl9Btn"
        lvl9Btn.zPosition = 1
        lvl9Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl9Btn.size)
        lvl9Btn.physicsBody?.affectedByGravity = false
        lvl9Btn.physicsBody?.isDynamic = true
        lvl9Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl9Btn.physicsBody?.collisionBitMask = 0
        lvl9Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl10Unlocked == false {
            lvl10Btn.color = SKColor.black
            lvl10Btn.colorBlendFactor = 0.8
        } else {
            lvl10Btn.colorBlendFactor = 0
        }
        lvl10Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl10Btn.name = "lvl10Btn"
        lvl10Btn.alpha = 0
        lvl10Btn.zPosition = 1
        lvl10Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl10Btn.size)
        lvl10Btn.physicsBody?.affectedByGravity = false
        lvl10Btn.physicsBody?.isDynamic = true
        lvl10Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl10Btn.physicsBody?.collisionBitMask = 0
        lvl10Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl11Unlocked == false {
            lvl11Btn.color = SKColor.black
            lvl11Btn.colorBlendFactor = 0.8
        } else {
            lvl11Btn.colorBlendFactor = 0
        }
        lvl11Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl11Btn.name = "lvl11Btn"
        lvl11Btn.alpha = 0
        lvl11Btn.zPosition = 1
        lvl11Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl11Btn.size)
        lvl11Btn.physicsBody?.affectedByGravity = false
        lvl11Btn.physicsBody?.isDynamic = true
        lvl11Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl11Btn.physicsBody?.collisionBitMask = 0
        lvl11Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl12Unlocked == false {
            lvl12Btn.color = SKColor.black
            lvl12Btn.colorBlendFactor = 0.8
        } else {
            lvl12Btn.colorBlendFactor = 0
        }
        lvl12Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl12Btn.name = "lvl12Btn"
        lvl12Btn.alpha = 0
        lvl12Btn.zPosition = 1
        lvl12Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl12Btn.size)
        lvl12Btn.physicsBody?.affectedByGravity = false
        lvl12Btn.physicsBody?.isDynamic = true
        lvl12Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl12Btn.physicsBody?.collisionBitMask = 0
        lvl12Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl13Unlocked == false {
            lvl13Btn.color = SKColor.black
            lvl13Btn.colorBlendFactor = 0.8
        } else {
            lvl13Btn.colorBlendFactor = 0
        }
        lvl13Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl13Btn.name = "lvl13Btn"
        lvl13Btn.alpha = 0
        lvl13Btn.zPosition = 1
        lvl13Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl13Btn.size)
        lvl13Btn.physicsBody?.affectedByGravity = false
        lvl13Btn.physicsBody?.isDynamic = true
        lvl13Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl13Btn.physicsBody?.collisionBitMask = 0
        lvl13Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl14Unlocked == false {
            lvl14Btn.color = SKColor.black
            lvl14Btn.colorBlendFactor = 0.8
        } else {
            lvl14Btn.colorBlendFactor = 0
        }
        lvl14Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl14Btn.name = "lvl14Btn"
        lvl14Btn.alpha = 0
        lvl14Btn.zPosition = 1
        lvl14Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl14Btn.size)
        lvl14Btn.physicsBody?.affectedByGravity = false
        lvl14Btn.physicsBody?.isDynamic = true
        lvl14Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl14Btn.physicsBody?.collisionBitMask = 0
        lvl14Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl15Unlocked == false {
            lvl15Btn.color = SKColor.black
            lvl15Btn.colorBlendFactor = 0.8
        } else {
            lvl15Btn.colorBlendFactor = 0
        }
        lvl15Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl15Btn.name = "lvl15Btn"
        lvl15Btn.alpha = 0
        lvl15Btn.zPosition = 1
        lvl15Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl15Btn.size)
        lvl15Btn.physicsBody?.affectedByGravity = false
        lvl15Btn.physicsBody?.isDynamic = true
        lvl15Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl15Btn.physicsBody?.collisionBitMask = 0
        lvl15Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        backBtn.size = CGSize(width: self.frame.width / 3, height: self.frame.height / 12)
        backBtn.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 10)
        backBtn.zPosition = 1
        backBtn.name = "backBtn"
        self.addChild(backBtn)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if(contact.bodyA.node != nil && contact.bodyB.node != nil) {
            let firstBody = contact.bodyA.node as! SKSpriteNode
            let secondBody = contact.bodyB.node as! SKSpriteNode
         
            if (firstBody.name == "lvl2Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "lvl2Btn") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "lvl5Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "lvl5Btn") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "lvl14Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "lvl14Btn") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "lvl11Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "lvl11Btn") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            
        }
    }
    
    func buttonHitTopScrollView(Button: SKSpriteNode, Top: SKSpriteNode) {
        if Button.name == "lvl2Btn" {
            lvl1Btn.run(buttonScrollFadeOut)
            lvl2Btn.run(buttonScrollFadeOut)
            lvl3Btn.run(buttonScrollFadeOut)
            lvl10Btn.run(buttonScrollFadeIn)
            lvl11Btn.run(buttonScrollFadeIn)
            lvl12Btn.run(buttonScrollFadeIn)
        }
        if Button.name == "lvl5Btn" {
            lvl4Btn.run(buttonScrollFadeOut)
            lvl5Btn.run(buttonScrollFadeOut)
            lvl6Btn.run(buttonScrollFadeOut)
            lvl13Btn.run(buttonScrollFadeIn)
            lvl14Btn.run(buttonScrollFadeIn)
            lvl15Btn.run(buttonScrollFadeIn)
        }
    }
    
    func buttonHitBottomScrollView(Button: SKSpriteNode, Bottom: SKSpriteNode) {
        if Button.name == "lvl14Btn" {
            lvl13Btn.run(buttonScrollFadeOut)
            lvl14Btn.run(buttonScrollFadeOut)
            lvl15Btn.run(buttonScrollFadeOut)
            lvl4Btn.run(buttonScrollFadeIn)
            lvl5Btn.run(buttonScrollFadeIn)
            lvl6Btn.run(buttonScrollFadeIn)
        }
        if Button.name == "lvl11Btn" {
            lvl10Btn.run(buttonScrollFadeOut)
            lvl11Btn.run(buttonScrollFadeOut)
            lvl12Btn.run(buttonScrollFadeOut)
            lvl1Btn.run(buttonScrollFadeIn)
            lvl2Btn.run(buttonScrollFadeIn)
            lvl3Btn.run(buttonScrollFadeIn)
        }
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
            scrollView?.removeFromSuperview()
            let scene = ch2lvl1Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        }
        if touchedNode.name == "lvl2Btn" {
            if ch2lvl2Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl2Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl3Btn" {
            if ch2lvl3Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl3Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl4Btn" {
            if ch2lvl4Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl4Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl5Btn" {
            if ch2lvl5Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl5Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl6Btn" {
            if ch2lvl6Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl6Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl7Btn" {
            if ch2lvl7Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl7Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl8Btn" {
            if ch2lvl8Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl8Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl9Btn" {
            if ch2lvl9Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl9Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl10Btn" {
            if ch2lvl10Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl10Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl11Btn" {
            if ch2lvl11Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl11Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl12Btn" {
            if ch2lvl12Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl12Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl13Btn" {
            if ch2lvl13Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl13Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl14Btn" {
            if ch2lvl14Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl14Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl15Btn" {
            if ch2lvl15Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch2lvl15Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
    }
    
    func createScrollView() {
        
        scrollView = SwiftySKScrollView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height * 4.5), moveableNode: moveableNode, direction: .vertical)
        
        guard let scrollView = scrollView else { return }
        
        scrollView.center = CGPoint(x: frame.midX, y: frame.midY)
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height * 1.1)
        view?.addSubview(scrollView)
        
        page2ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page2ScrollView.position = CGPoint(x: frame.midX, y: frame.midY)
        page2ScrollView.zPosition = 1
        moveableNode.addChild(page2ScrollView)
        
        page1ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page1ScrollView.position = CGPoint(x: page2ScrollView.position.x, y: page2ScrollView.position.y + (page2ScrollView.size.height * 2))
        page1ScrollView.zPosition = 1
        page1ScrollView.color = SKColor.clear
        moveableNode.addChild(page1ScrollView)
        
        page3ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page3ScrollView.position = CGPoint(x: page2ScrollView.position.x, y: page2ScrollView.position.y - (page2ScrollView.size.height * 2))
        page3ScrollView.zPosition = 1
        page3ScrollView.color = SKColor.clear
        moveableNode.addChild(page3ScrollView)
        
        page4ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page4ScrollView.position = CGPoint(x: page3ScrollView.position.x, y: page3ScrollView.position.y - (page3ScrollView.size.height * 2))
        page4ScrollView.zPosition = 1
        moveableNode.addChild(page4ScrollView)
        
        page5ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page5ScrollView.position = CGPoint(x: page4ScrollView.position.x, y: page4ScrollView.position.y - (page4ScrollView.size.height * 2))
        page5ScrollView.zPosition = 1
        moveableNode.addChild(page5ScrollView)
        
        lvl1Btn.position = CGPoint(x: 0 - (page1ScrollView.frame.width / 2.5), y: 0)
        page1ScrollView.addChild(lvl1Btn)
        
        lvl2Btn.position = CGPoint(x: 0, y: 0)
        page1ScrollView.addChild(lvl2Btn)
        
        lvl3Btn.position = CGPoint(x: 0 + (page1ScrollView.frame.width / 2.5), y: 0)
        page1ScrollView.addChild(lvl3Btn)
        
        lvl4Btn.position = CGPoint(x: 0 - (page2ScrollView.frame.width / 2.5), y: 0)
        page2ScrollView.addChild(lvl4Btn)
        
        lvl5Btn.position = CGPoint(x: 0, y: 0)
        page2ScrollView.addChild(lvl5Btn)
        
        lvl6Btn.position = CGPoint(x: 0 + (page2ScrollView.frame.width / 2.5), y: 0)
        page2ScrollView.addChild(lvl6Btn)
        
        lvl7Btn.position = CGPoint(x: 0 - (page3ScrollView.frame.width / 2.5), y: 0)
        page3ScrollView.addChild(lvl7Btn)
        
        lvl8Btn.position = CGPoint(x: 0, y: 0)
        page3ScrollView.addChild(lvl8Btn)
        
        lvl9Btn.position = CGPoint(x: 0 + (page3ScrollView.frame.width / 2.5), y: 0)
        page3ScrollView.addChild(lvl9Btn)
        
        lvl10Btn.position = CGPoint(x: 0 - (page4ScrollView.frame.width / 2.5), y: 0)
        page4ScrollView.addChild(lvl10Btn)
        
        lvl11Btn.position = CGPoint(x: 0, y: 0)
        page4ScrollView.addChild(lvl11Btn)
        
        lvl12Btn.position = CGPoint(x: 0 + (page4ScrollView.frame.width / 2.5), y: 0)
        page4ScrollView.addChild(lvl12Btn)
        
        lvl13Btn.position = CGPoint(x: 0 - (page5ScrollView.frame.width / 2.5), y: 0)
        page5ScrollView.addChild(lvl13Btn)
        
        lvl14Btn.position = CGPoint(x: 0, y: 0)
        page5ScrollView.addChild(lvl14Btn)
        
        lvl15Btn.position = CGPoint(x: 0 + (page5ScrollView.frame.width / 2.5), y: 0)
        page5ScrollView.addChild(lvl15Btn)
        
    }
    
}
