//
//  Chapter3lvlSelectScene.swift
//  Brickz
//
//  Created by Julian Cearley on 8/12/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import UIKit
import SpriteKit

class Chapter3lvlSelectScene: SKScene, SKPhysicsContactDelegate {
    
    var ch3lvl2Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl2Unlocked")
    var ch3lvl3Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl3Unlocked")
    var ch3lvl4Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl4Unlocked")
    var ch3lvl5Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl5Unlocked")
    var ch3lvl6Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl6Unlocked")
    var ch3lvl7Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl7Unlocked")
    var ch3lvl8Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl8Unlocked")
    var ch3lvl9Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl9Unlocked")
    var ch3lvl10Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl10Unlocked")
    var ch3lvl11Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl11Unlocked")
    var ch3lvl12Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl12Unlocked")
    var ch3lvl13Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl13Unlocked")
    var ch3lvl14Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl14Unlocked")
    var ch3lvl15Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl15Unlocked")
    var ch3lvl16Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl16Unlocked")
    var ch3lvl17Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl17Unlocked")
    var ch3lvl18Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl18Unlocked")
    var ch3lvl19Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl19Unlocked")
    var ch3lvl20Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl20Unlocked")
    var ch3lvl21Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl21Unlocked")
    var ch3lvl22Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl22Unlocked")
    var ch3lvl23Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl23Unlocked")
    var ch3lvl24Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl24Unlocked")
    var ch3lvl25Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl25Unlocked")
    
    
    var scrollView: SwiftySKScrollView?
    let moveableNode = SKNode()
    
    var page1ScrollView = SKSpriteNode(), page2ScrollView = SKSpriteNode(), page3ScrollView = SKSpriteNode(), page4ScrollView = SKSpriteNode(), page5ScrollView = SKSpriteNode(), page6ScrollView = SKSpriteNode(), page7ScrollView = SKSpriteNode(), page8ScrollView = SKSpriteNode(), page9ScrollView = SKSpriteNode()
    
    let buttonScrollFadeOut = SKAction.fadeOut(withDuration: 0.2)
    let buttonScrollFadeIn = SKAction.fadeIn(withDuration: 0.2)
    
    let scrollViewTop = SKSpriteNode()
    let scrollViewBottom = SKSpriteNode()
    
    let topScrollSensor = SKSpriteNode()
    let bottomScrollSensor = SKSpriteNode()
    
    let bg = SKSpriteNode(imageNamed: "ch3Background")
    
    let chapter3Title = SKSpriteNode(imageNamed: "ch3Title")
    
    let backBtn = SKSpriteNode(imageNamed: "backBtn")
    
    let lvl1Btn = SKSpriteNode(imageNamed: "ch3lvl1BtnImg"), lvl2Btn = SKSpriteNode(imageNamed: "ch3lvl2BtnImg"), lvl3Btn = SKSpriteNode(imageNamed: "ch3lvl3BtnImg"), lvl4Btn = SKSpriteNode(imageNamed: "ch3lvl4BtnImg"), lvl5Btn = SKSpriteNode(imageNamed: "ch3lvl5BtnImg"), lvl6Btn = SKSpriteNode(imageNamed: "ch3lvl6BtnImg"), lvl7Btn = SKSpriteNode(imageNamed: "ch3lvl7BtnImg"), lvl8Btn = SKSpriteNode(imageNamed: "ch3lvl8BtnImg"), lvl9Btn = SKSpriteNode(imageNamed: "ch3lvl9BtnImg"), lvl10Btn = SKSpriteNode(imageNamed: "ch3lvl10BtnImg"), lvl11Btn = SKSpriteNode(imageNamed: "ch3lvl11BtnImg"), lvl12Btn = SKSpriteNode(imageNamed: "ch3lvl12BtnImg"), lvl13Btn = SKSpriteNode(imageNamed: "ch3lvl13BtnImg"), lvl14Btn = SKSpriteNode(imageNamed: "ch3lvl14BtnImg"), lvl15Btn = SKSpriteNode(imageNamed: "ch3lvl15BtnImg"), lvl16Btn = SKSpriteNode(imageNamed: "ch3lvl16BtnImg"), lvl17Btn = SKSpriteNode(imageNamed: "ch3lvl17BtnImg"), lvl18Btn = SKSpriteNode(imageNamed: "ch3lvl18BtnImg"), lvl19Btn = SKSpriteNode(imageNamed: "ch3lvl19BtnImg"), lvl20Btn = SKSpriteNode(imageNamed: "ch3lvl20BtnImg"), lvl21Btn = SKSpriteNode(imageNamed: "ch3lvl21BtnImg"), lvl22Btn = SKSpriteNode(imageNamed: "ch3lvl22BtnImg"), lvl23Btn = SKSpriteNode(imageNamed: "ch3lvl23BtnImg"), lvl24Btn = SKSpriteNode(imageNamed: "ch3lvl24BtnImg"), lvl25Btn = SKSpriteNode(imageNamed: "ch3lvl25BtnImg")
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.physicsWorld.contactDelegate = self
        
        addChild(moveableNode)
        createScrollView()
        
        chapter3Title.size = CGSize(width: self.frame.width / 2, height: self.frame.height / 8)
        chapter3Title.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.15)
        chapter3Title.zPosition = 1
        self.addChild(chapter3Title)
        
        scrollViewTop.size = CGSize(width: 50, height: 50)
        scrollViewTop.position = CGPoint(x: self.frame.width / 2, y: page1ScrollView.position.y + (page1ScrollView.size.height * 1))
        scrollViewTop.color = SKColor.clear
        scrollViewTop.name = "scrollViewTop"
        scrollViewTop.zPosition = 5
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
        scrollViewBottom.zPosition = 5
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
        
        if ch3lvl2Unlocked == false {
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
        
        if ch3lvl3Unlocked == false {
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
        
        if ch3lvl4Unlocked == false {
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
        
        if ch3lvl5Unlocked == false {
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
        
        if ch3lvl6Unlocked == false {
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
        
        if ch3lvl7Unlocked == false {
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
        
        if ch3lvl8Unlocked == false {
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
        
        if ch3lvl9Unlocked == false {
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
        
        if ch3lvl10Unlocked == false {
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
        
        if ch3lvl11Unlocked == false {
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
        
        if ch3lvl12Unlocked == false {
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
        
        if ch3lvl13Unlocked == false {
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
        
        if ch3lvl14Unlocked == false {
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
        
        if ch3lvl15Unlocked == false {
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
        
        if ch3lvl16Unlocked == false {
            lvl16Btn.color = SKColor.black
            lvl16Btn.colorBlendFactor = 0.8
        } else {
            lvl16Btn.colorBlendFactor = 0
        }
        lvl16Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl16Btn.name = "lvl16Btn"
        lvl16Btn.alpha = 0
        lvl16Btn.zPosition = 1
        lvl16Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl16Btn.size)
        lvl16Btn.physicsBody?.affectedByGravity = false
        lvl16Btn.physicsBody?.isDynamic = true
        lvl16Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl16Btn.physicsBody?.collisionBitMask = 0
        lvl16Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch3lvl17Unlocked == false {
            lvl17Btn.color = SKColor.black
            lvl17Btn.colorBlendFactor = 0.8
        } else {
            lvl17Btn.colorBlendFactor = 0
        }
        lvl17Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl17Btn.name = "lvl17Btn"
        lvl17Btn.alpha = 0
        lvl17Btn.zPosition = 1
        lvl17Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl17Btn.size)
        lvl17Btn.physicsBody?.affectedByGravity = false
        lvl17Btn.physicsBody?.isDynamic = true
        lvl17Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl17Btn.physicsBody?.collisionBitMask = 0
        lvl17Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch3lvl18Unlocked == false {
            lvl18Btn.color = SKColor.black
            lvl18Btn.colorBlendFactor = 0.8
        } else {
            lvl18Btn.colorBlendFactor = 0
        }
        lvl18Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl18Btn.name = "lvl18Btn"
        lvl18Btn.alpha = 0
        lvl18Btn.zPosition = 1
        lvl18Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl18Btn.size)
        lvl18Btn.physicsBody?.affectedByGravity = false
        lvl18Btn.physicsBody?.isDynamic = true
        lvl18Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl18Btn.physicsBody?.collisionBitMask = 0
        lvl18Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch3lvl19Unlocked == false {
            lvl19Btn.color = SKColor.black
            lvl19Btn.colorBlendFactor = 0.8
        } else {
            lvl19Btn.colorBlendFactor = 0
        }
        lvl19Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl19Btn.name = "lvl19Btn"
        lvl19Btn.alpha = 0
        lvl19Btn.zPosition = 1
        lvl19Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl19Btn.size)
        lvl19Btn.physicsBody?.affectedByGravity = false
        lvl19Btn.physicsBody?.isDynamic = true
        lvl19Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl19Btn.physicsBody?.collisionBitMask = 0
        lvl19Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch3lvl20Unlocked == false {
            lvl20Btn.color = SKColor.black
            lvl20Btn.colorBlendFactor = 0.8
        } else {
            lvl20Btn.colorBlendFactor = 0
        }
        lvl20Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl20Btn.name = "lvl20Btn"
        lvl20Btn.alpha = 0
        lvl20Btn.zPosition = 1
        lvl20Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl20Btn.size)
        lvl20Btn.physicsBody?.affectedByGravity = false
        lvl20Btn.physicsBody?.isDynamic = true
        lvl20Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl20Btn.physicsBody?.collisionBitMask = 0
        lvl20Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch3lvl21Unlocked == false {
            lvl21Btn.color = SKColor.black
            lvl21Btn.colorBlendFactor = 0.8
        } else {
            lvl21Btn.colorBlendFactor = 0
        }
        lvl21Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl21Btn.name = "lvl21Btn"
        lvl21Btn.alpha = 0
        lvl21Btn.zPosition = 1
        lvl21Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl21Btn.size)
        lvl21Btn.physicsBody?.affectedByGravity = false
        lvl21Btn.physicsBody?.isDynamic = true
        lvl21Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl21Btn.physicsBody?.collisionBitMask = 0
        lvl21Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch3lvl22Unlocked == false {
            lvl22Btn.color = SKColor.black
            lvl22Btn.colorBlendFactor = 0.8
        } else {
            lvl22Btn.colorBlendFactor = 0
        }
        lvl22Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl22Btn.name = "lvl22Btn"
        lvl22Btn.alpha = 0
        lvl22Btn.zPosition = 1
        lvl22Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl22Btn.size)
        lvl22Btn.physicsBody?.affectedByGravity = false
        lvl22Btn.physicsBody?.isDynamic = true
        lvl22Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl22Btn.physicsBody?.collisionBitMask = 0
        lvl22Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch3lvl23Unlocked == false {
            lvl23Btn.color = SKColor.black
            lvl23Btn.colorBlendFactor = 0.8
        } else {
            lvl23Btn.colorBlendFactor = 0
        }
        lvl23Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl23Btn.name = "lvl23Btn"
        lvl23Btn.alpha = 0
        lvl23Btn.zPosition = 1
        lvl23Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl23Btn.size)
        lvl23Btn.physicsBody?.affectedByGravity = false
        lvl23Btn.physicsBody?.isDynamic = true
        lvl23Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl23Btn.physicsBody?.collisionBitMask = 0
        lvl23Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch3lvl24Unlocked == false {
            lvl24Btn.color = SKColor.black
            lvl24Btn.colorBlendFactor = 0.8
        } else {
            lvl24Btn.colorBlendFactor = 0
        }
        lvl24Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl24Btn.name = "lvl24Btn"
        lvl24Btn.alpha = 0
        lvl24Btn.zPosition = 1
        lvl24Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl24Btn.size)
        lvl24Btn.physicsBody?.affectedByGravity = false
        lvl24Btn.physicsBody?.isDynamic = true
        lvl24Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl24Btn.physicsBody?.collisionBitMask = 0
        lvl24Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch3lvl25Unlocked == false {
            lvl25Btn.color = SKColor.black
            lvl25Btn.colorBlendFactor = 0.8
        } else {
            lvl25Btn.colorBlendFactor = 0
        }
        lvl25Btn.size = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        lvl25Btn.name = "lvl25Btn"
        lvl25Btn.alpha = 0
        lvl25Btn.zPosition = 1
        lvl25Btn.physicsBody = SKPhysicsBody(rectangleOf: lvl25Btn.size)
        lvl25Btn.physicsBody?.affectedByGravity = false
        lvl25Btn.physicsBody?.isDynamic = true
        lvl25Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        lvl25Btn.physicsBody?.collisionBitMask = 0
        lvl25Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
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
            if (firstBody.name == "lvl8Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "lvl8Btn") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "lvl11Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "lvl11Btn") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "lvl14Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "lvl14Btn") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "lvl17Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "lvl17Btn") {
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
            if (firstBody.name == "lvl17Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "lvl17Btn") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "lvl20Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "lvl20Btn") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "lvl23Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "lvl23Btn") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "lvl25Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "lvl25Btn") {
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
        if Button.name == "lvl8Btn" {
            lvl7Btn.run(buttonScrollFadeOut)
            lvl8Btn.run(buttonScrollFadeOut)
            lvl9Btn.run(buttonScrollFadeOut)
            lvl16Btn.run(buttonScrollFadeIn)
            lvl17Btn.run(buttonScrollFadeIn)
            lvl18Btn.run(buttonScrollFadeIn)
        }
        if Button.name == "lvl11Btn" {
            lvl10Btn.run(buttonScrollFadeOut)
            lvl11Btn.run(buttonScrollFadeOut)
            lvl12Btn.run(buttonScrollFadeOut)
            lvl19Btn.run(buttonScrollFadeIn)
            lvl20Btn.run(buttonScrollFadeIn)
            lvl21Btn.run(buttonScrollFadeIn)
        }
        if Button.name == "lvl14Btn" {
            lvl13Btn.run(buttonScrollFadeOut)
            lvl14Btn.run(buttonScrollFadeOut)
            lvl15Btn.run(buttonScrollFadeOut)
            lvl22Btn.run(buttonScrollFadeIn)
            lvl23Btn.run(buttonScrollFadeIn)
            lvl24Btn.run(buttonScrollFadeIn)
        }
        if Button.name == "lvl17Btn" {
            lvl16Btn.run(buttonScrollFadeOut)
            lvl17Btn.run(buttonScrollFadeOut)
            lvl18Btn.run(buttonScrollFadeOut)
            lvl25Btn.run(buttonScrollFadeIn)
        }
    }
    
    func buttonHitBottomScrollView(Button: SKSpriteNode, Bottom: SKSpriteNode) {
        if Button.name == "lvl25Btn" {
            lvl25Btn.run(buttonScrollFadeOut)
            lvl16Btn.run(buttonScrollFadeIn)
            lvl17Btn.run(buttonScrollFadeIn)
            lvl18Btn.run(buttonScrollFadeIn)
        }
        if Button.name == "lvl23Btn" {
            lvl22Btn.run(buttonScrollFadeOut)
            lvl23Btn.run(buttonScrollFadeOut)
            lvl24Btn.run(buttonScrollFadeOut)
            lvl13Btn.run(buttonScrollFadeIn)
            lvl14Btn.run(buttonScrollFadeIn)
            lvl15Btn.run(buttonScrollFadeIn)
        }
        if Button.name == "lvl20Btn" {
            lvl19Btn.run(buttonScrollFadeOut)
            lvl20Btn.run(buttonScrollFadeOut)
            lvl21Btn.run(buttonScrollFadeOut)
            lvl10Btn.run(buttonScrollFadeIn)
            lvl11Btn.run(buttonScrollFadeIn)
            lvl12Btn.run(buttonScrollFadeIn)
        }
        if Button.name == "lvl17Btn" {
            lvl16Btn.run(buttonScrollFadeOut)
            lvl17Btn.run(buttonScrollFadeOut)
            lvl18Btn.run(buttonScrollFadeOut)
            lvl7Btn.run(buttonScrollFadeIn)
            lvl8Btn.run(buttonScrollFadeIn)
            lvl9Btn.run(buttonScrollFadeIn)
        }
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
            let scene = ch3lvl1Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 0.5)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        }
        if touchedNode.name == "lvl2Btn" {
            if ch3lvl2Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl2Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl3Btn" {
            if ch3lvl3Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl3Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl4Btn" {
            if ch3lvl4Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl4Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl5Btn" {
            if ch3lvl5Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl5Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl6Btn" {
            if ch3lvl6Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl6Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl7Btn" {
            if ch3lvl7Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl7Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl8Btn" {
            if ch3lvl8Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl8Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl9Btn" {
            if ch3lvl9Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl9Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl10Btn" {
            if ch3lvl10Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl10Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl11Btn" {
            if ch3lvl11Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl11Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl12Btn" {
            if ch3lvl12Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl12Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl13Btn" {
            if ch3lvl13Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl13Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl14Btn" {
            if ch3lvl14Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl14Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl15Btn" {
            if ch3lvl15Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl15Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl16Btn" {
            if ch3lvl16Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl16Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl17Btn" {
            if ch3lvl17Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl17Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl18Btn" {
            if ch3lvl18Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl18Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl19Btn" {
            if ch3lvl19Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl19Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl20Btn" {
            if ch3lvl20Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl20Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl21Btn" {
            if ch3lvl21Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl21Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl22Btn" {
            if ch3lvl22Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl22Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl23Btn" {
            if ch3lvl23Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl23Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl24Btn" {
            if ch3lvl24Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl24Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
        if touchedNode.name == "lvl25Btn" {
            if ch3lvl25Unlocked == true {
                scrollView?.removeFromSuperview()
                let scene = ch3lvl25Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            } else {
                
            }
        }
    }
    
    func createScrollView() {
        
        scrollView = SwiftySKScrollView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height * 9.5), moveableNode: moveableNode, direction: .vertical)
        
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
        
        page6ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page6ScrollView.position = CGPoint(x: page5ScrollView.position.x, y: page5ScrollView.position.y - (page5ScrollView.size.height * 2))
        page6ScrollView.zPosition = 1
        moveableNode.addChild(page6ScrollView)
        
        page7ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page7ScrollView.position = CGPoint(x: page6ScrollView.position.x, y: page6ScrollView.position.y - (page6ScrollView.size.height * 2))
        page7ScrollView.zPosition = 1
        moveableNode.addChild(page7ScrollView)
        
        page8ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page8ScrollView.position = CGPoint(x: page7ScrollView.position.x, y: page7ScrollView.position.y - (page7ScrollView.size.height * 2))
        page8ScrollView.zPosition = 1
        moveableNode.addChild(page8ScrollView)
        
        page9ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page9ScrollView.position = CGPoint(x: page8ScrollView.position.x, y: page8ScrollView.position.y - (page8ScrollView.size.height * 2))
        page9ScrollView.zPosition = 1
        moveableNode.addChild(page9ScrollView)
        
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
        
        lvl16Btn.position = CGPoint(x: 0 - (page6ScrollView.frame.width / 2.5), y: 0)
        page6ScrollView.addChild(lvl16Btn)
        
        lvl17Btn.position = CGPoint(x: 0, y: 0)
        page6ScrollView.addChild(lvl17Btn)
        
        lvl18Btn.position = CGPoint(x: 0 + (page6ScrollView.frame.width / 2.5), y: 0)
        page6ScrollView.addChild(lvl18Btn)
        
        lvl19Btn.position = CGPoint(x: 0 - (page7ScrollView.frame.width / 2.5), y: 0)
        page7ScrollView.addChild(lvl19Btn)
        
        lvl20Btn.position = CGPoint(x: 0, y: 0)
        page7ScrollView.addChild(lvl20Btn)
        
        lvl21Btn.position = CGPoint(x: 0 + (page7ScrollView.frame.width / 2.5), y: 0)
        page7ScrollView.addChild(lvl21Btn)
        
        lvl22Btn.position = CGPoint(x: 0 - (page8ScrollView.frame.width / 2.5), y: 0)
        page8ScrollView.addChild(lvl22Btn)
        
        lvl23Btn.position = CGPoint(x: 0, y: 0)
        page8ScrollView.addChild(lvl23Btn)
        
        lvl24Btn.position = CGPoint(x: 0 + (page8ScrollView.frame.width / 2.5), y: 0)
        page8ScrollView.addChild(lvl24Btn)
        
        lvl25Btn.position = CGPoint(x: 0, y: 0)
        page9ScrollView.addChild(lvl25Btn)
        
    }
    
}
