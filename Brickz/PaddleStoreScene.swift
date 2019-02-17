//
//  PaddleStoreScene.swift
//  Brickz
//
//  Created by Julian Cearley on 6/9/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import SpriteKit
import UIKit

class PaddleStoreScene: SKScene, SKPhysicsContactDelegate {
    
    var ballInt = UserDefaults.standard.integer(forKey: "paddleInt")
    
    var coinsInWallet = UserDefaults.standard.integer(forKey: "coinsInWallet")
    let coinWalletLbl = SKLabelNode()
    let coinImg = SKSpriteNode(imageNamed: "brickzCoin")
    
    let background = SKSpriteNode(imageNamed: "titleBackground")
    let storeTitle = SKSpriteNode(imageNamed: "")
    
    let selector = SKSpriteNode(imageNamed: "ball34")
    
    let ball1Btn = SKSpriteNode(), ball2Btn = SKSpriteNode(), ball3Btn = SKSpriteNode(), ball4Btn = SKSpriteNode(), ball5Btn = SKSpriteNode(), ball6Btn = SKSpriteNode(), ball7Btn = SKSpriteNode(), ball8Btn = SKSpriteNode(), ball9Btn = SKSpriteNode(), ball10Btn = SKSpriteNode(), ball11Btn = SKSpriteNode(), ball12Btn = SKSpriteNode(), ball13Btn = SKSpriteNode(), ball14Btn = SKSpriteNode(), ball15Btn = SKSpriteNode(), ball16Btn = SKSpriteNode(), ball17Btn = SKSpriteNode(), ball18Btn = SKSpriteNode(), ball19Btn = SKSpriteNode(), ball20Btn = SKSpriteNode(), ball21Btn = SKSpriteNode(), ball22Btn = SKSpriteNode(), ball23Btn = SKSpriteNode(), ball24Btn = SKSpriteNode(), ball25Btn = SKSpriteNode(), ball26Btn = SKSpriteNode(), ball27Btn = SKSpriteNode(), ball28Btn = SKSpriteNode(), ball29Btn = SKSpriteNode(), ball30Btn = SKSpriteNode(), ball31Btn = SKSpriteNode(), ball32Btn = SKSpriteNode(), ball33Btn = SKSpriteNode(), ball34Btn = SKSpriteNode(), ball35Btn = SKSpriteNode(), ball36Btn = SKSpriteNode(), ball37Btn = SKSpriteNode(), ball38Btn = SKSpriteNode(), ball39Btn = SKSpriteNode(), ball40Btn = SKSpriteNode(), ball41Btn = SKSpriteNode(), ball42Btn = SKSpriteNode(), ball43Btn = SKSpriteNode(), ball44Btn = SKSpriteNode(), ball45Btn = SKSpriteNode(), ball46Btn = SKSpriteNode(), ball47Btn = SKSpriteNode(), ball48Btn = SKSpriteNode(), ball49Btn = SKSpriteNode(), ball50Btn = SKSpriteNode()
    
    let ball1 = SKSpriteNode(imageNamed: "paddle1"), ball2 = SKSpriteNode(imageNamed: "paddle2"), ball3 = SKSpriteNode(imageNamed: "paddle3"), ball4 = SKSpriteNode(imageNamed: "paddle4"), ball5 = SKSpriteNode(imageNamed: "paddle5"), ball6 = SKSpriteNode(imageNamed: "paddle6"), ball7 = SKSpriteNode(imageNamed: "paddle7"), ball8 = SKSpriteNode(imageNamed: "paddle8"), ball9 = SKSpriteNode(imageNamed: "paddle9"), ball10 = SKSpriteNode(imageNamed: "paddle10"), ball11 = SKSpriteNode(imageNamed: "paddle11"), ball12 = SKSpriteNode(imageNamed: "paddle12"),  ball13 = SKSpriteNode(imageNamed: "paddle13"), ball14 = SKSpriteNode(imageNamed: "paddle14"), ball15 = SKSpriteNode(imageNamed: "paddle15"), ball16 = SKSpriteNode(imageNamed: "paddle16"), ball17 = SKSpriteNode(imageNamed: "paddle17"), ball18 = SKSpriteNode(imageNamed: "paddle18"), ball19 = SKSpriteNode(imageNamed: "paddle19"), ball20 = SKSpriteNode(imageNamed: "paddle20"), ball21 = SKSpriteNode(imageNamed: "paddle21"), ball22 = SKSpriteNode(imageNamed: "paddle22"), ball23 = SKSpriteNode(imageNamed: "paddle23"), ball24 = SKSpriteNode(imageNamed: "paddle24"), ball25 = SKSpriteNode(imageNamed: "paddle25"), ball26 = SKSpriteNode(imageNamed: "paddle26"),  ball27 = SKSpriteNode(imageNamed: "paddle27"), ball28 = SKSpriteNode(imageNamed: "paddle28"), ball29 = SKSpriteNode(imageNamed: "paddle29"), ball30 = SKSpriteNode(imageNamed: "paddle30"), ball31 = SKSpriteNode(imageNamed: "paddle31"), ball32 = SKSpriteNode(imageNamed: "paddle32"), ball33 = SKSpriteNode(imageNamed: "paddle33"), ball34 = SKSpriteNode(imageNamed: "paddle34"), ball35 = SKSpriteNode(imageNamed: "paddle35"), ball36 = SKSpriteNode(imageNamed: "paddle36"), ball37 = SKSpriteNode(imageNamed: "paddle37"),  ball38 = SKSpriteNode(imageNamed: "paddle38"), ball39 = SKSpriteNode(imageNamed: "paddle39"), ball40 = SKSpriteNode(imageNamed: "paddle40"),  ball41 = SKSpriteNode(imageNamed: "paddle41"), ball42 = SKSpriteNode(imageNamed: "paddle42"), ball43 = SKSpriteNode(imageNamed: "paddle43"), ball44 = SKSpriteNode(imageNamed: "paddle44"), ball45 = SKSpriteNode(imageNamed: "paddle45"), ball46 = SKSpriteNode(imageNamed: "paddle46"), ball47 = SKSpriteNode(imageNamed: "paddle47"), ball48 = SKSpriteNode(imageNamed: "paddle48"), ball49 = SKSpriteNode(imageNamed: "paddle49"), ball50 = SKSpriteNode(imageNamed: "paddle50")
    
    let ball1Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball2Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball3Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball4Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball5Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball6Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball7Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball8Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball9Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball10Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball11Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball12Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball13Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball14Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball15Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball16Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball17Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball18Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball19Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball20Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball21Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball22Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball23Lbl = SKLabelNode(fontNamed: "v"), ball24Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball25Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball26Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball27Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball28Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball29Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball30Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball31Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball32Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball33Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball34Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball35Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball36Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball37Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball38Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball39Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball40Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball41Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball42Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball43Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball44Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball45Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball46Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball47Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball48Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball49Lbl = SKLabelNode(fontNamed: "AINile-Bold"), ball50Lbl = SKLabelNode(fontNamed: "AINile-Bold")
    
    var ball2Unlocked = UserDefaults.standard.bool(forKey: "paddle2Unlocked"), ball3Unlocked = UserDefaults.standard.bool(forKey: "paddle3Unlocked"), ball4Unlocked = UserDefaults.standard.bool(forKey: "paddle4Unlocked"), ball5Unlocked = UserDefaults.standard.bool(forKey: "paddle5Unlocked"), ball6Unlocked = UserDefaults.standard.bool(forKey: "paddle6Unlocked"), ball7Unlocked = UserDefaults.standard.bool(forKey: "paddle7Unlocked"), ball8Unlocked = UserDefaults.standard.bool(forKey: "paddle8Unlocked"), ball9Unlocked = UserDefaults.standard.bool(forKey: "paddle9Unlocked"), ball10Unlocked = UserDefaults.standard.bool(forKey: "paddle10Unlocked"), ball11Unlocked = UserDefaults.standard.bool(forKey: "paddle11Unlocked"), ball12Unlocked = UserDefaults.standard.bool(forKey: "paddle12Unlocked"), ball13Unlocked = UserDefaults.standard.bool(forKey: "paddle13Unlocked"), ball14Unlocked = UserDefaults.standard.bool(forKey: "paddle14Unlocked"), ball15Unlocked = UserDefaults.standard.bool(forKey: "paddle15Unlocked"), ball16Unlocked = UserDefaults.standard.bool(forKey: "paddle16Unlocked"), ball17Unlocked = UserDefaults.standard.bool(forKey: "paddle17Unlocked"), ball18Unlocked = UserDefaults.standard.bool(forKey: "paddle18Unlocked"), ball19Unlocked = UserDefaults.standard.bool(forKey: "paddle19Unlocked"), ball20Unlocked = UserDefaults.standard.bool(forKey: "paddle20Unlocked"), ball21Unlocked = UserDefaults.standard.bool(forKey: "paddle21Unlocked"), ball22Unlocked = UserDefaults.standard.bool(forKey: "paddle22Unlocked"), ball23Unlocked = UserDefaults.standard.bool(forKey: "paddle23Unlocked"), ball24Unlocked = UserDefaults.standard.bool(forKey: "paddle24Unlocked"), ball25Unlocked = UserDefaults.standard.bool(forKey: "paddle25Unlocked"), ball26Unlocked = UserDefaults.standard.bool(forKey: "paddle26Unlocked"), ball27Unlocked = UserDefaults.standard.bool(forKey: "paddle27Unlocked"), ball28Unlocked = UserDefaults.standard.bool(forKey: "paddle28Unlocked"), ball29Unlocked = UserDefaults.standard.bool(forKey: "paddle29Unlocked"), ball30Unlocked = UserDefaults.standard.bool(forKey: "paddle30Unlocked"), ball31Unlocked = UserDefaults.standard.bool(forKey: "paddle31Unlocked"), ball32Unlocked = UserDefaults.standard.bool(forKey: "paddle32Unlocked"), ball33Unlocked = UserDefaults.standard.bool(forKey: "paddle33Unlocked"), ball34Unlocked = UserDefaults.standard.bool(forKey: "paddle34Unlocked"), ball35Unlocked = UserDefaults.standard.bool(forKey: "paddle35Unlocked"), ball36Unlocked = UserDefaults.standard.bool(forKey: "paddle36Unlocked"), ball37Unlocked = UserDefaults.standard.bool(forKey: "paddle37Unlocked"), ball38Unlocked = UserDefaults.standard.bool(forKey: "paddle38Unlocked"), ball39Unlocked = UserDefaults.standard.bool(forKey: "paddle39Unlocked"), ball40Unlocked = UserDefaults.standard.bool(forKey: "paddle40Unlocked"), ball41Unlocked = UserDefaults.standard.bool(forKey: "paddle41Unlocked"), ball42Unlocked = UserDefaults.standard.bool(forKey: "paddle42Unlocked"), ball43Unlocked = UserDefaults.standard.bool(forKey: "paddle43Unlocked"), ball44Unlocked = UserDefaults.standard.bool(forKey: "paddle44Unlocked"), ball45Unlocked = UserDefaults.standard.bool(forKey: "paddle45Unlocked"), ball46Unlocked = UserDefaults.standard.bool(forKey: "paddle46Unlocked"), ball47Unlocked = UserDefaults.standard.bool(forKey: "paddle47Unlocked"), ball48Unlocked = UserDefaults.standard.bool(forKey: "paddle48Unlocked"), ball49Unlocked = UserDefaults.standard.bool(forKey: "paddle49Unlocked"), ball50Unlocked = UserDefaults.standard.bool(forKey: "paddle50Unlocked")
    
    var scrollView: SwiftySKScrollView?
    let moveableNode = SKNode()
    
    var page1ScrollView = SKSpriteNode(), page2ScrollView = SKSpriteNode(), page3ScrollView = SKSpriteNode(), page4ScrollView = SKSpriteNode(), page5ScrollView = SKSpriteNode(), page6ScrollView = SKSpriteNode(), page7ScrollView = SKSpriteNode(), page8ScrollView = SKSpriteNode(), page9ScrollView = SKSpriteNode(), page10ScrollView = SKSpriteNode(), page11ScrollView = SKSpriteNode(), page12ScrollView = SKSpriteNode(), page13ScrollView = SKSpriteNode(), page14ScrollView = SKSpriteNode(), page15ScrollView = SKSpriteNode(), page16ScrollView = SKSpriteNode(), page17ScrollView = SKSpriteNode()
    
    let buttonScrollFadeOut = SKAction.fadeOut(withDuration: 0.2)
    let buttonScrollFadeIn = SKAction.fadeIn(withDuration: 0.2)
    
    let scrollViewTop = SKSpriteNode()
    let scrollViewBottom = SKSpriteNode()
    
    let topScrollSensor = SKSpriteNode()
    let bottomScrollSensor = SKSpriteNode()
    
    let scrollViewPlaceHolder = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.physicsWorld.contactDelegate = self
        
        coinImg.size = CGSize(width: self.frame.width / 12, height: self.frame.width / 12)
        coinImg.position = CGPoint(x: self.frame.width / 2 - (coinImg.size.width * 1.5), y: self.frame.height / 1.3)
        coinImg.zPosition = 1
        self.addChild(coinImg)
        
        coinWalletLbl.text = "\(coinsInWallet)"
        coinWalletLbl.fontSize = self.frame.width / 12
        coinWalletLbl.fontColor = SKColor.darkGray
        coinWalletLbl.zPosition = 1
        coinWalletLbl.position = CGPoint(x: coinImg.position.x + (coinImg.size.width * 0.6), y: coinImg.position.y - (coinImg.size.height * 0.35))
        coinWalletLbl.horizontalAlignmentMode = .left
        self.addChild(coinWalletLbl)
        
        addChild(moveableNode)
        createScrollView()
        
        scrollViewTop.size = CGSize(width: 50, height: 50)
        scrollViewTop.position = CGPoint(x: self.frame.width / 2, y: page1ScrollView.position.y + (page1ScrollView.size.height * 0.6))
        scrollViewTop.color = SKColor.red
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
        scrollViewBottom.position = CGPoint(x: self.frame.width / 2, y: page3ScrollView.position.y - (page3ScrollView.size.height * 2))
        scrollViewBottom.name = "scrollViewBottom"
        scrollViewBottom.color = SKColor.clear
        scrollViewBottom.zPosition = 1
        self.addChild(scrollViewBottom)
        scrollViewBottom.physicsBody = SKPhysicsBody(rectangleOf: scrollViewBottom.size)
        scrollViewBottom.physicsBody?.affectedByGravity = false
        scrollViewBottom.physicsBody?.isDynamic = true
        scrollViewBottom.physicsBody?.categoryBitMask = PhysicsCategory.scrollBarriers
        scrollViewBottom.physicsBody?.collisionBitMask = 0
        scrollViewBottom.physicsBody?.contactTestBitMask = PhysicsCategory.scrollButtons
        
        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        background.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        background.zPosition = -1
        self.addChild(background)
        
        scrollViewPlaceHolder.size = CGSize(width: self.frame.width / 10, height: self.frame.width / 10)
        scrollViewPlaceHolder.name = "scrollViewPlaceHolder"
        scrollViewPlaceHolder.zPosition = 1
        scrollViewPlaceHolder.physicsBody = SKPhysicsBody(rectangleOf: scrollViewPlaceHolder.size)
        scrollViewPlaceHolder.physicsBody?.affectedByGravity = false
        scrollViewPlaceHolder.physicsBody?.isDynamic = true
        scrollViewPlaceHolder.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        scrollViewPlaceHolder.physicsBody?.collisionBitMask = 0
        scrollViewPlaceHolder.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        selector.size = CGSize(width: self.frame.width / 5.5, height: self.frame.width / 5.5)
        selector.color = SKColor.yellow
        selector.colorBlendFactor = 0.8
        selector.zPosition = 1
        
        ball1.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball1.name = "ball1"
        ball1.zPosition = 2
        ball1.physicsBody = SKPhysicsBody(rectangleOf: ball1.size)
        ball1.physicsBody?.affectedByGravity = false
        ball1.physicsBody?.isDynamic = true
        ball1.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball1.physicsBody?.collisionBitMask = 0
        ball1.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball2Unlocked == true && ballInt == 2 {
            ball2.colorBlendFactor = 0
        } else if ball2Unlocked == true && ballInt != 2 {
            ball2.colorBlendFactor = 0
        } else if ball2Unlocked == false {
            ball2.color = SKColor.black
            ball2.colorBlendFactor = 0.8
            
            ball2Lbl.text = "10"
            ball2Lbl.fontColor = SKColor.white
            ball2Lbl.fontSize = self.frame.width / 25
            if ball2Unlocked == true {
                ball2Lbl.alpha = 0
            } else {
                ball2Lbl.alpha = 1
            }
            ball2Lbl.position = CGPoint(x: ball2.position.x, y: ball2.position.y - (ball2.size.height / 15))
            ball2Lbl.zPosition = 3
            page1ScrollView.addChild(ball2Lbl)
        }
        
        ball2.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball2.name = "ball2"
        ball2.zPosition = 2
        ball2.physicsBody = SKPhysicsBody(rectangleOf: ball2.size)
        ball2.physicsBody?.affectedByGravity = false
        ball2.physicsBody?.isDynamic = true
        ball2.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball2.physicsBody?.collisionBitMask = 0
        ball2.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball3Unlocked == true && ballInt == 3 {
            ball3.colorBlendFactor = 0
        } else if ball3Unlocked == true && ballInt != 3 {
            ball3.colorBlendFactor = 0
        } else if ball3Unlocked == false {
            ball3.color = SKColor.black
            ball3.colorBlendFactor = 0.8
            
            ball3Lbl.text = "10"
            ball3Lbl.fontColor = SKColor.white
            ball3Lbl.fontSize = self.frame.width / 25
            if ball3Unlocked == true {
                ball3Lbl.alpha = 0
            } else {
                ball3Lbl.alpha = 1
            }
            ball3Lbl.position = CGPoint(x: ball3.position.x, y: ball3.position.y - (ball3.size.height / 15))
            ball3Lbl.zPosition = 3
            page1ScrollView.addChild(ball3Lbl)
        }
        
        ball3.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball3.name = "ball3"
        ball3.zPosition = 2
        ball3.physicsBody = SKPhysicsBody(rectangleOf: ball3.size)
        ball3.physicsBody?.affectedByGravity = false
        ball3.physicsBody?.isDynamic = true
        ball3.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball3.physicsBody?.collisionBitMask = 0
        ball3.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball4Unlocked == true && ballInt == 4 {
            ball4.colorBlendFactor = 0
        } else if ball4Unlocked == true && ballInt != 4 {
            ball4.colorBlendFactor = 0
        } else if ball4Unlocked == false {
            ball4.color = SKColor.black
            ball4.colorBlendFactor = 0.8
            
            ball4Lbl.text = "10"
            ball4Lbl.fontColor = SKColor.white
            ball4Lbl.fontSize = self.frame.width / 25
            if ball4Unlocked == true {
                ball4Lbl.alpha = 0
            } else {
                ball4Lbl.alpha = 1
            }
            ball4Lbl.position = CGPoint(x: ball4.position.x, y: ball4.position.y - (ball4.size.height / 15))
            ball4Lbl.zPosition = 3
            page2ScrollView.addChild(ball4Lbl)
        }
        
        ball4.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball4.name = "ball4"
        ball4.zPosition = 2
        ball4.physicsBody = SKPhysicsBody(rectangleOf: ball4.size)
        ball4.physicsBody?.affectedByGravity = false
        ball4.physicsBody?.isDynamic = true
        ball4.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball4.physicsBody?.collisionBitMask = 0
        ball4.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball5Unlocked == true && ballInt == 5 {
            ball5.colorBlendFactor = 0
        } else if ball5Unlocked == true && ballInt != 5 {
            ball5.colorBlendFactor = 0
        } else if ball5Unlocked == false {
            ball5.color = SKColor.black
            ball5.colorBlendFactor = 0.8
            
            ball5Lbl.text = "10"
            ball5Lbl.fontColor = SKColor.white
            ball5Lbl.fontSize = self.frame.width / 25
            if ball5Unlocked == true {
                ball5Lbl.alpha = 0
            } else {
                ball5Lbl.alpha = 1
            }
            ball5Lbl.position = CGPoint(x: ball5.position.x, y: ball5.position.y - (ball5.size.height / 15))
            ball5Lbl.zPosition = 3
            page2ScrollView.addChild(ball5Lbl)
        }
        
        ball5.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball5.name = "ball5"
        ball5.zPosition = 2
        ball5.physicsBody = SKPhysicsBody(rectangleOf: ball5.size)
        ball5.physicsBody?.affectedByGravity = false
        ball5.physicsBody?.isDynamic = true
        ball5.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball5.physicsBody?.collisionBitMask = 0
        ball5.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball6Unlocked == true && ballInt == 6 {
            ball6.colorBlendFactor = 0
        } else if ball6Unlocked == true && ballInt != 6 {
            ball6.colorBlendFactor = 0
        } else if ball6Unlocked == false {
            ball6.color = SKColor.black
            ball6.colorBlendFactor = 0.8
            
            ball6Lbl.text = "10"
            ball6Lbl.fontColor = SKColor.white
            ball6Lbl.fontSize = self.frame.width / 25
            if ball6Unlocked == true {
                ball6Lbl.alpha = 0
            } else {
                ball6Lbl.alpha = 1
            }
            ball6Lbl.position = CGPoint(x: ball6.position.x, y: ball6.position.y - (ball6.size.height / 15))
            ball6Lbl.zPosition = 3
            page2ScrollView.addChild(ball6Lbl)
        }
        
        ball6.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball6.name = "ball6"
        ball6.zPosition = 2
        ball6.physicsBody = SKPhysicsBody(rectangleOf: ball6.size)
        ball6.physicsBody?.affectedByGravity = false
        ball6.physicsBody?.isDynamic = true
        ball6.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball6.physicsBody?.collisionBitMask = 0
        ball6.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball7Unlocked == true && ballInt == 7 {
            ball7.colorBlendFactor = 0
        } else if ball7Unlocked == true && ballInt != 7 {
            ball7.colorBlendFactor = 0
        } else if ball7Unlocked == false {
            ball7.color = SKColor.black
            ball7.colorBlendFactor = 0.8
            
            ball7Lbl.text = "10"
            ball7Lbl.fontColor = SKColor.white
            ball7Lbl.fontSize = self.frame.width / 25
            if ball7Unlocked == true {
                ball7Lbl.alpha = 0
            } else {
                ball7Lbl.alpha = 1
            }
            ball7Lbl.position = CGPoint(x: ball7.position.x, y: ball7.position.y - (ball7.size.height / 15))
            ball7Lbl.zPosition = 3
            page3ScrollView.addChild(ball7Lbl)
        }
        
        ball7.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball7.name = "ball7"
        ball7.zPosition = 2
        ball7.physicsBody = SKPhysicsBody(rectangleOf: ball7.size)
        ball7.physicsBody?.affectedByGravity = false
        ball7.physicsBody?.isDynamic = true
        ball7.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball7.physicsBody?.collisionBitMask = 0
        ball7.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball8Unlocked == true && ballInt == 8 {
            ball8.colorBlendFactor = 0
        } else if ball8Unlocked == true && ballInt != 8 {
            ball8.colorBlendFactor = 0
        } else if ball8Unlocked == false {
            ball8.color = SKColor.black
            ball8.colorBlendFactor = 0.8
            
            ball8Lbl.text = "10"
            ball8Lbl.fontColor = SKColor.white
            ball8Lbl.fontSize = self.frame.width / 25
            if ball8Unlocked == true {
                ball8Lbl.alpha = 0
            } else {
                ball8Lbl.alpha = 1
            }
            ball8Lbl.position = CGPoint(x: ball8.position.x, y: ball8.position.y - (ball8.size.height / 15))
            ball8Lbl.zPosition = 3
            page3ScrollView.addChild(ball8Lbl)
        }
        
        ball8.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball8.name = "ball8"
        ball8.zPosition = 2
        ball8.physicsBody = SKPhysicsBody(rectangleOf: ball8.size)
        ball8.physicsBody?.affectedByGravity = false
        ball8.physicsBody?.isDynamic = true
        ball8.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball8.physicsBody?.collisionBitMask = 0
        ball8.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball9Unlocked == true && ballInt == 9 {
            ball9.colorBlendFactor = 0
        } else if ball9Unlocked == true && ballInt != 9 {
            ball9.colorBlendFactor = 0
        } else if ball9Unlocked == false {
            ball9.color = SKColor.black
            ball9.colorBlendFactor = 0.8
            
            ball9Lbl.text = "10"
            ball9Lbl.fontColor = SKColor.white
            ball9Lbl.fontSize = self.frame.width / 25
            if ball9Unlocked == true {
                ball9Lbl.alpha = 0
            } else {
                ball9Lbl.alpha = 1
            }
            ball9Lbl.position = CGPoint(x: ball9.position.x, y: ball9.position.y - (ball9.size.height / 15))
            ball9Lbl.zPosition = 3
            page3ScrollView.addChild(ball9Lbl)
        }
        
        ball9.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball9.name = "ball9"
        ball9.zPosition = 2
        ball9.physicsBody = SKPhysicsBody(rectangleOf: ball9.size)
        ball9.physicsBody?.affectedByGravity = false
        ball9.physicsBody?.isDynamic = true
        ball9.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball9.physicsBody?.collisionBitMask = 0
        ball9.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball10Unlocked == true && ballInt == 10 {
            ball10.colorBlendFactor = 0
        } else if ball10Unlocked == true && ballInt != 10 {
            ball10.colorBlendFactor = 0
        } else if ball10Unlocked == false {
            ball10.color = SKColor.black
            ball10.colorBlendFactor = 0.8
            
            ball10Lbl.text = "10"
            ball10Lbl.fontColor = SKColor.white
            ball10Lbl.fontSize = self.frame.width / 25
            if ball10Unlocked == true {
                ball10.alpha = 0
            } else {
                ball10.alpha = 1
            }
            ball10Lbl.position = CGPoint(x: ball10.position.x, y: ball10.position.y - (ball10.size.height / 15))
            ball10Lbl.zPosition = 3
            page4ScrollView.addChild(ball10Lbl)
        }
        
        ball10.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball10.name = "ball10"
        ball10.zPosition = 2
        ball10.alpha = 0
        ball10.physicsBody = SKPhysicsBody(rectangleOf: ball10.size)
        ball10.physicsBody?.affectedByGravity = false
        ball10.physicsBody?.isDynamic = true
        ball10.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball10.physicsBody?.collisionBitMask = 0
        ball10.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball11Unlocked == true && ballInt == 11 {
            ball11.colorBlendFactor = 0
        } else if ball11Unlocked == true && ballInt != 11 {
            ball11.colorBlendFactor = 0
        } else if ball11Unlocked == false {
            ball11.color = SKColor.black
            ball11.colorBlendFactor = 0.8
            
            ball11Lbl.text = "10"
            ball11Lbl.fontColor = SKColor.white
            ball11Lbl.fontSize = self.frame.width / 25
            if ball11Unlocked == true {
                ball11Lbl.alpha = 0
            } else {
                ball11Lbl.alpha = 1
            }
            ball11Lbl.position = CGPoint(x: ball11.position.x, y: ball11.position.y - (ball11.size.height / 15))
            ball11Lbl.zPosition = 3
            page4ScrollView.addChild(ball11Lbl)
        }
        
        ball11.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball11.name = "ball11"
        ball11.zPosition = 2
        ball11.alpha = 0
        ball11.physicsBody = SKPhysicsBody(rectangleOf: ball11.size)
        ball11.physicsBody?.affectedByGravity = false
        ball11.physicsBody?.isDynamic = true
        ball11.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball11.physicsBody?.collisionBitMask = 0
        ball11.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball12Unlocked == true && ballInt == 12 {
            ball12.colorBlendFactor = 0
        } else if ball12Unlocked == true && ballInt != 12 {
            ball12.colorBlendFactor = 0
        } else if ball12Unlocked == false {
            ball12.color = SKColor.black
            ball12.colorBlendFactor = 0.8
            
            ball12Lbl.text = "10"
            ball12Lbl.fontColor = SKColor.white
            ball12Lbl.fontSize = self.frame.width / 25
            if ball12Unlocked == true {
                ball12Lbl.alpha = 0
            } else {
                ball12Lbl.alpha = 1
            }
            ball12Lbl.position = CGPoint(x: ball12.position.x, y: ball12.position.y - (ball12.size.height / 15))
            ball12Lbl.zPosition = 3
            page4ScrollView.addChild(ball12Lbl)
        }
        
        ball12.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball12.name = "ball12"
        ball12.zPosition = 2
        ball12.alpha = 0
        ball12.physicsBody = SKPhysicsBody(rectangleOf: ball12.size)
        ball12.physicsBody?.affectedByGravity = false
        ball12.physicsBody?.isDynamic = true
        ball12.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball12.physicsBody?.collisionBitMask = 0
        ball12.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball13Unlocked == true && ballInt == 13 {
            ball13.colorBlendFactor = 0
        } else if ball13Unlocked == true && ballInt != 13 {
            ball13.colorBlendFactor = 0
        } else if ball13Unlocked == false {
            ball13.color = SKColor.black
            ball13.colorBlendFactor = 0.8
            
            ball13Lbl.text = "10"
            ball13Lbl.fontColor = SKColor.white
            ball13Lbl.fontSize = self.frame.width / 25
            if ball13Unlocked == true {
                ball13Lbl.alpha = 0
            } else {
                ball13Lbl.alpha = 0
            }
            ball13Lbl.position = CGPoint(x: ball13.position.x, y: ball13.position.y - (ball13.size.height / 15))
            ball13Lbl.zPosition = 3
            page5ScrollView.addChild(ball13Lbl)
        }
        
        ball13.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball13.name = "ball13"
        ball13.zPosition = 2
        ball13.alpha = 0
        ball13.physicsBody = SKPhysicsBody(rectangleOf: ball13.size)
        ball13.physicsBody?.affectedByGravity = false
        ball13.physicsBody?.isDynamic = true
        ball13.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball13.physicsBody?.collisionBitMask = 0
        ball13.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball14Unlocked == true && ballInt == 14 {
            ball14.colorBlendFactor = 0
        } else if ball14Unlocked == true && ballInt != 14 {
            ball14.colorBlendFactor = 0
        } else if ball14Unlocked == false {
            ball14.color = SKColor.black
            ball14.colorBlendFactor = 0.8
            
            ball14Lbl.text = "10"
            ball14Lbl.fontColor = SKColor.white
            ball14Lbl.fontSize = self.frame.width / 25
            if ball14Unlocked == true {
                ball14Lbl.alpha = 0
            } else {
                ball14Lbl.alpha = 1
            }
            ball14Lbl.position = CGPoint(x: ball14.position.x, y: ball14.position.y - (ball14.size.height / 15))
            ball14Lbl.zPosition = 3
            page5ScrollView.addChild(ball14Lbl)
        }
        
        ball14.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball14.name = "ball14"
        ball14.zPosition = 2
        ball14.alpha = 0
        ball14.physicsBody = SKPhysicsBody(rectangleOf: ball14.size)
        ball14.physicsBody?.affectedByGravity = false
        ball14.physicsBody?.isDynamic = true
        ball14.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball14.physicsBody?.collisionBitMask = 0
        ball14.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball15Unlocked == true && ballInt == 15 {
            ball15.colorBlendFactor = 0
        } else if ball15Unlocked == true && ballInt != 15 {
            ball15.colorBlendFactor = 0
        } else if ball15Unlocked == false {
            ball15.color = SKColor.black
            ball15.colorBlendFactor = 0.8
            
            ball15Lbl.text = "10"
            ball15Lbl.fontColor = SKColor.white
            ball15Lbl.fontSize = self.frame.width / 25
            if ball15Unlocked == true {
                ball15Lbl.alpha = 0
            } else {
                ball15Lbl.alpha = 1
            }
            ball15Lbl.position = CGPoint(x: ball15.position.x, y: ball15.position.y - (ball15.size.height / 15))
            ball15Lbl.zPosition = 3
            page5ScrollView.addChild(ball15Lbl)
        }
        
        ball15.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball15.name = "ball15"
        ball15.zPosition = 2
        ball15.alpha = 0
        ball15.physicsBody = SKPhysicsBody(rectangleOf: ball15.size)
        ball15.physicsBody?.affectedByGravity = false
        ball15.physicsBody?.isDynamic = true
        ball15.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball15.physicsBody?.collisionBitMask = 0
        ball15.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball16Unlocked == true && ballInt == 16 {
            ball16.colorBlendFactor = 0
        } else if ball16Unlocked == true && ballInt != 16 {
            ball16.colorBlendFactor = 0
        } else if ball16Unlocked == false {
            ball16.color = SKColor.black
            ball16.colorBlendFactor = 0.8
            
            ball16Lbl.text = "10"
            ball16Lbl.fontColor = SKColor.white
            ball16Lbl.fontSize = self.frame.width / 25
            if ball16Unlocked == true {
                ball16Lbl.alpha = 0
            } else {
                ball16Lbl.alpha = 1
            }
            ball16Lbl.position = CGPoint(x: ball16.position.x, y: ball16.position.y - (ball16.size.height / 15))
            ball16Lbl.zPosition = 3
            page6ScrollView.addChild(ball16Lbl)
        }
        
        ball16.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball16.name = "ball16"
        ball16.zPosition = 2
        ball16.alpha = 0
        ball16.physicsBody = SKPhysicsBody(rectangleOf: ball16.size)
        ball16.physicsBody?.affectedByGravity = false
        ball16.physicsBody?.isDynamic = true
        ball16.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball16.physicsBody?.collisionBitMask = 0
        ball16.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball17Unlocked == true && ballInt == 17 {
            ball17.colorBlendFactor = 0
        } else if ball17Unlocked == true && ballInt != 17 {
            ball17.colorBlendFactor = 0
        } else if ball17Unlocked == false {
            ball17.color = SKColor.black
            ball17.colorBlendFactor = 0.8
            
            ball17Lbl.text = "15"
            ball17Lbl.fontColor = SKColor.white
            ball17Lbl.fontSize = self.frame.width / 25
            if ball17Unlocked == true {
                ball17Lbl.alpha = 0
            } else {
                ball17Lbl.alpha = 1
            }
            ball17Lbl.position = CGPoint(x: ball17.position.x, y: ball17.position.y - (ball17.size.height / 15))
            ball17Lbl.zPosition = 3
            page6ScrollView.addChild(ball17Lbl)
        }
        
        ball17.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball17.name = "ball17"
        ball17.zPosition = 2
        ball17.alpha = 0
        ball17.physicsBody = SKPhysicsBody(rectangleOf: ball17.size)
        ball17.physicsBody?.affectedByGravity = false
        ball17.physicsBody?.isDynamic = true
        ball17.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball17.physicsBody?.collisionBitMask = 0
        ball17.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball18Unlocked == true && ballInt == 18 {
            ball18.colorBlendFactor = 0
        } else if ball18Unlocked == true && ballInt != 18 {
            ball18.colorBlendFactor = 0
        } else if ball18Unlocked == false {
            ball18.color = SKColor.black
            ball18.colorBlendFactor = 0.8
            
            ball18Lbl.text = "15"
            ball18Lbl.fontColor = SKColor.white
            ball18Lbl.fontSize = self.frame.width / 25
            if ball18Unlocked == true {
                ball18Lbl.alpha = 0
            } else {
                ball18Lbl.alpha = 1
            }
            ball18Lbl.position = CGPoint(x: ball18.position.x, y: ball18.position.y - (ball18.size.height / 15))
            ball18Lbl.zPosition = 3
            page6ScrollView.addChild(ball18Lbl)
        }
        
        ball18.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball18.name = "ball18"
        ball18.zPosition = 2
        ball18.alpha = 0
        ball18.physicsBody = SKPhysicsBody(rectangleOf: ball18.size)
        ball18.physicsBody?.affectedByGravity = false
        ball18.physicsBody?.isDynamic = true
        ball18.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball18.physicsBody?.collisionBitMask = 0
        ball18.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball19Unlocked == true && ballInt == 19 {
            ball19.colorBlendFactor = 0
        } else if ball19Unlocked == true && ballInt != 19 {
            ball19.colorBlendFactor = 0
        } else if ball19Unlocked == false {
            ball19.color = SKColor.black
            ball19.colorBlendFactor = 0.8
            
            ball19Lbl.text = "15"
            ball19Lbl.fontColor = SKColor.white
            ball19Lbl.fontSize = self.frame.width / 25
            if ball19Unlocked == true {
                ball19Lbl.alpha = 0
            } else {
                ball19Lbl.alpha = 1
            }
            ball19Lbl.position = CGPoint(x: ball19.position.x, y: ball19.position.y - (ball19.size.height / 15))
            ball19Lbl.zPosition = 3
            page7ScrollView.addChild(ball19Lbl)
        }
        
        ball19.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball19.name = "ball19"
        ball19.alpha = 0
        ball19.zPosition = 2
        ball19.physicsBody = SKPhysicsBody(rectangleOf: ball19.size)
        ball19.physicsBody?.affectedByGravity = false
        ball19.physicsBody?.isDynamic = true
        ball19.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball19.physicsBody?.collisionBitMask = 0
        ball19.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball20Unlocked == true && ballInt == 20 {
            ball20.colorBlendFactor = 0
        } else if ball20Unlocked == true && ballInt != 20 {
            ball20.colorBlendFactor = 0
        } else if ball20Unlocked == false {
            ball20.color = SKColor.black
            ball20.colorBlendFactor = 0.8
            
            ball20Lbl.text = "15"
            ball20Lbl.fontColor = SKColor.white
            ball20Lbl.fontSize = self.frame.width / 25
            if ball20Unlocked == true {
                ball20Lbl.alpha = 0
            } else {
                ball20Lbl.alpha = 1
            }
            ball20Lbl.position = CGPoint(x: ball20.position.x, y: ball20.position.y - (ball20.size.height / 15))
            ball20Lbl.zPosition = 3
            page7ScrollView.addChild(ball20Lbl)
        }
        
        ball20.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball20.name = "ball20"
        ball20.zPosition = 2
        ball20.alpha = 0
        ball20.physicsBody = SKPhysicsBody(rectangleOf: ball20.size)
        ball20.physicsBody?.affectedByGravity = false
        ball20.physicsBody?.isDynamic = true
        ball20.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball20.physicsBody?.collisionBitMask = 0
        ball20.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball21Unlocked == true && ballInt == 21 {
            ball21.colorBlendFactor = 0
        } else if ball21Unlocked == true && ballInt != 21 {
            ball21.colorBlendFactor = 0
        } else if ball21Unlocked == false {
            ball21.color = SKColor.black
            ball21.colorBlendFactor = 0.8
            
            ball21Lbl.text = "15"
            ball21Lbl.fontColor = SKColor.white
            ball21Lbl.fontSize = self.frame.width / 25
            if ball21Unlocked == true {
                ball21Lbl.alpha = 0
            } else {
                ball21Lbl.alpha = 1
            }
            ball21Lbl.position = CGPoint(x: ball21.position.x, y: ball21.position.y - (ball21.size.height / 15))
            ball21Lbl.zPosition = 3
            page7ScrollView.addChild(ball21Lbl)
        }
        
        ball21.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball21.name = "ball21"
        ball21.zPosition = 2
        ball21.alpha = 0
        ball21.physicsBody = SKPhysicsBody(rectangleOf: ball21.size)
        ball21.physicsBody?.affectedByGravity = false
        ball21.physicsBody?.isDynamic = true
        ball21.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball21.physicsBody?.collisionBitMask = 0
        ball21.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball22Unlocked == true && ballInt == 22 {
            ball22.colorBlendFactor = 0
        } else if ball22Unlocked == true && ballInt != 22 {
            ball22.colorBlendFactor = 0
        } else if ball22Unlocked == false {
            ball22.color = SKColor.black
            ball22.colorBlendFactor = 0.8
            
            ball22Lbl.text = "15"
            ball22Lbl.fontColor = SKColor.white
            ball22Lbl.fontSize = self.frame.width / 25
            if ball22Unlocked == true {
                ball22Lbl.alpha = 0
            } else {
                ball22Lbl.alpha = 1
            }
            ball22Lbl.position = CGPoint(x: ball22.position.x, y: ball22.position.y - (ball22.size.height / 15))
            ball22Lbl.zPosition = 3
            page8ScrollView.addChild(ball22Lbl)
        }
        
        ball22.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball22.name = "ball22"
        ball22.zPosition = 2
        ball22.alpha = 0
        ball22.physicsBody = SKPhysicsBody(rectangleOf: ball22.size)
        ball22.physicsBody?.affectedByGravity = false
        ball22.physicsBody?.isDynamic = true
        ball22.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball22.physicsBody?.collisionBitMask = 0
        ball22.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball23Unlocked == true && ballInt == 23 {
            ball23.colorBlendFactor = 0
        } else if ball23Unlocked == true && ballInt != 23 {
            ball23.colorBlendFactor = 0
        } else if ball23Unlocked == false {
            ball23.color = SKColor.black
            ball23.colorBlendFactor = 0.8
            
            ball23Lbl.text = "20"
            ball23Lbl.fontColor = SKColor.white
            ball23Lbl.fontSize = self.frame.width / 25
            if ball23Unlocked == true {
                ball23Lbl.alpha = 0
            } else {
                ball23Lbl.alpha = 1
            }
            ball23Lbl.position = CGPoint(x: ball23.position.x, y: ball23.position.y - (ball23.size.height / 15))
            ball23Lbl.zPosition = 3
            page8ScrollView.addChild(ball23Lbl)
        }
        
        ball23.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball23.name = "ball23"
        ball23.zPosition = 2
        ball23.alpha = 0
        ball23.physicsBody = SKPhysicsBody(rectangleOf: ball23.size)
        ball23.physicsBody?.affectedByGravity = false
        ball23.physicsBody?.isDynamic = true
        ball23.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball23.physicsBody?.collisionBitMask = 0
        ball23.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball24Unlocked == true && ballInt == 24 {
            ball24.colorBlendFactor = 0
        } else if ball24Unlocked == true && ballInt != 24 {
            ball24.colorBlendFactor = 0
        } else if ball24Unlocked == false {
            ball24.color = SKColor.black
            ball24.colorBlendFactor = 0.8
            
            ball24Lbl.text = "20"
            ball24Lbl.fontColor = SKColor.white
            ball24Lbl.fontSize = self.frame.width / 25
            if ball24Unlocked == true {
                ball24Lbl.alpha = 0
            } else {
                ball24Lbl.alpha = 1
            }
            ball24Lbl.position = CGPoint(x: ball24.position.x, y: ball24.position.y - (ball24.size.height / 15))
            ball24Lbl.zPosition = 3
            page8ScrollView.addChild(ball24Lbl)
        }
        
        ball24.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball24.name = "ball24"
        ball24.zPosition = 2
        ball24.alpha = 0
        ball24.physicsBody = SKPhysicsBody(rectangleOf: ball24.size)
        ball24.physicsBody?.affectedByGravity = false
        ball24.physicsBody?.isDynamic = true
        ball24.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball24.physicsBody?.collisionBitMask = 0
        ball24.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball25Unlocked == true && ballInt == 25 {
            ball25.colorBlendFactor = 0
        } else if ball25Unlocked == true && ballInt != 25 {
            ball25.colorBlendFactor = 0
        } else if ball25Unlocked == false {
            ball25.color = SKColor.black
            ball25.colorBlendFactor = 0.8
            
            ball25Lbl.text = "20"
            ball25Lbl.fontColor = SKColor.white
            ball25Lbl.fontSize = self.frame.width / 25
            if ball25Unlocked == true {
                ball25Lbl.alpha = 0
            } else {
                ball25Lbl.alpha = 1
            }
            ball25Lbl.position = CGPoint(x: ball25.position.x, y: ball25.position.y - (ball25.size.height / 15))
            ball25Lbl.zPosition = 3
            page9ScrollView.addChild(ball25Lbl)
        }
        
        ball25.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball25.name = "ball25"
        ball25.zPosition = 2
        ball25.alpha = 0
        ball25.physicsBody = SKPhysicsBody(rectangleOf: ball25.size)
        ball25.physicsBody?.affectedByGravity = false
        ball25.physicsBody?.isDynamic = true
        ball25.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball25.physicsBody?.collisionBitMask = 0
        ball25.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball26Unlocked == true && ballInt == 26 {
            ball26.colorBlendFactor = 0
        } else if ball26Unlocked == true && ballInt != 26 {
            ball26.colorBlendFactor = 0
        } else if ball26Unlocked == false {
            ball26.color = SKColor.black
            ball26.colorBlendFactor = 0.8
            
            ball26Lbl.text = "20"
            ball26Lbl.fontColor = SKColor.white
            ball26Lbl.fontSize = self.frame.width / 25
            if ball26Unlocked == true {
                ball26Lbl.alpha = 0
            } else {
                ball26Lbl.alpha = 1
            }
            ball26Lbl.position = CGPoint(x: ball26.position.x, y: ball26.position.y - (ball26.size.height / 15))
            ball26Lbl.zPosition = 3
            page9ScrollView.addChild(ball26Lbl)
        }
        
        ball26.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball26.name = "ball26"
        ball26.zPosition = 2
        ball26.alpha = 0
        ball26.physicsBody = SKPhysicsBody(rectangleOf: ball26.size)
        ball26.physicsBody?.affectedByGravity = false
        ball26.physicsBody?.isDynamic = true
        ball26.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball26.physicsBody?.collisionBitMask = 0
        ball26.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball27Unlocked == true && ballInt == 27 {
            ball27.colorBlendFactor = 0
        } else if ball27Unlocked == true && ballInt != 27 {
            ball27.colorBlendFactor = 0
        } else if ball27Unlocked == false {
            ball27.color = SKColor.black
            ball27.colorBlendFactor = 0.8
            
            ball27Lbl.text = "20"
            ball27Lbl.fontColor = SKColor.white
            ball27Lbl.fontSize = self.frame.width / 25
            if ball27Unlocked == true {
                ball27Lbl.alpha = 0
            } else {
                ball27Lbl.alpha = 1
            }
            ball27Lbl.position = CGPoint(x: ball27.position.x, y: ball27.position.y - (ball27.size.height / 15))
            ball27Lbl.zPosition = 3
            page9ScrollView.addChild(ball27Lbl)
        }
        
        ball27.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball27.name = "ball27"
        ball27.zPosition = 2
        ball27.alpha = 0
        ball27.physicsBody = SKPhysicsBody(rectangleOf: ball27.size)
        ball27.physicsBody?.affectedByGravity = false
        ball27.physicsBody?.isDynamic = true
        ball27.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball27.physicsBody?.collisionBitMask = 0
        ball27.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball28Unlocked == true && ballInt == 28 {
            ball28.colorBlendFactor = 0
        } else if ball28Unlocked == true && ballInt != 28 {
            ball28.colorBlendFactor = 0
        } else if ball28Unlocked == false {
            ball28.color = SKColor.black
            ball28.colorBlendFactor = 0.8
            
            ball28Lbl.text = "20"
            ball28Lbl.fontColor = SKColor.white
            ball28Lbl.fontSize = self.frame.width / 25
            if ball28Unlocked == true {
                ball28Lbl.alpha = 0
            } else {
                ball28Lbl.alpha = 1
            }
            ball28Lbl.position = CGPoint(x: ball28.position.x, y: ball28.position.y - (ball28.size.height / 15))
            ball28Lbl.zPosition = 3
            page10ScrollView.addChild(ball28Lbl)
        }
        
        ball28.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball28.name = "ball28"
        ball28.zPosition = 2
        ball28.alpha = 0
        ball28.physicsBody = SKPhysicsBody(rectangleOf: ball28.size)
        ball28.physicsBody?.affectedByGravity = false
        ball28.physicsBody?.isDynamic = true
        ball28.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball28.physicsBody?.collisionBitMask = 0
        ball28.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball29Unlocked == true && ballInt == 29 {
            ball29.colorBlendFactor = 0
        } else if ball29Unlocked == true && ballInt != 29 {
            ball29.colorBlendFactor = 0
        } else if ball29Unlocked == false {
            ball29.color = SKColor.black
            ball29.colorBlendFactor = 0.8
            
            ball29Lbl.text = "20"
            ball29Lbl.fontColor = SKColor.white
            ball29Lbl.fontSize = self.frame.width / 25
            if ball29Unlocked == true {
                ball29Lbl.alpha = 0
            } else {
                ball29Lbl.alpha = 1
            }
            ball29Lbl.position = CGPoint(x: ball29.position.x, y: ball29.position.y - (ball29.size.height / 15))
            ball29Lbl.zPosition = 3
            page10ScrollView.addChild(ball29Lbl)
        }
        
        ball29.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball29.name = "ball29"
        ball29.zPosition = 2
        ball29.alpha = 0
        ball29.physicsBody = SKPhysicsBody(rectangleOf: ball29.size)
        ball29.physicsBody?.affectedByGravity = false
        ball29.physicsBody?.isDynamic = true
        ball29.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball29.physicsBody?.collisionBitMask = 0
        ball29.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball30Unlocked == true && ballInt == 30 {
            ball30.colorBlendFactor = 0
        } else if ball30Unlocked == true && ballInt != 30 {
            ball30.colorBlendFactor = 0
        } else if ball30Unlocked == false {
            ball30.color = SKColor.black
            ball30.colorBlendFactor = 0.8
            
            ball30Lbl.text = "20"
            ball30Lbl.fontColor = SKColor.white
            ball30Lbl.fontSize = self.frame.width / 25
            if ball30Unlocked == true {
                ball30Lbl.alpha = 0
            } else {
                ball30Lbl.alpha = 1
            }
            ball30Lbl.position = CGPoint(x: ball30.position.x, y: ball30.position.y - (ball30.size.height / 15))
            ball30Lbl.zPosition = 3
            page10ScrollView.addChild(ball30Lbl)
        }
        
        ball30.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball30.name = "ball30"
        ball30.zPosition = 2
        ball30.alpha = 0
        ball30.physicsBody = SKPhysicsBody(rectangleOf: ball30.size)
        ball30.physicsBody?.affectedByGravity = false
        ball30.physicsBody?.isDynamic = true
        ball30.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball30.physicsBody?.collisionBitMask = 0
        ball30.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball31Unlocked == true && ballInt == 31 {
            ball31.colorBlendFactor = 0
        } else if ball31Unlocked == true && ballInt != 31 {
            ball31.colorBlendFactor = 0
        } else if ball31Unlocked == false {
            ball31.color = SKColor.black
            ball31.colorBlendFactor = 0.8
            
            ball31Lbl.text = "25"
            ball31Lbl.fontColor = SKColor.white
            ball31Lbl.fontSize = self.frame.width / 25
            if ball31Unlocked == true {
                ball31Lbl.alpha = 0
            } else {
                ball31Lbl.alpha = 1
            }
            ball31Lbl.position = CGPoint(x: ball31.position.x, y: ball31.position.y - (ball31.size.height / 15))
            ball31Lbl.zPosition = 3
            page11ScrollView.addChild(ball31Lbl)
        }
        
        ball31.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball31.name = "ball31"
        ball31.zPosition = 2
        ball31.alpha = 0
        ball31.physicsBody = SKPhysicsBody(rectangleOf: ball31.size)
        ball31.physicsBody?.affectedByGravity = false
        ball31.physicsBody?.isDynamic = true
        ball31.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball31.physicsBody?.collisionBitMask = 0
        ball31.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball32Unlocked == true && ballInt == 32 {
            ball32.colorBlendFactor = 0
        } else if ball32Unlocked == true && ballInt != 32 {
            ball32.colorBlendFactor = 0
        } else if ball32Unlocked == false {
            ball32.color = SKColor.black
            ball32.colorBlendFactor = 0.8
            
            ball32Lbl.text = "25"
            ball32Lbl.fontColor = SKColor.white
            ball32Lbl.fontSize = self.frame.width / 25
            if ball32Unlocked == true {
                ball32Lbl.alpha = 0
            } else {
                ball32Lbl.alpha = 1
            }
            ball32Lbl.position = CGPoint(x: ball32.position.x, y: ball32.position.y - (ball32.size.height / 15))
            ball32Lbl.zPosition = 3
            page11ScrollView.addChild(ball32Lbl)
        }
        
        ball32.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball32.name = "ball32"
        ball32.zPosition = 2
        ball32.alpha = 0
        ball32.physicsBody = SKPhysicsBody(rectangleOf: ball32.size)
        ball32.physicsBody?.affectedByGravity = false
        ball32.physicsBody?.isDynamic = true
        ball32.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball32.physicsBody?.collisionBitMask = 0
        ball32.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball33Unlocked == true && ballInt == 33 {
            ball33.colorBlendFactor = 0
        } else if ball33Unlocked == true && ballInt != 33 {
            ball33.colorBlendFactor = 0
        } else if ball33Unlocked == false {
            ball33.color = SKColor.black
            ball33.colorBlendFactor = 0.8
            
            ball33Lbl.text = "25"
            ball33Lbl.fontColor = SKColor.white
            ball33Lbl.fontSize = self.frame.width / 25
            if ball33Unlocked == true {
                ball33Lbl.alpha = 0
            } else {
                ball33Lbl.alpha = 1
            }
            ball33Lbl.position = CGPoint(x: ball33.position.x, y: ball33.position.y - (ball33.size.height / 15))
            ball33Lbl.zPosition = 3
            page11ScrollView.addChild(ball33Lbl)
        }
        
        ball33.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball33.name = "ball33"
        ball33.zPosition = 2
        ball33.alpha = 0
        ball33.physicsBody = SKPhysicsBody(rectangleOf: ball33.size)
        ball33.physicsBody?.affectedByGravity = false
        ball33.physicsBody?.isDynamic = true
        ball33.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball33.physicsBody?.collisionBitMask = 0
        ball33.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball34Unlocked == true && ballInt == 34 {
            ball34.colorBlendFactor = 0
        } else if ball34Unlocked == true && ballInt != 34 {
            ball34.colorBlendFactor = 0
        } else if ball34Unlocked == false {
            ball34.color = SKColor.black
            ball34.colorBlendFactor = 0.8
            
            ball34Lbl.text = "25"
            ball34Lbl.fontColor = SKColor.white
            ball34Lbl.fontSize = self.frame.width / 25
            if ball34Unlocked == true {
                ball34Lbl.alpha = 0
            } else {
                ball34Lbl.alpha = 1
            }
            ball34Lbl.position = CGPoint(x: ball34.position.x, y: ball34.position.y - (ball34.size.height / 15))
            ball34Lbl.zPosition = 3
            page12ScrollView.addChild(ball34Lbl)
        }
        
        ball34.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball34.name = "ball34"
        ball34.zPosition = 2
        ball34.alpha = 0
        ball34.physicsBody = SKPhysicsBody(rectangleOf: ball34.size)
        ball34.physicsBody?.affectedByGravity = false
        ball34.physicsBody?.isDynamic = true
        ball34.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball34.physicsBody?.collisionBitMask = 0
        ball34.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball35Unlocked == true && ballInt == 35 {
            ball35.colorBlendFactor = 0
        } else if ball35Unlocked == true && ballInt != 35 {
            ball35.colorBlendFactor = 0
        } else if ball35Unlocked == false {
            ball35.color = SKColor.black
            ball35.colorBlendFactor = 0.8
            
            ball35Lbl.text = "25"
            ball35Lbl.fontColor = SKColor.white
            ball35Lbl.fontSize = self.frame.width / 25
            if ball35Unlocked == true {
                ball35Lbl.alpha = 0
            } else {
                ball35Lbl.alpha = 1
            }
            ball35Lbl.position = CGPoint(x: ball35.position.x, y: ball35.position.y - (ball35.size.height / 15))
            ball35Lbl.zPosition = 3
            page12ScrollView.addChild(ball35Lbl)
        }
        
        ball35.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball35.name = "ball35"
        ball35.zPosition = 2
        ball35.alpha = 0
        ball35.physicsBody = SKPhysicsBody(rectangleOf: ball35.size)
        ball35.physicsBody?.affectedByGravity = false
        ball35.physicsBody?.isDynamic = true
        ball35.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball35.physicsBody?.collisionBitMask = 0
        ball35.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball36Unlocked == true && ballInt == 36 {
            ball36.colorBlendFactor = 0
        } else if ball36Unlocked == true && ballInt != 36 {
            ball36.colorBlendFactor = 0
        } else if ball36Unlocked == false {
            ball36.color = SKColor.black
            ball36.colorBlendFactor = 0.8
            
            ball36Lbl.text = "25"
            ball36Lbl.fontColor = SKColor.white
            ball36Lbl.fontSize = self.frame.width / 25
            if ball36Unlocked == true {
                ball36Lbl.alpha = 0
            } else {
                ball36Lbl.alpha = 1
            }
            ball36Lbl.position = CGPoint(x: ball36.position.x, y: ball36.position.y - (ball36.size.height / 15))
            ball36Lbl.zPosition = 3
            page12ScrollView.addChild(ball36Lbl)
        }
        
        ball36.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball36.name = "ball36"
        ball36.zPosition = 2
        ball36.alpha = 0
        ball36.physicsBody = SKPhysicsBody(rectangleOf: ball36.size)
        ball36.physicsBody?.affectedByGravity = false
        ball36.physicsBody?.isDynamic = true
        ball36.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball36.physicsBody?.collisionBitMask = 0
        ball36.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball37Unlocked == true && ballInt == 37 {
            ball37.colorBlendFactor = 0
        } else if ball37Unlocked == true && ballInt != 37 {
            ball37.colorBlendFactor = 0
        } else if ball37Unlocked == false {
            ball37.color = SKColor.black
            ball37.colorBlendFactor = 0.8
            
            ball37Lbl.text = "30"
            ball37Lbl.fontColor = SKColor.white
            ball37Lbl.fontSize = self.frame.width / 25
            if ball37Unlocked == true {
                ball37Lbl.alpha = 0
            } else {
                ball37Lbl.alpha = 1
            }
            ball37Lbl.position = CGPoint(x: ball37.position.x, y: ball37.position.y - (ball37.size.height / 15))
            ball37Lbl.zPosition = 3
            page13ScrollView.addChild(ball37Lbl)
        }
        
        ball37.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball37.name = "ball37"
        ball37.zPosition = 2
        ball37.alpha = 0
        ball37.physicsBody = SKPhysicsBody(rectangleOf: ball37.size)
        ball37.physicsBody?.affectedByGravity = false
        ball37.physicsBody?.isDynamic = true
        ball37.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball37.physicsBody?.collisionBitMask = 0
        ball37.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball38Unlocked == true && ballInt == 38 {
            ball38.colorBlendFactor = 0
        } else if ball38Unlocked == true && ballInt != 38 {
            ball38.colorBlendFactor = 0
        } else if ball38Unlocked == false {
            ball38.color = SKColor.black
            ball38.colorBlendFactor = 0.8
            
            ball38Lbl.text = "30"
            ball38Lbl.fontColor = SKColor.white
            ball38Lbl.fontSize = self.frame.width / 25
            if ball38Unlocked == true {
                ball38Lbl.alpha = 0
            } else {
                ball38Lbl.alpha = 1
            }
            ball38Lbl.position = CGPoint(x: ball38.position.x, y: ball38.position.y - (ball38.size.height / 15))
            ball38Lbl.zPosition = 3
            page13ScrollView.addChild(ball38Lbl)
        }
        
        ball38.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball38.name = "ball38"
        ball38.zPosition = 2
        ball38.alpha = 0
        ball38.physicsBody = SKPhysicsBody(rectangleOf: ball38.size)
        ball38.physicsBody?.affectedByGravity = false
        ball38.physicsBody?.isDynamic = true
        ball38.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball38.physicsBody?.collisionBitMask = 0
        ball38.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball39Unlocked == true && ballInt == 39 {
            ball39.colorBlendFactor = 0
        } else if ball39Unlocked == true && ballInt != 39 {
            ball39.colorBlendFactor = 0
        } else if ball39Unlocked == false {
            ball39.color = SKColor.black
            ball39.colorBlendFactor = 0.8
            
            ball39Lbl.text = "30"
            ball39Lbl.fontColor = SKColor.white
            ball39Lbl.fontSize = self.frame.width / 25
            if ball39Unlocked == true {
                ball39Lbl.alpha = 0
            } else {
                ball39Lbl.alpha = 1
            }
            ball39Lbl.position = CGPoint(x: ball39.position.x, y: ball39.position.y - (ball39.size.height / 15))
            ball39Lbl.zPosition = 3
            page13ScrollView.addChild(ball39Lbl)
        }
        
        ball39.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball39.name = "ball39"
        ball39.zPosition = 2
        ball39.alpha = 0
        ball39.physicsBody = SKPhysicsBody(rectangleOf: ball39.size)
        ball39.physicsBody?.affectedByGravity = false
        ball39.physicsBody?.isDynamic = true
        ball39.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball39.physicsBody?.collisionBitMask = 0
        ball39.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball40Unlocked == true && ballInt == 40 {
            ball40.colorBlendFactor = 0
        } else if ball40Unlocked == true && ballInt != 40 {
            ball40.colorBlendFactor = 0
        } else if ball40Unlocked == false {
            ball40.color = SKColor.black
            ball40.colorBlendFactor = 0.8
            
            ball40Lbl.text = "35"
            ball40Lbl.fontColor = SKColor.white
            ball40Lbl.fontSize = self.frame.width / 25
            if ball40Unlocked == true {
                ball40Lbl.alpha = 0
            } else {
                ball40Lbl.alpha = 1
            }
            ball40Lbl.position = CGPoint(x: ball40.position.x, y: ball40.position.y - (ball40.size.height / 15))
            ball40Lbl.zPosition = 3
            page14ScrollView.addChild(ball40Lbl)
        }
        
        ball40.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball40.name = "ball40"
        ball40.zPosition = 2
        ball40.alpha = 0
        ball40.physicsBody = SKPhysicsBody(rectangleOf: ball40.size)
        ball40.physicsBody?.affectedByGravity = false
        ball40.physicsBody?.isDynamic = true
        ball40.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball40.physicsBody?.collisionBitMask = 0
        ball40.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball41Unlocked == true && ballInt == 41 {
            ball41.colorBlendFactor = 0
        } else if ball41Unlocked == true && ballInt != 41 {
            ball41.colorBlendFactor = 0
        } else if ball41Unlocked == false {
            ball41.color = SKColor.black
            ball41.colorBlendFactor = 0.85
            
            ball41Lbl.text = "35"
            ball41Lbl.fontColor = SKColor.white
            ball41Lbl.fontSize = self.frame.width / 25
            if ball41Unlocked == true {
                ball41Lbl.alpha = 0
            } else {
                ball41Lbl.alpha = 1
            }
            ball41Lbl.position = CGPoint(x: ball41.position.x, y: ball41.position.y - (ball41.size.height / 15))
            ball41Lbl.zPosition = 3
            page14ScrollView.addChild(ball41Lbl)
        }
        
        ball41.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball41.name = "ball41"
        ball41.zPosition = 2
        ball41.alpha = 0
        ball41.physicsBody = SKPhysicsBody(rectangleOf: ball41.size)
        ball41.physicsBody?.affectedByGravity = false
        ball41.physicsBody?.isDynamic = true
        ball41.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball41.physicsBody?.collisionBitMask = 0
        ball41.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball42Unlocked == true && ballInt == 42 {
            ball42.colorBlendFactor = 0
        } else if ball42Unlocked == true && ballInt != 42 {
            ball42.colorBlendFactor = 0
        } else if ball42Unlocked == false {
            ball42.color = SKColor.black
            ball42.colorBlendFactor = 0.8
            
            ball42Lbl.text = "35"
            ball42Lbl.fontColor = SKColor.white
            ball42Lbl.fontSize = self.frame.width / 25
            if ball42Unlocked == true {
                ball42Lbl.alpha = 0
            } else {
                ball42Lbl.alpha = 1
            }
            ball42Lbl.position = CGPoint(x: ball42.position.x, y: ball42.position.y - (ball42.size.height / 15))
            ball42Lbl.zPosition = 3
            page14ScrollView.addChild(ball42Lbl)
        }
        
        ball42.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball42.name = "ball42"
        ball42.zPosition = 2
        ball42.alpha = 0
        ball42.physicsBody = SKPhysicsBody(rectangleOf: ball42.size)
        ball42.physicsBody?.affectedByGravity = false
        ball42.physicsBody?.isDynamic = true
        ball42.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball42.physicsBody?.collisionBitMask = 0
        ball42.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball43Unlocked == true && ballInt == 43 {
            ball43.colorBlendFactor = 0
        } else if ball43Unlocked == true && ballInt != 43 {
            ball43.colorBlendFactor = 0
        } else if ball43Unlocked == false {
            ball43.color = SKColor.black
            ball43.colorBlendFactor = 0.8
            
            ball43Lbl.text = "40"
            ball43Lbl.fontColor = SKColor.white
            ball43Lbl.fontSize = self.frame.width / 25
            if ball43Unlocked == true {
                ball43Lbl.alpha = 0
            } else {
                ball43Lbl.alpha = 1
            }
            ball43Lbl.position = CGPoint(x: ball43.position.x, y: ball43.position.y - (ball43.size.height / 15))
            ball43Lbl.zPosition = 3
            page15ScrollView.addChild(ball43Lbl)
        }
        
        ball43.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball43.name = "ball43"
        ball43.zPosition = 2
        ball43.alpha = 0
        ball43.physicsBody = SKPhysicsBody(rectangleOf: ball43.size)
        ball43.physicsBody?.affectedByGravity = false
        ball43.physicsBody?.isDynamic = true
        ball43.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball43.physicsBody?.collisionBitMask = 0
        ball43.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball44Unlocked == true && ballInt == 44 {
            ball44.colorBlendFactor = 0
        } else if ball44Unlocked == true && ballInt != 44 {
            ball44.colorBlendFactor = 0
        } else if ball44Unlocked == false {
            ball44.color = SKColor.black
            ball44.colorBlendFactor = 0.8
            
            ball44Lbl.text = "40"
            ball44Lbl.fontColor = SKColor.white
            ball44Lbl.fontSize = self.frame.width / 25
            if ball44Unlocked == true {
                ball44Lbl.alpha = 0
            } else {
                ball44Lbl.alpha = 1
            }
            ball44Lbl.position = CGPoint(x: ball44.position.x, y: ball44.position.y - (ball44.size.height / 15))
            ball44Lbl.zPosition = 3
            page15ScrollView.addChild(ball44Lbl)
        }
        
        ball44.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball44.name = "ball44"
        ball44.zPosition = 2
        ball44.alpha = 0
        ball44.physicsBody = SKPhysicsBody(rectangleOf: ball44.size)
        ball44.physicsBody?.affectedByGravity = false
        ball44.physicsBody?.isDynamic = true
        ball44.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball44.physicsBody?.collisionBitMask = 0
        ball44.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball45Unlocked == true && ballInt == 45 {
            ball45.colorBlendFactor = 0
        } else if ball45Unlocked == true && ballInt != 45 {
            ball45.colorBlendFactor = 0
        } else if ball45Unlocked == false {
            ball45.color = SKColor.black
            ball45.colorBlendFactor = 0.8
            
            ball45Lbl.text = "40"
            ball45Lbl.fontColor = SKColor.white
            ball45Lbl.fontSize = self.frame.width / 25
            if ball45Unlocked == true {
                ball45Lbl.alpha = 0
            } else {
                ball45Lbl.alpha = 1
            }
            ball45Lbl.position = CGPoint(x: ball45.position.x, y: ball45.position.y - (ball45.size.height / 15))
            ball45Lbl.zPosition = 3
            page15ScrollView.addChild(ball45Lbl)
        }
        
        ball45.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball45.name = "ball45"
        ball45.zPosition = 2
        ball45.alpha = 0
        ball45.physicsBody = SKPhysicsBody(rectangleOf: ball45.size)
        ball45.physicsBody?.affectedByGravity = false
        ball45.physicsBody?.isDynamic = true
        ball45.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball45.physicsBody?.collisionBitMask = 0
        ball45.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball46Unlocked == true && ballInt == 46 {
            ball46.colorBlendFactor = 0
        } else if ball46Unlocked == true && ballInt != 46 {
            ball46.colorBlendFactor = 0
        } else if ball46Unlocked == false {
            ball46.color = SKColor.black
            ball46.colorBlendFactor = 0.8
            
            ball46Lbl.text = "45"
            ball46Lbl.fontColor = SKColor.white
            ball46Lbl.fontSize = self.frame.width / 25
            if ball46Unlocked == true {
                ball46Lbl.alpha = 0
            } else {
                ball46Lbl.alpha = 1
            }
            ball46Lbl.position = CGPoint(x: ball46.position.x, y: ball46.position.y - (ball46.size.height / 15))
            ball46Lbl.zPosition = 3
            page16ScrollView.addChild(ball46Lbl)
        }
        
        ball46.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball46.name = "ball46"
        ball46.zPosition = 2
        ball46.alpha = 0
        ball46.physicsBody = SKPhysicsBody(rectangleOf: ball46.size)
        ball46.physicsBody?.affectedByGravity = false
        ball46.physicsBody?.isDynamic = true
        ball46.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball46.physicsBody?.collisionBitMask = 0
        ball46.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball47Unlocked == true && ballInt == 47 {
            ball47.colorBlendFactor = 0
        } else if ball47Unlocked == true && ballInt != 47 {
            ball47.colorBlendFactor = 0
        } else if ball47Unlocked == false {
            ball47.color = SKColor.black
            ball47.colorBlendFactor = 0.8
            
            ball47Lbl.text = "45"
            ball47Lbl.fontColor = SKColor.white
            ball47Lbl.fontSize = self.frame.width / 25
            if ball47Unlocked == true {
                ball47Lbl.alpha = 0
            } else {
                ball47Lbl.alpha = 1
            }
            ball47Lbl.position = CGPoint(x: ball47.position.x, y: ball47.position.y - (ball47.size.height / 15))
            ball47Lbl.zPosition = 3
            page16ScrollView.addChild(ball47Lbl)
        }
        
        ball47.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball47.name = "ball47"
        ball47.zPosition = 2
        ball47.alpha = 0
        ball47.physicsBody = SKPhysicsBody(rectangleOf: ball47.size)
        ball47.physicsBody?.affectedByGravity = false
        ball47.physicsBody?.isDynamic = true
        ball47.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball47.physicsBody?.collisionBitMask = 0
        ball47.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball48Unlocked == true && ballInt == 48 {
            ball48.colorBlendFactor = 0
        } else if ball48Unlocked == true && ballInt != 48 {
            ball48.colorBlendFactor = 0
        } else if ball48Unlocked == false {
            ball48.color = SKColor.black
            ball48.colorBlendFactor = 0.8
            
            ball48Lbl.text = "45"
            ball48Lbl.fontColor = SKColor.white
            ball48Lbl.fontSize = self.frame.width / 25
            if ball48Unlocked == true {
                ball48Lbl.alpha = 0
            } else {
                ball48Lbl.alpha = 1
            }
            ball48Lbl.position = CGPoint(x: ball48.position.x, y: ball48.position.y - (ball48.size.height / 15))
            ball48Lbl.zPosition = 3
            page16ScrollView.addChild(ball48Lbl)
        }
        
        ball48.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball48.name = "ball48"
        ball48.zPosition = 2
        ball48.alpha = 0
        ball48.physicsBody = SKPhysicsBody(rectangleOf: ball48.size)
        ball48.physicsBody?.affectedByGravity = false
        ball48.physicsBody?.isDynamic = true
        ball48.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball48.physicsBody?.collisionBitMask = 0
        ball48.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball49Unlocked == true && ballInt == 49 {
            ball49.colorBlendFactor = 0
        } else if ball49Unlocked == true && ballInt != 49 {
            ball49.colorBlendFactor = 0
        } else if ball49Unlocked == false {
            ball49.color = SKColor.black
            ball49.colorBlendFactor = 0.8
            
            ball49Lbl.text = "50"
            ball49Lbl.fontColor = SKColor.white
            ball49Lbl.fontSize = self.frame.width / 25
            if ball49Unlocked == true {
                ball49Lbl.alpha = 0
            } else if ball49Unlocked == false {
                ball49Lbl.alpha = 1
            }
            ball49Lbl.position = CGPoint(x: ball49.position.x, y: ball49.position.y - (ball49.size.height / 15))
            ball49Lbl.zPosition = 3
            page17ScrollView.addChild(ball49Lbl)
        }
        
        ball49.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball49.name = "ball4"
        ball49.zPosition = 2
        ball49.alpha = 0
        ball49.physicsBody = SKPhysicsBody(rectangleOf: ball49.size)
        ball49.physicsBody?.affectedByGravity = false
        ball49.physicsBody?.isDynamic = true
        ball49.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball49.physicsBody?.collisionBitMask = 0
        ball49.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ball50Unlocked == true && ballInt == 50 {
            ball50.colorBlendFactor = 0
        } else if ball50Unlocked == true && ballInt != 50 {
            ball50.colorBlendFactor = 0
        } else if ball50Unlocked == false {
            ball50.color = SKColor.black
            ball50.colorBlendFactor = 0.8
            
            ball50Lbl.text = "50"
            ball50Lbl.fontColor = SKColor.white
            if ball50Unlocked == false {
                ball50Lbl.alpha = 1
            } else if ball50Unlocked == true {
                ball50Lbl.alpha = 0
            }
            ball50Lbl.fontSize = self.frame.width / 25
            ball50Lbl.position = CGPoint(x: ball50.position.x, y: ball50.position.y - (ball50.size.height / 15))
            ball50Lbl.zPosition = 3
            page17ScrollView.addChild(ball50Lbl)
        }
        
        ball50.size = CGSize(width: self.frame.width / 10, height: self.frame.height / 50)
        ball50.name = "ball50"
        ball50.zPosition = 2
        ball50.alpha = 0
        ball50.physicsBody = SKPhysicsBody(rectangleOf: ball50.size)
        ball50.physicsBody?.affectedByGravity = false
        ball50.physicsBody?.isDynamic = true
        ball50.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball50.physicsBody?.collisionBitMask = 0
        ball50.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball1Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball1Btn.name = "ball1Btn"
        ball1Btn.zPosition = 3
        ball1Btn.alpha = 1
        ball1Btn.color = SKColor.clear
        ball1Btn.physicsBody = SKPhysicsBody(rectangleOf: ball1Btn.size)
        ball1Btn.physicsBody?.affectedByGravity = false
        ball1Btn.physicsBody?.isDynamic = true
        ball1Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball1Btn.physicsBody?.collisionBitMask = 0
        ball1Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball2Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball2Btn.name = "ball2Btn"
        ball2Btn.zPosition = 3
        ball2Btn.alpha = 1
        ball2Btn.color = SKColor.clear
        ball2Btn.physicsBody = SKPhysicsBody(rectangleOf: ball2Btn.size)
        ball2Btn.physicsBody?.affectedByGravity = false
        ball2Btn.physicsBody?.isDynamic = true
        ball2Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball2Btn.physicsBody?.collisionBitMask = 0
        ball2Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball3Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball3Btn.name = "ball3Btn"
        ball3Btn.zPosition = 3
        ball3Btn.alpha = 1
        ball3Btn.color = SKColor.clear
        ball3Btn.physicsBody = SKPhysicsBody(rectangleOf: ball3Btn.size)
        ball3Btn.physicsBody?.affectedByGravity = false
        ball3Btn.physicsBody?.isDynamic = true
        ball3Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball3Btn.physicsBody?.collisionBitMask = 0
        ball3Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball4Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball4Btn.name = "ball4Btn"
        ball4Btn.zPosition = 3
        ball4Btn.alpha = 1
        ball4Btn.color = SKColor.clear
        ball4Btn.physicsBody = SKPhysicsBody(rectangleOf: ball4Btn.size)
        ball4Btn.physicsBody?.affectedByGravity = false
        ball4Btn.physicsBody?.isDynamic = true
        ball4Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball4Btn.physicsBody?.collisionBitMask = 0
        ball4Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball5Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball5Btn.name = "ball5Btn"
        ball5Btn.zPosition = 3
        ball5Btn.alpha = 1
        ball5Btn.color = SKColor.clear
        ball5Btn.physicsBody = SKPhysicsBody(rectangleOf: ball5Btn.size)
        ball5Btn.physicsBody?.affectedByGravity = false
        ball5Btn.physicsBody?.isDynamic = true
        ball5Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball5Btn.physicsBody?.collisionBitMask = 0
        ball5Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball6Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball6Btn.name = "ball6Btn"
        ball6Btn.zPosition = 3
        ball6Btn.alpha = 1
        ball6Btn.color = SKColor.clear
        ball6Btn.physicsBody = SKPhysicsBody(rectangleOf: ball6Btn.size)
        ball6Btn.physicsBody?.affectedByGravity = false
        ball6Btn.physicsBody?.isDynamic = true
        ball6Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball6Btn.physicsBody?.collisionBitMask = 0
        ball6Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball7Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball7Btn.name = "ball7Btn"
        ball7Btn.zPosition = 3
        ball7Btn.alpha = 1
        ball7Btn.color = SKColor.clear
        ball7Btn.physicsBody = SKPhysicsBody(rectangleOf: ball7Btn.size)
        ball7Btn.physicsBody?.affectedByGravity = false
        ball7Btn.physicsBody?.isDynamic = true
        ball7Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball7Btn.physicsBody?.collisionBitMask = 0
        ball7Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball8Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball8Btn.name = "ball8Btn"
        ball8Btn.zPosition = 3
        ball8Btn.alpha = 1
        ball8Btn.color = SKColor.clear
        ball8Btn.physicsBody = SKPhysicsBody(rectangleOf: ball8Btn.size)
        ball8Btn.physicsBody?.affectedByGravity = false
        ball8Btn.physicsBody?.isDynamic = true
        ball8Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball8Btn.physicsBody?.collisionBitMask = 0
        ball8Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball9Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball9Btn.name = "ball9Btn"
        ball9Btn.zPosition = 3
        ball9Btn.alpha = 1
        ball9Btn.color = SKColor.clear
        ball9Btn.physicsBody = SKPhysicsBody(rectangleOf: ball9Btn.size)
        ball9Btn.physicsBody?.affectedByGravity = false
        ball9Btn.physicsBody?.isDynamic = true
        ball9Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball9Btn.physicsBody?.collisionBitMask = 0
        ball9Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball10Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball10Btn.name = "ball10Btn"
        ball10Btn.zPosition = 3
        ball10Btn.alpha = 1
        ball10Btn.color = SKColor.clear
        ball10Btn.physicsBody = SKPhysicsBody(rectangleOf: ball10Btn.size)
        ball10Btn.physicsBody?.affectedByGravity = false
        ball10Btn.physicsBody?.isDynamic = true
        ball10Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball10Btn.physicsBody?.collisionBitMask = 0
        ball10Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball11Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball11Btn.name = "ball11Btn"
        ball11Btn.zPosition = 3
        ball11Btn.alpha = 1
        ball11Btn.color = SKColor.clear
        ball11Btn.physicsBody = SKPhysicsBody(rectangleOf: ball11Btn.size)
        ball11Btn.physicsBody?.affectedByGravity = false
        ball11Btn.physicsBody?.isDynamic = true
        ball11Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball11Btn.physicsBody?.collisionBitMask = 0
        ball11Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball12Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball12Btn.name = "ball12Btn"
        ball12Btn.zPosition = 3
        ball12Btn.alpha = 1
        ball12Btn.color = SKColor.clear
        ball12Btn.physicsBody = SKPhysicsBody(rectangleOf: ball12Btn.size)
        ball12Btn.physicsBody?.affectedByGravity = false
        ball12Btn.physicsBody?.isDynamic = true
        ball12Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball12Btn.physicsBody?.collisionBitMask = 0
        ball12Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball13Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball13Btn.name = "ball13Btn"
        ball13Btn.zPosition = 3
        ball13Btn.alpha = 1
        ball13Btn.color = SKColor.clear
        ball13Btn.physicsBody = SKPhysicsBody(rectangleOf: ball13Btn.size)
        ball13Btn.physicsBody?.affectedByGravity = false
        ball13Btn.physicsBody?.isDynamic = true
        ball13Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball13Btn.physicsBody?.collisionBitMask = 0
        ball13Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball14Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball14Btn.name = "ball14Btn"
        ball14Btn.zPosition = 3
        ball14Btn.alpha = 1
        ball14Btn.color = SKColor.clear
        ball14Btn.physicsBody = SKPhysicsBody(rectangleOf: ball14Btn.size)
        ball14Btn.physicsBody?.affectedByGravity = false
        ball14Btn.physicsBody?.isDynamic = true
        ball14Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball14Btn.physicsBody?.collisionBitMask = 0
        ball14Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball15Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball15Btn.name = "ball15Btn"
        ball15Btn.zPosition = 3
        ball15Btn.alpha = 1
        ball15Btn.color = SKColor.clear
        ball15Btn.physicsBody = SKPhysicsBody(rectangleOf: ball15Btn.size)
        ball15Btn.physicsBody?.affectedByGravity = false
        ball15Btn.physicsBody?.isDynamic = true
        ball15Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball15Btn.physicsBody?.collisionBitMask = 0
        ball15Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball16Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball16Btn.name = "ball16Btn"
        ball16Btn.zPosition = 3
        ball16Btn.alpha = 1
        ball16Btn.color = SKColor.clear
        ball16Btn.physicsBody = SKPhysicsBody(rectangleOf: ball16Btn.size)
        ball16Btn.physicsBody?.affectedByGravity = false
        ball16Btn.physicsBody?.isDynamic = true
        ball16Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball16Btn.physicsBody?.collisionBitMask = 0
        ball16Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball17Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball17Btn.name = "ball17Btn"
        ball17Btn.zPosition = 3
        ball17Btn.alpha = 1
        ball17Btn.color = SKColor.clear
        ball17Btn.physicsBody = SKPhysicsBody(rectangleOf: ball17Btn.size)
        ball17Btn.physicsBody?.affectedByGravity = false
        ball17Btn.physicsBody?.isDynamic = true
        ball17Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball17Btn.physicsBody?.collisionBitMask = 0
        ball17Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball18Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball18Btn.name = "ball18Btn"
        ball18Btn.zPosition = 3
        ball18Btn.alpha = 1
        ball18Btn.color = SKColor.clear
        ball18Btn.physicsBody = SKPhysicsBody(rectangleOf: ball18Btn.size)
        ball18Btn.physicsBody?.affectedByGravity = false
        ball18Btn.physicsBody?.isDynamic = true
        ball18Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball18Btn.physicsBody?.collisionBitMask = 0
        ball18Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball19Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball19Btn.name = "ball19Btn"
        ball19Btn.zPosition = 3
        ball19Btn.alpha = 1
        ball19Btn.color = SKColor.clear
        ball19Btn.physicsBody = SKPhysicsBody(rectangleOf: ball19Btn.size)
        ball19Btn.physicsBody?.affectedByGravity = false
        ball19Btn.physicsBody?.isDynamic = true
        ball19Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball19Btn.physicsBody?.collisionBitMask = 0
        ball19Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball20Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball20Btn.name = "ball20Btn"
        ball20Btn.zPosition = 3
        ball20Btn.alpha = 1
        ball20Btn.color = SKColor.clear
        ball20Btn.physicsBody = SKPhysicsBody(rectangleOf: ball20Btn.size)
        ball20Btn.physicsBody?.affectedByGravity = false
        ball20Btn.physicsBody?.isDynamic = true
        ball20Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball20Btn.physicsBody?.collisionBitMask = 0
        ball20Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball21Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball21Btn.name = "ball21Btn"
        ball21Btn.zPosition = 3
        ball21Btn.alpha = 1
        ball21Btn.color = SKColor.clear
        ball21Btn.physicsBody = SKPhysicsBody(rectangleOf: ball21Btn.size)
        ball21Btn.physicsBody?.affectedByGravity = false
        ball21Btn.physicsBody?.isDynamic = true
        ball21Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball21Btn.physicsBody?.collisionBitMask = 0
        ball21Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball22Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball22Btn.name = "ball22Btn"
        ball22Btn.zPosition = 3
        ball22Btn.alpha = 1
        ball22Btn.color = SKColor.clear
        ball22Btn.physicsBody = SKPhysicsBody(rectangleOf: ball22Btn.size)
        ball22Btn.physicsBody?.affectedByGravity = false
        ball22Btn.physicsBody?.isDynamic = true
        ball22Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball22Btn.physicsBody?.collisionBitMask = 0
        ball22Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball23Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball23Btn.name = "ball23Btn"
        ball23Btn.zPosition = 3
        ball23Btn.alpha = 1
        ball23Btn.color = SKColor.clear
        ball23Btn.physicsBody = SKPhysicsBody(rectangleOf: ball23Btn.size)
        ball23Btn.physicsBody?.affectedByGravity = false
        ball23Btn.physicsBody?.isDynamic = true
        ball23Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball23Btn.physicsBody?.collisionBitMask = 0
        ball23Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball24Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball24Btn.name = "ball24Btn"
        ball24Btn.zPosition = 3
        ball24Btn.alpha = 1
        ball24Btn.color = SKColor.clear
        ball24Btn.physicsBody = SKPhysicsBody(rectangleOf: ball24Btn.size)
        ball24Btn.physicsBody?.affectedByGravity = false
        ball24Btn.physicsBody?.isDynamic = true
        ball24Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball24Btn.physicsBody?.collisionBitMask = 0
        ball24Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball25Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball25Btn.name = "ball25Btn"
        ball25Btn.zPosition = 3
        ball25Btn.alpha = 1
        ball25Btn.color = SKColor.clear
        ball25Btn.physicsBody = SKPhysicsBody(rectangleOf: ball25Btn.size)
        ball25Btn.physicsBody?.affectedByGravity = false
        ball25Btn.physicsBody?.isDynamic = true
        ball25Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball25Btn.physicsBody?.collisionBitMask = 0
        ball25Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball26Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball26Btn.name = "ball26Btn"
        ball26Btn.zPosition = 3
        ball26Btn.alpha = 1
        ball26Btn.color = SKColor.clear
        ball26Btn.physicsBody = SKPhysicsBody(rectangleOf: ball26Btn.size)
        ball26Btn.physicsBody?.affectedByGravity = false
        ball26Btn.physicsBody?.isDynamic = true
        ball26Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball26Btn.physicsBody?.collisionBitMask = 0
        ball26Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball27Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball27Btn.name = "ball27Btn"
        ball27Btn.zPosition = 3
        ball27Btn.alpha = 1
        ball27Btn.color = SKColor.clear
        ball27Btn.physicsBody = SKPhysicsBody(rectangleOf: ball27Btn.size)
        ball27Btn.physicsBody?.affectedByGravity = false
        ball27Btn.physicsBody?.isDynamic = true
        ball27Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball27Btn.physicsBody?.collisionBitMask = 0
        ball27Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball28Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball28Btn.name = "ball28Btn"
        ball28Btn.zPosition = 3
        ball28Btn.alpha = 1
        ball28Btn.color = SKColor.clear
        ball28Btn.physicsBody = SKPhysicsBody(rectangleOf: ball28Btn.size)
        ball28Btn.physicsBody?.affectedByGravity = false
        ball28Btn.physicsBody?.isDynamic = true
        ball28Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball28Btn.physicsBody?.collisionBitMask = 0
        ball28Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball29Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball29Btn.name = "ball29Btn"
        ball29Btn.zPosition = 3
        ball29Btn.alpha = 1
        ball29Btn.color = SKColor.clear
        ball29Btn.physicsBody = SKPhysicsBody(rectangleOf: ball29Btn.size)
        ball29Btn.physicsBody?.affectedByGravity = false
        ball29Btn.physicsBody?.isDynamic = true
        ball29Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball29Btn.physicsBody?.collisionBitMask = 0
        ball29Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball30Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball30Btn.name = "ball30Btn"
        ball30Btn.zPosition = 3
        ball30Btn.alpha = 1
        ball30Btn.color = SKColor.clear
        ball30Btn.physicsBody = SKPhysicsBody(rectangleOf: ball30Btn.size)
        ball30Btn.physicsBody?.affectedByGravity = false
        ball30Btn.physicsBody?.isDynamic = true
        ball30Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball30Btn.physicsBody?.collisionBitMask = 0
        ball30Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball31Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball31Btn.name = "ball31Btn"
        ball31Btn.zPosition = 3
        ball31Btn.alpha = 1
        ball31Btn.color = SKColor.clear
        ball31Btn.physicsBody = SKPhysicsBody(rectangleOf: ball31Btn.size)
        ball31Btn.physicsBody?.affectedByGravity = false
        ball31Btn.physicsBody?.isDynamic = true
        ball31Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball31Btn.physicsBody?.collisionBitMask = 0
        ball31Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball32Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball32Btn.name = "ball32Btn"
        ball32Btn.zPosition = 3
        ball32Btn.alpha = 1
        ball32Btn.color = SKColor.clear
        ball32Btn.physicsBody = SKPhysicsBody(rectangleOf: ball32Btn.size)
        ball32Btn.physicsBody?.affectedByGravity = false
        ball32Btn.physicsBody?.isDynamic = true
        ball32Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball32Btn.physicsBody?.collisionBitMask = 0
        ball32Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball33Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball33Btn.name = "ball33Btn"
        ball33Btn.zPosition = 3
        ball33Btn.alpha = 1
        ball33Btn.color = SKColor.clear
        ball33Btn.physicsBody = SKPhysicsBody(rectangleOf: ball33Btn.size)
        ball33Btn.physicsBody?.affectedByGravity = false
        ball33Btn.physicsBody?.isDynamic = true
        ball33Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball33Btn.physicsBody?.collisionBitMask = 0
        ball33Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball34Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball34Btn.name = "ball34Btn"
        ball34Btn.zPosition = 3
        ball34Btn.alpha = 1
        ball34Btn.color = SKColor.clear
        ball34Btn.physicsBody = SKPhysicsBody(rectangleOf: ball34Btn.size)
        ball34Btn.physicsBody?.affectedByGravity = false
        ball34Btn.physicsBody?.isDynamic = true
        ball34Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball34Btn.physicsBody?.collisionBitMask = 0
        ball34Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball35Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball35Btn.name = "ball35Btn"
        ball35Btn.zPosition = 3
        ball35Btn.alpha = 1
        ball35Btn.color = SKColor.clear
        ball35Btn.physicsBody = SKPhysicsBody(rectangleOf: ball35Btn.size)
        ball35Btn.physicsBody?.affectedByGravity = false
        ball35Btn.physicsBody?.isDynamic = true
        ball35Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball35Btn.physicsBody?.collisionBitMask = 0
        ball35Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball36Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball36Btn.name = "ball36Btn"
        ball36Btn.zPosition = 3
        ball36Btn.alpha = 1
        ball36Btn.color = SKColor.clear
        ball36Btn.physicsBody = SKPhysicsBody(rectangleOf: ball36Btn.size)
        ball36Btn.physicsBody?.affectedByGravity = false
        ball36Btn.physicsBody?.isDynamic = true
        ball36Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball36Btn.physicsBody?.collisionBitMask = 0
        ball36Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball37Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball37Btn.name = "ball37Btn"
        ball37Btn.zPosition = 3
        ball37Btn.alpha = 1
        ball37Btn.color = SKColor.clear
        ball37Btn.physicsBody = SKPhysicsBody(rectangleOf: ball37Btn.size)
        ball37Btn.physicsBody?.affectedByGravity = false
        ball37Btn.physicsBody?.isDynamic = true
        ball37Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball37Btn.physicsBody?.collisionBitMask = 0
        ball37Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball38Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball38Btn.name = "ball38Btn"
        ball38Btn.zPosition = 3
        ball38Btn.alpha = 1
        ball38Btn.color = SKColor.clear
        ball38Btn.physicsBody = SKPhysicsBody(rectangleOf: ball38Btn.size)
        ball38Btn.physicsBody?.affectedByGravity = false
        ball38Btn.physicsBody?.isDynamic = true
        ball38Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball38Btn.physicsBody?.collisionBitMask = 0
        ball38Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball39Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball39Btn.name = "ball39Btn"
        ball39Btn.zPosition = 3
        ball39Btn.alpha = 1
        ball39Btn.color = SKColor.clear
        ball39Btn.physicsBody = SKPhysicsBody(rectangleOf: ball39Btn.size)
        ball39Btn.physicsBody?.affectedByGravity = false
        ball39Btn.physicsBody?.isDynamic = true
        ball39Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball39Btn.physicsBody?.collisionBitMask = 0
        ball39Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball40Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball40Btn.name = "ball40Btn"
        ball40Btn.zPosition = 3
        ball40Btn.alpha = 1
        ball40Btn.color = SKColor.clear
        ball40Btn.physicsBody = SKPhysicsBody(rectangleOf: ball40Btn.size)
        ball40Btn.physicsBody?.affectedByGravity = false
        ball40Btn.physicsBody?.isDynamic = true
        ball40Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball40Btn.physicsBody?.collisionBitMask = 0
        ball40Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball41Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball41Btn.name = "ball41Btn"
        ball41Btn.zPosition = 3
        ball41Btn.alpha = 1
        ball41Btn.color = SKColor.clear
        ball41Btn.physicsBody = SKPhysicsBody(rectangleOf: ball41Btn.size)
        ball41Btn.physicsBody?.affectedByGravity = false
        ball41Btn.physicsBody?.isDynamic = true
        ball41Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball41Btn.physicsBody?.collisionBitMask = 0
        ball41Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball42Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball42Btn.name = "ball42Btn"
        ball42Btn.zPosition = 3
        ball42Btn.alpha = 1
        ball42Btn.color = SKColor.clear
        ball42Btn.physicsBody = SKPhysicsBody(rectangleOf: ball42Btn.size)
        ball42Btn.physicsBody?.affectedByGravity = false
        ball42Btn.physicsBody?.isDynamic = true
        ball42Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball42Btn.physicsBody?.collisionBitMask = 0
        ball42Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball43Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball43Btn.name = "ball43Btn"
        ball43Btn.zPosition = 3
        ball43Btn.alpha = 1
        ball43Btn.color = SKColor.clear
        ball43Btn.physicsBody = SKPhysicsBody(rectangleOf: ball43Btn.size)
        ball43Btn.physicsBody?.affectedByGravity = false
        ball43Btn.physicsBody?.isDynamic = true
        ball43Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball43Btn.physicsBody?.collisionBitMask = 0
        ball43Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball44Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball44Btn.name = "paddle44Btn"
        ball44Btn.zPosition = 3
        ball44Btn.alpha = 1
        ball44Btn.color = SKColor.clear
        ball44Btn.physicsBody = SKPhysicsBody(rectangleOf: ball44Btn.size)
        ball44Btn.physicsBody?.affectedByGravity = false
        ball44Btn.physicsBody?.isDynamic = true
        ball44Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball44Btn.physicsBody?.collisionBitMask = 0
        ball44Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball45Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball45Btn.name = "ball45Btn"
        ball45Btn.zPosition = 3
        ball45Btn.alpha = 1
        ball45Btn.color = SKColor.clear
        ball45Btn.physicsBody = SKPhysicsBody(rectangleOf: ball45Btn.size)
        ball45Btn.physicsBody?.affectedByGravity = false
        ball45Btn.physicsBody?.isDynamic = true
        ball45Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball45Btn.physicsBody?.collisionBitMask = 0
        ball45Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball46Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball46Btn.name = "ball46Btn"
        ball46Btn.zPosition = 3
        ball46Btn.alpha = 1
        ball46Btn.color = SKColor.clear
        ball46Btn.physicsBody = SKPhysicsBody(rectangleOf: ball46Btn.size)
        ball46Btn.physicsBody?.affectedByGravity = false
        ball46Btn.physicsBody?.isDynamic = true
        ball46Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball46Btn.physicsBody?.collisionBitMask = 0
        ball46Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball47Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball47Btn.name = "ball47Btn"
        ball47Btn.zPosition = 3
        ball47Btn.alpha = 1
        ball47Btn.color = SKColor.clear
        ball47Btn.physicsBody = SKPhysicsBody(rectangleOf: ball47Btn.size)
        ball47Btn.physicsBody?.affectedByGravity = false
        ball47Btn.physicsBody?.isDynamic = true
        ball47Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball47Btn.physicsBody?.collisionBitMask = 0
        ball47Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball48Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball48Btn.name = "ball48Btn"
        ball48Btn.zPosition = 3
        ball48Btn.alpha = 1
        ball48Btn.color = SKColor.clear
        ball48Btn.physicsBody = SKPhysicsBody(rectangleOf: ball48Btn.size)
        ball48Btn.physicsBody?.affectedByGravity = false
        ball48Btn.physicsBody?.isDynamic = true
        ball48Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball48Btn.physicsBody?.collisionBitMask = 0
        ball48Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball49Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball49Btn.name = "ball49Btn"
        ball49Btn.zPosition = 3
        ball49Btn.alpha = 1
        ball49Btn.color = SKColor.clear
        ball49Btn.physicsBody = SKPhysicsBody(rectangleOf: ball49Btn.size)
        ball49Btn.physicsBody?.affectedByGravity = false
        ball49Btn.physicsBody?.isDynamic = true
        ball49Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball49Btn.physicsBody?.collisionBitMask = 0
        ball49Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball50Btn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        ball50Btn.name = "ball50Btn"
        ball50Btn.zPosition = 3
        ball50Btn.alpha = 1
        ball50Btn.color = SKColor.clear
        ball50Btn.physicsBody = SKPhysicsBody(rectangleOf: ball50Btn.size)
        ball50Btn.physicsBody?.affectedByGravity = false
        ball50Btn.physicsBody?.isDynamic = true
        ball50Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        ball50Btn.physicsBody?.collisionBitMask = 0
        ball50Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        ball10Lbl.alpha = 0
        ball11Lbl.alpha = 0
        ball12Lbl.alpha = 0
        ball13Lbl.alpha = 0
        ball14Lbl.alpha = 0
        ball15Lbl.alpha = 0
        ball16Lbl.alpha = 0
        ball17Lbl.alpha = 0
        ball18Lbl.alpha = 0
        ball19Lbl.alpha = 0
        ball20Lbl.alpha = 0
        ball21Lbl.alpha = 0
        ball22Lbl.alpha = 0
        ball23Lbl.alpha = 0
        ball24Lbl.alpha = 0
        ball25Lbl.alpha = 0
        ball26Lbl.alpha = 0
        ball27Lbl.alpha = 0
        ball28Lbl.alpha = 0
        ball29Lbl.alpha = 0
        ball30Lbl.alpha = 0
        ball31Lbl.alpha = 0
        ball32Lbl.alpha = 0
        ball33Lbl.alpha = 0
        ball34Lbl.alpha = 0
        ball35Lbl.alpha = 0
        ball36Lbl.alpha = 0
        ball37Lbl.alpha = 0
        ball38Lbl.alpha = 0
        ball39Lbl.alpha = 0
        ball40Lbl.alpha = 0
        ball41Lbl.alpha = 0
        ball42Lbl.alpha = 0
        ball43Lbl.alpha = 0
        ball44Lbl.alpha = 0
        ball45Lbl.alpha = 0
        ball46Lbl.alpha = 0
        ball47Lbl.alpha = 0
        ball48Lbl.alpha = 0
        ball49Lbl.alpha = 0
        ball50Lbl.alpha = 0
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if(contact.bodyA.node != nil && contact.bodyB.node != nil) {
            let firstBody = contact.bodyA.node as! SKSpriteNode
            let secondBody = contact.bodyB.node as! SKSpriteNode
            
            if (firstBody.name == "ball2") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball2") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball5") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball5") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball8") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball8") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball11") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball11") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball14") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball14") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball17") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball17") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball20") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball20") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball23") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball23") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball26") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball26") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball29") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball29") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball32") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball32") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball35") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball35") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball38") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball38") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "ball41") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(Button: firstBody, Top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "ball41") {
                buttonHitTopScrollView(Button: secondBody, Top: firstBody)
            }
            if (firstBody.name == "scrollViewPlaceHolder") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "scrollViewPlaceHolder") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "ball47") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball47") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "ball44") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball44") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "ball41") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball41") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "ball38") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball38") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "ball35") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball35") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "ball32") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball32") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "ball29") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball29") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "ball26") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball26") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "ball23") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball23") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "ball20") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball20") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "ball17") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball17") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "ball14") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball14") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            if (firstBody.name == "balll11") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(Button: firstBody, Bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "ball11") {
                buttonHitBottomScrollView(Button: secondBody, Bottom: firstBody)
            }
            
        }
    }
    
    func buttonHitTopScrollView(Button: SKSpriteNode, Top: SKSpriteNode) {
        if Button.name == "ball2" {
            if ballInt == 1 || ballInt == 2 || ballInt == 3 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 10 || ballInt == 11 || ballInt == 12 {
                selector.run(buttonScrollFadeIn)
            } else if ballInt <= 0 {
                selector.run(buttonScrollFadeOut)
            }
            ball1.run(buttonScrollFadeOut)
            ball2.run(buttonScrollFadeOut)
            ball3.run(buttonScrollFadeOut)
            ball10.run(buttonScrollFadeIn)
            ball11.run(buttonScrollFadeIn)
            ball12.run(buttonScrollFadeIn)
            
            ball1Lbl.run(buttonScrollFadeOut)
            ball2Lbl.run(buttonScrollFadeOut)
            ball3Lbl.run(buttonScrollFadeOut)
            if ball10Unlocked == false {
                ball10Lbl.run(buttonScrollFadeIn)
            }
            if ball11Unlocked == false {
                ball11Lbl.run(buttonScrollFadeIn)
            }
            if ball12Unlocked == false {
                ball12Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball5" {
            if ballInt == 4 || ballInt == 5 || ballInt == 6 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 13 || ballInt == 14 || ballInt == 15 {
                selector.run(buttonScrollFadeIn)
            }
            ball4.run(buttonScrollFadeOut)
            ball5.run(buttonScrollFadeOut)
            ball6.run(buttonScrollFadeOut)
            ball13.run(buttonScrollFadeIn)
            ball14.run(buttonScrollFadeIn)
            ball15.run(buttonScrollFadeIn)
            
            ball4Lbl.run(buttonScrollFadeOut)
            ball5Lbl.run(buttonScrollFadeOut)
            ball6Lbl.run(buttonScrollFadeOut)
            if ball13Unlocked == false {
                ball13Lbl.run(buttonScrollFadeIn)
            }
            if ball14Unlocked == false {
                ball14Lbl.run(buttonScrollFadeIn)
            }
            if ball15Unlocked == false {
                ball15Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball8" {
            if ballInt == 7 || ballInt == 8 || ballInt == 9 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 16 || ballInt == 17 || ballInt == 18 {
                selector.run(buttonScrollFadeIn)
            }
            ball7.run(buttonScrollFadeOut)
            ball8.run(buttonScrollFadeOut)
            ball9.run(buttonScrollFadeOut)
            ball16.run(buttonScrollFadeIn)
            ball17.run(buttonScrollFadeIn)
            ball18.run(buttonScrollFadeIn)
            
            ball7Lbl.run(buttonScrollFadeOut)
            ball8Lbl.run(buttonScrollFadeOut)
            ball9Lbl.run(buttonScrollFadeOut)
            if ball16Unlocked == false {
                ball16Lbl.run(buttonScrollFadeIn)
            }
            if ball17Unlocked == false {
                ball17Lbl.run(buttonScrollFadeIn)
            }
            if ball18Unlocked == false {
                ball18Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball11" {
            if ballInt == 10 || ballInt == 11 || ballInt == 12 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 19 || ballInt == 20 || ballInt == 21 {
                selector.run(buttonScrollFadeIn)
            }
            ball10.run(buttonScrollFadeOut)
            ball11.run(buttonScrollFadeOut)
            ball12.run(buttonScrollFadeOut)
            ball19.run(buttonScrollFadeIn)
            ball20.run(buttonScrollFadeIn)
            ball21.run(buttonScrollFadeIn)
            
            ball10Lbl.run(buttonScrollFadeOut)
            ball11Lbl.run(buttonScrollFadeOut)
            ball12Lbl.run(buttonScrollFadeOut)
            if ball19Unlocked == false {
                ball19Lbl.run(buttonScrollFadeIn)
            }
            if ball20Unlocked == false {
                ball20Lbl.run(buttonScrollFadeIn)
            }
            if ball21Unlocked == false {
                ball21Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball14" {
            if ballInt == 13 || ballInt == 14 || ballInt == 15 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 22 || ballInt == 23 || ballInt == 24 {
                selector.run(buttonScrollFadeIn)
            }
            ball13.run(buttonScrollFadeOut)
            ball14.run(buttonScrollFadeOut)
            ball15.run(buttonScrollFadeOut)
            ball22.run(buttonScrollFadeIn)
            ball23.run(buttonScrollFadeIn)
            ball24.run(buttonScrollFadeIn)
            
            ball13Lbl.run(buttonScrollFadeOut)
            ball14Lbl.run(buttonScrollFadeOut)
            ball15Lbl.run(buttonScrollFadeOut)
            if ball22Unlocked == false {
                ball22Lbl.run(buttonScrollFadeIn)
            }
            if ball23Unlocked == false {
                ball23Lbl.run(buttonScrollFadeIn)
            }
            if ball24Unlocked == false {
                ball24Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball17" {
            if ballInt == 16 || ballInt == 17 || ballInt == 18 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 25 || ballInt == 26 || ballInt == 27 {
                selector.run(buttonScrollFadeIn)
            }
            ball16.run(buttonScrollFadeOut)
            ball17.run(buttonScrollFadeOut)
            ball18.run(buttonScrollFadeOut)
            ball25.run(buttonScrollFadeIn)
            ball26.run(buttonScrollFadeIn)
            ball27.run(buttonScrollFadeIn)
            
            ball16Lbl.run(buttonScrollFadeOut)
            ball17Lbl.run(buttonScrollFadeOut)
            ball18Lbl.run(buttonScrollFadeOut)
            if ball25Unlocked == false {
                ball25Lbl.run(buttonScrollFadeIn)
            }
            if ball26Unlocked == false {
                ball26Lbl.run(buttonScrollFadeIn)
            }
            if ball27Unlocked == false {
                ball27Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball20" {
            if ballInt == 19 || ballInt == 20 || ballInt == 21 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 28 || ballInt == 29 || ballInt == 30 {
                selector.run(buttonScrollFadeIn)
            }
            ball19.run(buttonScrollFadeOut)
            ball20.run(buttonScrollFadeOut)
            ball21.run(buttonScrollFadeOut)
            ball28.run(buttonScrollFadeIn)
            ball29.run(buttonScrollFadeIn)
            ball30.run(buttonScrollFadeIn)
            
            ball19Lbl.run(buttonScrollFadeOut)
            ball20Lbl.run(buttonScrollFadeOut)
            ball21Lbl.run(buttonScrollFadeOut)
            if ball28Unlocked == false {
                ball28Lbl.run(buttonScrollFadeIn)
            }
            if ball29Unlocked == false {
                ball29Lbl.run(buttonScrollFadeIn)
            }
            if ball30Unlocked == false {
                ball30Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball23" {
            if ballInt == 22 || ballInt == 23 || ballInt == 24 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 31 || ballInt == 32 || ballInt == 33 {
                selector.run(buttonScrollFadeIn)
            }
            ball22.run(buttonScrollFadeOut)
            ball23.run(buttonScrollFadeOut)
            ball24.run(buttonScrollFadeOut)
            ball31.run(buttonScrollFadeIn)
            ball32.run(buttonScrollFadeIn)
            ball33.run(buttonScrollFadeIn)
            
            ball22Lbl.run(buttonScrollFadeOut)
            ball23Lbl.run(buttonScrollFadeOut)
            ball24Lbl.run(buttonScrollFadeOut)
            if ball31Unlocked == false {
                ball31Lbl.run(buttonScrollFadeIn)
            }
            if ball32Unlocked == false {
                ball32Lbl.run(buttonScrollFadeIn)
            }
            if ball33Unlocked == false {
                ball33Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball26" {
            if ballInt == 25 || ballInt == 26 || ballInt == 27 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 34 || ballInt == 35 || ballInt == 36 {
                selector.run(buttonScrollFadeIn)
            }
            ball25.run(buttonScrollFadeOut)
            ball26.run(buttonScrollFadeOut)
            ball27.run(buttonScrollFadeOut)
            ball34.run(buttonScrollFadeIn)
            ball35.run(buttonScrollFadeIn)
            ball36.run(buttonScrollFadeIn)
            
            ball25Lbl.run(buttonScrollFadeOut)
            ball26Lbl.run(buttonScrollFadeOut)
            ball27Lbl.run(buttonScrollFadeOut)
            if ball34Unlocked == false {
                ball34Lbl.run(buttonScrollFadeIn)
            }
            if ball35Unlocked == false {
                ball35Lbl.run(buttonScrollFadeIn)
            }
            if ball36Unlocked == false {
                ball36Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball29" {
            if ballInt == 28 || ballInt == 29 || ballInt == 30 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 37 || ballInt == 38 || ballInt == 39 {
                selector.run(buttonScrollFadeIn)
            }
            ball28.run(buttonScrollFadeOut)
            ball29.run(buttonScrollFadeOut)
            ball30.run(buttonScrollFadeOut)
            ball37.run(buttonScrollFadeIn)
            ball38.run(buttonScrollFadeIn)
            ball39.run(buttonScrollFadeIn)
            
            ball28Lbl.run(buttonScrollFadeOut)
            ball29Lbl.run(buttonScrollFadeOut)
            ball30Lbl.run(buttonScrollFadeOut)
            if ball37Unlocked == false {
                ball37Lbl.run(buttonScrollFadeIn)
            }
            if ball38Unlocked == false {
                ball38Lbl.run(buttonScrollFadeIn)
            }
            if ball39Unlocked == false {
                ball39Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball32" {
            if ballInt == 31 || ballInt == 32 || ballInt == 33 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 40 || ballInt == 41 || ballInt == 42 {
                selector.run(buttonScrollFadeIn)
            }
            ball31.run(buttonScrollFadeOut)
            ball32.run(buttonScrollFadeOut)
            ball33.run(buttonScrollFadeOut)
            ball40.run(buttonScrollFadeIn)
            ball41.run(buttonScrollFadeIn)
            ball42.run(buttonScrollFadeIn)
            
            ball31Lbl.run(buttonScrollFadeOut)
            ball32Lbl.run(buttonScrollFadeOut)
            ball33Lbl.run(buttonScrollFadeOut)
            if ball40Unlocked == false {
                ball40Lbl.run(buttonScrollFadeIn)
            }
            if ball41Unlocked == false {
                ball41Lbl.run(buttonScrollFadeIn)
            }
            if ball42Unlocked == false {
                ball42Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball35" {
            if ballInt == 34 || ballInt == 35 || ballInt == 36 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 43 || ballInt == 44 || ballInt == 45 {
                selector.run(buttonScrollFadeIn)
            }
            ball34.run(buttonScrollFadeOut)
            ball35.run(buttonScrollFadeOut)
            ball36.run(buttonScrollFadeOut)
            ball43.run(buttonScrollFadeIn)
            ball44.run(buttonScrollFadeIn)
            ball45.run(buttonScrollFadeIn)
            
            ball34Lbl.run(buttonScrollFadeOut)
            ball35Lbl.run(buttonScrollFadeOut)
            ball36Lbl.run(buttonScrollFadeOut)
            if ball43Unlocked == false {
                ball43Lbl.run(buttonScrollFadeIn)
            }
            if ball44Unlocked == false {
                ball44Lbl.run(buttonScrollFadeIn)
            }
            if ball45Unlocked == false {
                ball45Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball38" {
            if ballInt == 37 || ballInt == 38 || ballInt == 39 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 46 || ballInt == 47 || ballInt == 48 {
                selector.run(buttonScrollFadeIn)
            }
            ball37.run(buttonScrollFadeOut)
            ball38.run(buttonScrollFadeOut)
            ball39.run(buttonScrollFadeOut)
            ball46.run(buttonScrollFadeIn)
            ball47.run(buttonScrollFadeIn)
            ball48.run(buttonScrollFadeIn)
            
            ball37Lbl.run(buttonScrollFadeOut)
            ball38Lbl.run(buttonScrollFadeOut)
            ball39Lbl.run(buttonScrollFadeOut)
            
            if ball46Unlocked == false {
                ball46Lbl.run(buttonScrollFadeIn)
            }
            if ball47Unlocked == false {
                ball47Lbl.run(buttonScrollFadeIn)
            }
            if ball48Unlocked == false {
                ball48Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball41" {
            if ballInt == 40 || ballInt == 41 || ballInt == 42 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 49 || ballInt == 50 {
                selector.run(buttonScrollFadeIn)
            }
            ball40.run(buttonScrollFadeOut)
            ball41.run(buttonScrollFadeOut)
            ball42.run(buttonScrollFadeOut)
            ball49.run(buttonScrollFadeIn)
            ball50.run(buttonScrollFadeIn)
            
            ball40Lbl.run(buttonScrollFadeOut)
            ball41Lbl.run(buttonScrollFadeOut)
            ball42Lbl.run(buttonScrollFadeOut)
            if ball49Unlocked == false {
                ball49Lbl.run(buttonScrollFadeIn)
            }
            if ball50Unlocked == false {
                ball50Lbl.run(buttonScrollFadeIn)
            }
            
        }
    }
    
    func buttonHitBottomScrollView(Button: SKSpriteNode, Bottom: SKSpriteNode) {
        if Button.name == "scrollViewPlaceHolder" {
            if ballInt == 50 || ballInt == 49 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 40 || ballInt == 41 || ballInt == 42 {
                selector.run(buttonScrollFadeIn)
            }
            ball49.run(buttonScrollFadeOut)
            ball50.run(buttonScrollFadeOut)
            ball40.run(buttonScrollFadeIn)
            ball41.run(buttonScrollFadeIn)
            ball42.run(buttonScrollFadeIn)
            
            ball49Lbl.run(buttonScrollFadeOut)
            ball50Lbl.run(buttonScrollFadeOut)
            if ball40Unlocked == false {
                ball40Lbl.run(buttonScrollFadeIn)
            }
            if ball41Unlocked == false {
                ball41Lbl.run(buttonScrollFadeIn)
            }
            if ball42Unlocked == false {
                ball42Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball47" {
            if ballInt == 46 || ballInt == 47 || ballInt == 48 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 37 || ballInt == 38 || ballInt == 39 {
                selector.run(buttonScrollFadeIn)
            }
            ball48.run(buttonScrollFadeOut)
            ball47.run(buttonScrollFadeOut)
            ball46.run(buttonScrollFadeOut)
            ball39.run(buttonScrollFadeIn)
            ball38.run(buttonScrollFadeIn)
            ball37.run(buttonScrollFadeIn)
            
            ball48Lbl.run(buttonScrollFadeOut)
            ball47Lbl.run(buttonScrollFadeOut)
            ball46Lbl.run(buttonScrollFadeOut)
            if ball39Unlocked == false {
                ball39Lbl.run(buttonScrollFadeIn)
            }
            if ball38Unlocked == false {
                ball38Lbl.run(buttonScrollFadeIn)
            }
            if ball39Unlocked == false {
                ball37Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball44" {
            if ballInt == 43 || ballInt == 44 || ballInt == 45 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 34 || ballInt == 35 || ballInt == 36 {
                selector.run(buttonScrollFadeIn)
            }
            ball45.run(buttonScrollFadeOut)
            ball44.run(buttonScrollFadeOut)
            ball43.run(buttonScrollFadeOut)
            ball36.run(buttonScrollFadeIn)
            ball35.run(buttonScrollFadeIn)
            ball34.run(buttonScrollFadeIn)
            
            ball45Lbl.run(buttonScrollFadeOut)
            ball44Lbl.run(buttonScrollFadeOut)
            ball43Lbl.run(buttonScrollFadeOut)
            if ball36Unlocked == false {
                ball36Lbl.run(buttonScrollFadeIn)
            }
            if ball35Unlocked == false {
                ball35Lbl.run(buttonScrollFadeIn)
            }
            if ball34Unlocked == false {
                ball34Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball41" {
            if ballInt == 40 || ballInt == 41 || ballInt == 42 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 31 || ballInt == 32 || ballInt == 33 {
                selector.run(buttonScrollFadeIn)
            }
            ball42.run(buttonScrollFadeOut)
            ball41.run(buttonScrollFadeOut)
            ball40.run(buttonScrollFadeOut)
            ball33.run(buttonScrollFadeIn)
            ball32.run(buttonScrollFadeIn)
            ball31.run(buttonScrollFadeIn)
            
            ball42Lbl.run(buttonScrollFadeOut)
            ball41Lbl.run(buttonScrollFadeOut)
            ball40Lbl.run(buttonScrollFadeOut)
            if ball33Unlocked == false {
                ball33Lbl.run(buttonScrollFadeIn)
            }
            if ball32Unlocked == false {
                ball32Lbl.run(buttonScrollFadeIn)
            }
            if ball31Unlocked == false {
                ball31Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball38" {
            if ballInt == 37 || ballInt == 38 || ballInt == 39 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 28 || ballInt == 29 || ballInt == 30 {
                selector.run(buttonScrollFadeIn)
            }
            ball39.run(buttonScrollFadeOut)
            ball38.run(buttonScrollFadeOut)
            ball37.run(buttonScrollFadeOut)
            ball30.run(buttonScrollFadeIn)
            ball29.run(buttonScrollFadeIn)
            ball28.run(buttonScrollFadeIn)
            
            ball39Lbl.run(buttonScrollFadeOut)
            ball38Lbl.run(buttonScrollFadeOut)
            ball37Lbl.run(buttonScrollFadeOut)
            if ball30Unlocked == false {
                ball30Lbl.run(buttonScrollFadeIn)
            }
            if ball29Unlocked == false {
                ball29Lbl.run(buttonScrollFadeIn)
            }
            if ball28Unlocked == false {
                ball28Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball35" {
            if ballInt == 34 || ballInt == 35 || ballInt == 36 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 25 || ballInt == 26 || ballInt == 27 {
                selector.run(buttonScrollFadeIn)
            }
            ball36.run(buttonScrollFadeOut)
            ball35.run(buttonScrollFadeOut)
            ball34.run(buttonScrollFadeOut)
            ball27.run(buttonScrollFadeIn)
            ball26.run(buttonScrollFadeIn)
            ball25.run(buttonScrollFadeIn)
            
            ball36Lbl.run(buttonScrollFadeOut)
            ball35Lbl.run(buttonScrollFadeOut)
            ball34Lbl.run(buttonScrollFadeOut)
            if ball27Unlocked == false {
                ball27Lbl.run(buttonScrollFadeIn)
            }
            if ball26Unlocked == false {
                ball26Lbl.run(buttonScrollFadeIn)
            }
            if ball25Unlocked == false {
                ball25Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball32" {
            if ballInt == 31 || ballInt == 32 || ballInt == 33 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 22 || ballInt == 23 || ballInt == 24 {
                selector.run(buttonScrollFadeIn)
            }
            ball33.run(buttonScrollFadeOut)
            ball32.run(buttonScrollFadeOut)
            ball31.run(buttonScrollFadeOut)
            ball24.run(buttonScrollFadeIn)
            ball23.run(buttonScrollFadeIn)
            ball22.run(buttonScrollFadeIn)
            
            ball33Lbl.run(buttonScrollFadeOut)
            ball32Lbl.run(buttonScrollFadeOut)
            ball31Lbl.run(buttonScrollFadeOut)
            if ball24Unlocked == false {
                ball24Lbl.run(buttonScrollFadeIn)
            }
            if ball23Unlocked == false {
                ball23Lbl.run(buttonScrollFadeIn)
            }
            if ball22Unlocked == false {
                ball22Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball29" {
            if ballInt == 28 || ballInt == 29 || ballInt == 30 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 19 || ballInt == 20 || ballInt == 21 {
                selector.run(buttonScrollFadeIn)
            }
            ball30.run(buttonScrollFadeOut)
            ball29.run(buttonScrollFadeOut)
            ball28.run(buttonScrollFadeOut)
            ball21.run(buttonScrollFadeIn)
            ball20.run(buttonScrollFadeIn)
            ball19.run(buttonScrollFadeIn)
            
            ball30Lbl.run(buttonScrollFadeOut)
            ball29Lbl.run(buttonScrollFadeOut)
            ball28Lbl.run(buttonScrollFadeOut)
            if ball21Unlocked == false {
                ball21Lbl.run(buttonScrollFadeIn)
            }
            if ball20Unlocked == false {
                ball20Lbl.run(buttonScrollFadeIn)
            }
            if ball19Unlocked == false {
                ball19Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball26" {
            if ballInt == 25 || ballInt == 26 || ballInt == 27 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 16 || ballInt == 17 || ballInt == 18 {
                selector.run(buttonScrollFadeIn)
            }
            ball27.run(buttonScrollFadeOut)
            ball26.run(buttonScrollFadeOut)
            ball25.run(buttonScrollFadeOut)
            ball18.run(buttonScrollFadeIn)
            ball17.run(buttonScrollFadeIn)
            ball16.run(buttonScrollFadeIn)
            
            ball27Lbl.run(buttonScrollFadeOut)
            ball26Lbl.run(buttonScrollFadeOut)
            ball25Lbl.run(buttonScrollFadeOut)
            if ball18Unlocked == false {
                ball18Lbl.run(buttonScrollFadeIn)
            }
            if ball17Unlocked == false {
                ball17Lbl.run(buttonScrollFadeIn)
            }
            if ball16Unlocked == false {
                ball16Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball23" {
            if ballInt == 22 || ballInt == 23 || ballInt == 24 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 13 || ballInt == 14 || ballInt == 15 {
                selector.run(buttonScrollFadeIn)
            }
            ball24.run(buttonScrollFadeOut)
            ball23.run(buttonScrollFadeOut)
            ball22.run(buttonScrollFadeOut)
            ball15.run(buttonScrollFadeIn)
            ball14.run(buttonScrollFadeIn)
            ball13.run(buttonScrollFadeIn)
            
            ball24Lbl.run(buttonScrollFadeOut)
            ball23Lbl.run(buttonScrollFadeOut)
            ball22Lbl.run(buttonScrollFadeOut)
            if ball15Unlocked == false {
                ball15Lbl.run(buttonScrollFadeIn)
            }
            if ball14Unlocked == false {
                ball14Lbl.run(buttonScrollFadeIn)
            }
            if ball13Unlocked == false {
                ball13Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball20" {
            if ballInt == 19 || ballInt == 20 || ballInt == 21 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 10 || ballInt == 11 || ballInt == 12 {
                selector.run(buttonScrollFadeIn)
            }
            ball21.run(buttonScrollFadeOut)
            ball20.run(buttonScrollFadeOut)
            ball19.run(buttonScrollFadeOut)
            ball12.run(buttonScrollFadeIn)
            ball11.run(buttonScrollFadeIn)
            ball10.run(buttonScrollFadeIn)
            
            ball21Lbl.run(buttonScrollFadeOut)
            ball20Lbl.run(buttonScrollFadeOut)
            ball19Lbl.run(buttonScrollFadeOut)
            
            if ball12Unlocked == false {
                ball12Lbl.run(buttonScrollFadeIn)
            }
            if ball11Unlocked == false {
                ball11Lbl.run(buttonScrollFadeIn)
            }
            if ball10Unlocked == false {
                ball10Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball17" {
            if ballInt == 16 || ballInt == 17 || ballInt == 18 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 7 || ballInt == 8 || ballInt == 9 {
                selector.run(buttonScrollFadeIn)
            }
            ball18.run(buttonScrollFadeOut)
            ball17.run(buttonScrollFadeOut)
            ball16.run(buttonScrollFadeOut)
            ball9.run(buttonScrollFadeIn)
            ball8.run(buttonScrollFadeIn)
            ball7.run(buttonScrollFadeIn)
            
            ball18Lbl.run(buttonScrollFadeOut)
            ball17Lbl.run(buttonScrollFadeOut)
            ball16Lbl.run(buttonScrollFadeOut)
            if ball9Unlocked == false {
                ball9Lbl.run(buttonScrollFadeIn)
            }
            if ball8Unlocked == false {
                ball8Lbl.run(buttonScrollFadeIn)
            }
            if ball7Unlocked == false {
                ball7Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball14" {
            if ballInt == 13 || ballInt == 14 || ballInt == 15 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 4 || ballInt == 5 || ballInt == 6 {
                selector.run(buttonScrollFadeIn)
            }
            ball15.run(buttonScrollFadeOut)
            ball14.run(buttonScrollFadeOut)
            ball13.run(buttonScrollFadeOut)
            ball6.run(buttonScrollFadeIn)
            ball5.run(buttonScrollFadeIn)
            ball4.run(buttonScrollFadeIn)
            
            ball15Lbl.run(buttonScrollFadeOut)
            ball14Lbl.run(buttonScrollFadeOut)
            ball13Lbl.run(buttonScrollFadeOut)
            if ball6Unlocked == false {
                ball6Lbl.run(buttonScrollFadeIn)
            }
            if ball5Unlocked == false {
                ball5Lbl.run(buttonScrollFadeIn)
            }
            if ball4Unlocked == false {
                ball4Lbl.run(buttonScrollFadeIn)
            }
            
        }
        if Button.name == "ball11" {
            if ballInt == 10 || ballInt == 11 || ballInt == 12 {
                selector.run(buttonScrollFadeOut)
            } else if ballInt == 1 || ballInt == 2 || ballInt == 3 {
                selector.run(buttonScrollFadeIn)
            } else if ballInt <= 0 {
                selector.run(buttonScrollFadeIn)
            }
            ball12.run(buttonScrollFadeOut)
            ball11.run(buttonScrollFadeOut)
            ball10.run(buttonScrollFadeOut)
            ball3.run(buttonScrollFadeIn)
            ball2.run(buttonScrollFadeIn)
            ball1.run(buttonScrollFadeIn)
            
            ball12Lbl.run(buttonScrollFadeOut)
            ball11Lbl.run(buttonScrollFadeOut)
            ball10Lbl.run(buttonScrollFadeOut)
            if ball3Unlocked == false {
                ball3Lbl.run(buttonScrollFadeIn)
            }
            if ball2Unlocked == false {
                ball2Lbl.run(buttonScrollFadeIn)
            }
            //ball1Lbl.run(buttonScrollFadeIn)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if touchedNode.name == "ball1Btn" {
            ball1.colorBlendFactor = 0
            
            ballInt = 1
            UserDefaults.standard.set(1, forKey: "paddleInt")
            UserDefaults.standard.synchronize()
            
            selector.removeFromParent()
            selector.position = ball1.position
            page1ScrollView.addChild(selector)
        }
        if touchedNode.name == "ball2Btn" {
            if ball2Unlocked == true {
                ball2.colorBlendFactor = 0
                
                ballInt = 2
                UserDefaults.standard.set(2, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball2.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball2.position
                page1ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball2Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle2Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 2
                UserDefaults.standard.set(2, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball2.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball2.position
                page1ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball3Btn" {
            if ball3Unlocked == true {
                ball3.colorBlendFactor = 0
                
                ballInt = 3
                UserDefaults.standard.set(3, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball3.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball3.position
                page1ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball3Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle3Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 3
                UserDefaults.standard.set(3, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball3.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball3.position
                page1ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball4Btn" {
            if ball4Unlocked == true {
                ball4.colorBlendFactor = 0
                
                ballInt = 4
                UserDefaults.standard.set(4, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball4.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball4.position
                page2ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball4Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle4Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 4
                UserDefaults.standard.set(4, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball4.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball4.position
                page2ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball5Btn" {
            if ball5Unlocked == true {
                ball5.colorBlendFactor = 0
                
                ballInt = 5
                UserDefaults.standard.set(5, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball5.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball5.position
                page2ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball5Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle5Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 5
                UserDefaults.standard.set(5, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball5.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball5.position
                page2ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball6Btn" {
            if ball6Unlocked == true {
                ball6.colorBlendFactor = 0
                
                ballInt = 6
                UserDefaults.standard.set(6, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball6.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball6.position
                page2ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball6Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle6Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 6
                UserDefaults.standard.set(6, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball6.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball6.position
                page2ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball7Btn" {
            if ball7Unlocked == true {
                ball7.colorBlendFactor = 0
                
                ballInt = 7
                UserDefaults.standard.set(7, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball7.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball7.position
                page3ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball7Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle7Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 7
                UserDefaults.standard.set(7, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball7.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball7.position
                page3ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball8Btn" {
            if ball8Unlocked == true {
                ball8.colorBlendFactor = 0
                
                ballInt = 8
                UserDefaults.standard.set(8, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball8.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball8.position
                page3ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball8Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle8Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 8
                UserDefaults.standard.set(8, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball8.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball8.position
                page3ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball9Btn" {
            if ball9Unlocked == true {
                ball9.colorBlendFactor = 0
                
                ballInt = 9
                UserDefaults.standard.set(9, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball9.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball9.position
                page3ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball9Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle9Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 9
                UserDefaults.standard.set(9, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball9.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball9.position
                page3ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball10Btn" {
            if ball10Unlocked == true {
                ball10.colorBlendFactor = 0
                
                ballInt = 10
                UserDefaults.standard.set(10, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball10.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball10.position
                page4ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball10Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle10Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 10
                UserDefaults.standard.set(10, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball10.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball10.position
                page4ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball11Btn" {
            if ball11Unlocked == true {
                ball11.colorBlendFactor = 0
                
                ballInt = 11
                UserDefaults.standard.set(11, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball11.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball11.position
                page4ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball11Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle11Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 11
                UserDefaults.standard.set(11, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball11.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball11.position
                page4ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball12Btn" {
            if ball12Unlocked == true {
                ball12.colorBlendFactor = 0
                
                ballInt = 12
                UserDefaults.standard.set(12, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball12.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball12.position
                page4ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball12Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle12Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 12
                UserDefaults.standard.set(12, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball12.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball12.position
                page4ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball13Btn" {
            if ball13Unlocked == true {
                ball13.colorBlendFactor = 0
                
                ballInt = 13
                UserDefaults.standard.set(13, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball13.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball13.position
                page5ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball13Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle13Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 13
                UserDefaults.standard.set(13, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball13.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball13.position
                page5ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball14Btn" {
            if ball14Unlocked == true {
                ball14.colorBlendFactor = 0
                
                ballInt = 14
                UserDefaults.standard.set(14, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball14.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball14.position
                page5ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball14Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle14Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 14
                UserDefaults.standard.set(14, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball14.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball14.position
                page5ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball15Btn" {
            if ball15Unlocked == true {
                ball15.colorBlendFactor = 0
                
                ballInt = 15
                UserDefaults.standard.set(15, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball15.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball15.position
                page5ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball15Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle15Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 15
                UserDefaults.standard.set(15, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball15.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball15.position
                page5ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball16Btn" {
            if ball16Unlocked == true {
                ball16.colorBlendFactor = 0
                
                ballInt = 16
                UserDefaults.standard.set(16, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball16.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball16.position
                page6ScrollView.addChild(selector)
            } else if coinsInWallet >= 10 {
                coinsInWallet -= 10
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball16Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle16Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 16
                UserDefaults.standard.set(16, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball16.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball16.position
                page6ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball17Btn" {
            if ball17Unlocked == true {
                ball17.colorBlendFactor = 0
                
                ballInt = 17
                UserDefaults.standard.set(17, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball17.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball17.position
                page6ScrollView.addChild(selector)
            } else if coinsInWallet >= 15 {
                coinsInWallet -= 15
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball17Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle17Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 17
                UserDefaults.standard.set(17, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball17.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball17.position
                page6ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball18Btn" {
            if ball18Unlocked == true {
                ball18.colorBlendFactor = 0
                
                ballInt = 18
                UserDefaults.standard.set(18, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball18.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball18.position
                page6ScrollView.addChild(selector)
            } else if coinsInWallet >= 15 {
                coinsInWallet -= 15
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball18Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle18Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 18
                UserDefaults.standard.set(18, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball18.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball18.position
                page6ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball19Btn" {
            if ball19Unlocked == true {
                ball19.colorBlendFactor = 0
                
                ballInt = 19
                UserDefaults.standard.set(19, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball19.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball19.position
                page7ScrollView.addChild(selector)
            } else if coinsInWallet >= 15 {
                coinsInWallet -= 15
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball19Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle19Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 19
                UserDefaults.standard.set(19, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball19.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball19.position
                page7ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball20Btn" {
            if ball20Unlocked == true {
                ball20.colorBlendFactor = 0
                
                ballInt = 20
                UserDefaults.standard.set(20, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball20.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball20.position
                page7ScrollView.addChild(selector)
            } else if coinsInWallet >= 15 {
                coinsInWallet -= 15
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball20Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle20Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 20
                UserDefaults.standard.set(20, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball20.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball20.position
                page7ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball21Btn" {
            if ball21Unlocked == true {
                ball21.colorBlendFactor = 0
                
                ballInt = 21
                UserDefaults.standard.set(21, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball21.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball21.position
                page7ScrollView.addChild(selector)
            } else if coinsInWallet >= 15 {
                coinsInWallet -= 15
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball21Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle21Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 21
                UserDefaults.standard.set(21, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball21.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball21.position
                page7ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball22Btn" {
            if ball22Unlocked == true {
                ball22.colorBlendFactor = 0
                
                ballInt = 22
                UserDefaults.standard.set(22, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball22.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball22.position
                page8ScrollView.addChild(selector)
            } else if coinsInWallet >= 15 {
                coinsInWallet -= 15
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball22Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle22Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 22
                UserDefaults.standard.set(22, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball22.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball22.position
                page8ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball23Btn" {
            if ball23Unlocked == true {
                ball23.colorBlendFactor = 0
                
                ballInt = 23
                UserDefaults.standard.set(23, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball23.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball23.position
                page8ScrollView.addChild(selector)
            } else if coinsInWallet >= 20 {
                coinsInWallet -= 20
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball23Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle23Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 23
                UserDefaults.standard.set(23, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball23.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball23.position
                page8ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball24Btn" {
            if ball24Unlocked == true {
                ball24.colorBlendFactor = 0
                
                ballInt = 24
                UserDefaults.standard.set(24, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball24.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball24.position
                page8ScrollView.addChild(selector)
            } else if coinsInWallet >= 20 {
                coinsInWallet -= 20
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball24Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle24Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 24
                UserDefaults.standard.set(24, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball24.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball24.position
                page8ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball25Btn" {
            if ball25Unlocked == true {
                ball25.colorBlendFactor = 0
                
                ballInt = 25
                UserDefaults.standard.set(25, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball25.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball25.position
                page9ScrollView.addChild(selector)
            } else if coinsInWallet >= 20 {
                coinsInWallet -= 20
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball25Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle25Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 25
                UserDefaults.standard.set(25, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball25.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball25.position
                page9ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball26Btn" {
            if ball26Unlocked == true {
                ball26.colorBlendFactor = 0
                
                ballInt = 26
                UserDefaults.standard.set(26, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball26.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball26.position
                page9ScrollView.addChild(selector)
            } else if coinsInWallet >= 20 {
                coinsInWallet -= 20
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball26Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle26Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 26
                UserDefaults.standard.set(26, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball26.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball26.position
                page9ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball27Btn" {
            if ball27Unlocked == true {
                ball27.colorBlendFactor = 0
                
                ballInt = 27
                UserDefaults.standard.set(27, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball27.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball27.position
                page9ScrollView.addChild(selector)
            } else if coinsInWallet >= 20 {
                coinsInWallet -= 20
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball27Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle27Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 27
                UserDefaults.standard.set(27, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball27.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball27.position
                page9ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball28Btn" {
            if ball28Unlocked == true {
                ball28.colorBlendFactor = 0
                
                ballInt = 28
                UserDefaults.standard.set(28, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball28.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball28.position
                page10ScrollView.addChild(selector)
            } else if coinsInWallet >= 20 {
                coinsInWallet -= 20
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball28Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle28Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 28
                UserDefaults.standard.set(28, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball28.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball28.position
                page10ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball29Btn" {
            if ball29Unlocked == true {
                ball29.colorBlendFactor = 0
                
                ballInt = 29
                UserDefaults.standard.set(29, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball29.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball29.position
                page10ScrollView.addChild(selector)
            } else if coinsInWallet >= 20 {
                coinsInWallet -= 20
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball29Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle29Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 29
                UserDefaults.standard.set(29, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball29.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball29.position
                page10ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball30Btn" {
            if ball30Unlocked == true {
                ball30.colorBlendFactor = 0
                
                ballInt = 30
                UserDefaults.standard.set(30, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball30.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball30.position
                page10ScrollView.addChild(selector)
            } else if coinsInWallet >= 20 {
                coinsInWallet -= 20
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball30Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle30Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 30
                UserDefaults.standard.set(30, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball30.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball30.position
                page10ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball31Btn" {
            if ball31Unlocked == true {
                ball31.colorBlendFactor = 0
                
                ballInt = 31
                UserDefaults.standard.set(31, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball31.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball31.position
                page11ScrollView.addChild(selector)
            } else if coinsInWallet >= 25 {
                coinsInWallet -= 25
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball31Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle31Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 31
                UserDefaults.standard.set(31, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball31.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball31.position
                page11ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball32Btn" {
            if ball32Unlocked == true {
                ball32.colorBlendFactor = 0
                
                ballInt = 32
                UserDefaults.standard.set(32, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball32.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball32.position
                page11ScrollView.addChild(selector)
            } else if coinsInWallet >= 25 {
                coinsInWallet -= 25
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball32Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle32Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 32
                UserDefaults.standard.set(32, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball32.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball32.position
                page11ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball33Btn" {
            if ball33Unlocked == true {
                ball33.colorBlendFactor = 0
                
                ballInt = 33
                UserDefaults.standard.set(33, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball33.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball33.position
                page11ScrollView.addChild(selector)
            } else if coinsInWallet >= 25 {
                coinsInWallet -= 25
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball33Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle33Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 33
                UserDefaults.standard.set(33, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball33.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball33.position
                page11ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball34Btn" {
            if ball34Unlocked == true {
                ball34.colorBlendFactor = 0
                
                ballInt = 34
                UserDefaults.standard.set(34, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball34.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball34.position
                page12ScrollView.addChild(selector)
            } else if coinsInWallet >= 25 {
                coinsInWallet -= 25
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball34Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle34Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 34
                UserDefaults.standard.set(34, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball34.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball34.position
                page12ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball35Btn" {
            if ball35Unlocked == true {
                ball35.colorBlendFactor = 0
                
                ballInt = 35
                UserDefaults.standard.set(35, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball35.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball35.position
                page12ScrollView.addChild(selector)
            } else if coinsInWallet >= 25 {
                coinsInWallet -= 25
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball35Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle35Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 35
                UserDefaults.standard.set(35, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball35.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball35.position
                page12ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball36Btn" {
            if ball36Unlocked == true {
                ball36.colorBlendFactor = 0
                
                ballInt = 36
                UserDefaults.standard.set(36, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball36.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball36.position
                page12ScrollView.addChild(selector)
            } else if coinsInWallet >= 25 {
                coinsInWallet -= 25
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball36Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle36Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 36
                UserDefaults.standard.set(36, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball36.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball36.position
                page12ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball37Btn" {
            if ball37Unlocked == true {
                ball37.colorBlendFactor = 0
                
                ballInt = 37
                UserDefaults.standard.set(37, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball37.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball37.position
                page13ScrollView.addChild(selector)
            } else if coinsInWallet >= 30 {
                coinsInWallet -= 30
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball37Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle37Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 37
                UserDefaults.standard.set(37, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball37.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball37.position
                page13ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball38Btn" {
            if ball38Unlocked == true {
                ball38.colorBlendFactor = 0
                
                ballInt = 38
                UserDefaults.standard.set(38, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball38.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball38.position
                page13ScrollView.addChild(selector)
            } else if coinsInWallet >= 30 {
                coinsInWallet -= 30
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball38Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle38Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 38
                UserDefaults.standard.set(38, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball38.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball38.position
                page13ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball39Btn" {
            if ball39Unlocked == true {
                ball39.colorBlendFactor = 0
                
                ballInt = 39
                UserDefaults.standard.set(39, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball39.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball39.position
                page13ScrollView.addChild(selector)
            } else if coinsInWallet >= 30 {
                coinsInWallet -= 30
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball39Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle39Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 39
                UserDefaults.standard.set(39, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball39.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball39.position
                page13ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball40Btn" {
            if ball40Unlocked == true {
                ball40.colorBlendFactor = 0
                
                ballInt = 40
                UserDefaults.standard.set(40, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball40.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball40.position
                page14ScrollView.addChild(selector)
            } else if coinsInWallet >= 35 {
                coinsInWallet -= 35
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball40Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle40Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 40
                UserDefaults.standard.set(40, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball40.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball40.position
                page14ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball41Btn" {
            if ball41Unlocked == true {
                ball41.colorBlendFactor = 0
                
                ballInt = 41
                UserDefaults.standard.set(41, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball41.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball41.position
                page14ScrollView.addChild(selector)
            } else if coinsInWallet >= 35 {
                coinsInWallet -= 35
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball41Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle41Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 41
                UserDefaults.standard.set(41, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball41.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball41.position
                page14ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball42Btn" {
            if ball42Unlocked == true {
                ball42.colorBlendFactor = 0
                
                ballInt = 42
                UserDefaults.standard.set(42, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball42.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball42.position
                page14ScrollView.addChild(selector)
            } else if coinsInWallet >= 35 {
                coinsInWallet -= 35
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball42Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle42Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 42
                UserDefaults.standard.set(42, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball42.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball42.position
                page14ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball43Btn" {
            if ball43Unlocked == true {
                ball43.colorBlendFactor = 0
                
                ballInt = 43
                UserDefaults.standard.set(43, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball43.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball43.position
                page15ScrollView.addChild(selector)
            } else if coinsInWallet >= 40 {
                coinsInWallet -= 40
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball43Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle43Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 43
                UserDefaults.standard.set(43, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball43.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball43.position
                page15ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball44Btn" {
            if ball44Unlocked == true {
                ball44.colorBlendFactor = 0
                
                ballInt = 44
                UserDefaults.standard.set(44, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball44.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball44.position
                page15ScrollView.addChild(selector)
            } else if coinsInWallet >= 40 {
                coinsInWallet -= 40
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball44Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle44Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 44
                UserDefaults.standard.set(44, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball44.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball44.position
                page15ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball45Btn" {
            if ball45Unlocked == true {
                ball45.colorBlendFactor = 0
                
                ballInt = 45
                UserDefaults.standard.set(45, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball45.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball45.position
                page15ScrollView.addChild(selector)
            } else if coinsInWallet >= 40 {
                coinsInWallet -= 40
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball45Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle45Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 45
                UserDefaults.standard.set(45, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball45.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball45.position
                page15ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball46Btn" {
            if ball46Unlocked == true {
                ball46.colorBlendFactor = 0
                
                ballInt = 46
                UserDefaults.standard.set(46, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball46.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball46.position
                page16ScrollView.addChild(selector)
            } else if coinsInWallet >= 45 {
                coinsInWallet -= 45
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball46Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle46Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 46
                UserDefaults.standard.set(46, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball46.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball46.position
                page16ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball47Btn" {
            if ball47Unlocked == true {
                ball47.colorBlendFactor = 0
                
                ballInt = 47
                UserDefaults.standard.set(47, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball47.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball47.position
                page16ScrollView.addChild(selector)
            } else if coinsInWallet >= 45 {
                coinsInWallet -= 45
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball47Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle47Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 47
                UserDefaults.standard.set(47, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball47.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball47.position
                page16ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball48Btn" {
            if ball48Unlocked == true {
                ball48.colorBlendFactor = 0
                
                ballInt = 48
                UserDefaults.standard.set(48, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball48.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball48.position
                page16ScrollView.addChild(selector)
            } else if coinsInWallet >= 45 {
                coinsInWallet -= 45
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball48Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle48Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 48
                UserDefaults.standard.set(48, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball48.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball48.position
                page16ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball49Btn" {
            if ball49Unlocked == true {
                ball49.colorBlendFactor = 0
                
                ballInt = 49
                UserDefaults.standard.set(49, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball49.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball49.position
                page17ScrollView.addChild(selector)
            } else if coinsInWallet >= 50 {
                coinsInWallet -= 50
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball49Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle49Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 49
                UserDefaults.standard.set(49, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball49.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball49.position
                page17ScrollView.addChild(selector)
            }
        }
        if touchedNode.name == "ball50Btn" {
            if ball50Unlocked == true {
                ball50.colorBlendFactor = 0
                
                ballInt = 50
                UserDefaults.standard.set(50, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball50.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball50.position
                page17ScrollView.addChild(selector)
            } else if coinsInWallet >= 50 {
                coinsInWallet -= 50
                UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
                UserDefaults.standard.synchronize()
                
                ball50Unlocked = true
                UserDefaults.standard.set(true, forKey: "paddle50Unlocked")
                UserDefaults.standard.synchronize()
                
                ballInt = 50
                UserDefaults.standard.set(50, forKey: "paddleInt")
                UserDefaults.standard.synchronize()
                
                ball50.colorBlendFactor = 0
                selector.removeFromParent()
                selector.position = ball50.position
                page17ScrollView.addChild(selector)
            }
        }
        
    }
    
    func createScrollView() {
        
        scrollView = SwiftySKScrollView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height * 4), moveableNode: moveableNode, direction: .vertical)
        
        guard let scrollView = scrollView else { return }
        
        scrollView.center = CGPoint(x: frame.midX, y: frame.midY)
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height * 1.55)
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
        page6ScrollView.color = SKColor.clear
        moveableNode.addChild(page6ScrollView)
        
        page7ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page7ScrollView.position = CGPoint(x: page6ScrollView.position.x, y: page6ScrollView.position.y - (page6ScrollView.size.height * 2))
        page7ScrollView.zPosition = 1
        page7ScrollView.color = SKColor.clear
        moveableNode.addChild(page7ScrollView)
        
        page8ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page8ScrollView.position = CGPoint(x: page7ScrollView.position.x, y: page7ScrollView.position.y - (page7ScrollView.size.height * 2))
        page8ScrollView.zPosition = 1
        page8ScrollView.color = SKColor.clear
        moveableNode.addChild(page8ScrollView)
        
        page9ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page9ScrollView.position = CGPoint(x: page8ScrollView.position.x, y: page8ScrollView.position.y - (page8ScrollView.size.height * 2))
        page9ScrollView.zPosition = 1
        page9ScrollView.color = SKColor.clear
        moveableNode.addChild(page9ScrollView)
        
        page10ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page10ScrollView.position = CGPoint(x: page9ScrollView.position.x, y: page9ScrollView.position.y - (page9ScrollView.size.height * 2))
        page10ScrollView.zPosition = 1
        page10ScrollView.color = SKColor.clear
        moveableNode.addChild(page10ScrollView)
        
        page11ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page11ScrollView.position = CGPoint(x: page10ScrollView.position.x, y: page10ScrollView.position.y - (page10ScrollView.size.height * 2))
        page11ScrollView.zPosition = 1
        page11ScrollView.color = SKColor.clear
        moveableNode.addChild(page11ScrollView)
        
        page12ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page12ScrollView.position = CGPoint(x: page11ScrollView.position.x, y: page11ScrollView.position.y - (page11ScrollView.size.height * 2))
        page12ScrollView.zPosition = 1
        page12ScrollView.color = SKColor.clear
        moveableNode.addChild(page12ScrollView)
        
        page13ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page13ScrollView.position = CGPoint(x: page12ScrollView.position.x, y: page12ScrollView.position.y - (page12ScrollView.size.height * 2))
        page13ScrollView.zPosition = 1
        page13ScrollView.color = SKColor.clear
        moveableNode.addChild(page13ScrollView)
        
        page14ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page14ScrollView.position = CGPoint(x: page13ScrollView.position.x, y: page13ScrollView.position.y - (page13ScrollView.size.height * 2))
        page14ScrollView.zPosition = 1
        page14ScrollView.color = SKColor.clear
        moveableNode.addChild(page14ScrollView)
        
        page15ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page15ScrollView.position = CGPoint(x: page14ScrollView.position.x, y: page14ScrollView.position.y - (page14ScrollView.size.height * 2))
        page15ScrollView.zPosition = 1
        page15ScrollView.color = SKColor.clear
        moveableNode.addChild(page15ScrollView)
        
        page16ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page16ScrollView.position = CGPoint(x: page15ScrollView.position.x, y: page15ScrollView.position.y - (page15ScrollView.size.height * 2))
        page16ScrollView.zPosition = 1
        page16ScrollView.color = SKColor.clear
        moveableNode.addChild(page16ScrollView)
        
        page17ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 1.5, height: self.frame.height / 12))
        page17ScrollView.position = CGPoint(x: page16ScrollView.position.x, y: page16ScrollView.position.y - (page16ScrollView.size.height * 2))
        page17ScrollView.zPosition = 1
        page17ScrollView.color = SKColor.clear
        moveableNode.addChild(page17ScrollView)
        
        ball1.position = CGPoint(x: 0 - (page1ScrollView.frame.width / 2.5), y: 0)
        page1ScrollView.addChild(ball1)
        ball1Btn.position = ball1.position
        page1ScrollView.addChild(ball1Btn)
        
        ball2.position = CGPoint(x: 0, y: 0)
        page1ScrollView.addChild(ball2)
        ball2Btn.position = ball2.position
        page1ScrollView.addChild(ball2Btn)
        
        ball3.position = CGPoint(x: 0 + (page1ScrollView.frame.width / 2.5), y: 0)
        page1ScrollView.addChild(ball3)
        ball3Btn.position = ball3.position
        page1ScrollView.addChild(ball3Btn)
        
        ball4.position = CGPoint(x: 0 - (page2ScrollView.frame.width / 2.5), y: 0)
        page2ScrollView.addChild(ball4)
        ball4Btn.position = ball4.position
        page2ScrollView.addChild(ball4Btn)
        
        ball5.position = CGPoint(x: 0, y: 0)
        page2ScrollView.addChild(ball5)
        ball5Btn.position = ball5.position
        page2ScrollView.addChild(ball5Btn)
        
        ball6.position = CGPoint(x: 0 + (page2ScrollView.frame.width / 2.5), y: 0)
        page2ScrollView.addChild(ball6)
        ball6Btn.position = ball6.position
        page2ScrollView.addChild(ball6Btn)
        
        ball7.position = CGPoint(x: 0 - (page3ScrollView.frame.width / 2.5), y: 0)
        page3ScrollView.addChild(ball7)
        ball7Btn.position = ball7.position
        page3ScrollView.addChild(ball7Btn)
        
        ball8.position = CGPoint(x: 0, y: 0)
        page3ScrollView.addChild(ball8)
        ball8Btn.position = ball8.position
        page3ScrollView.addChild(ball8Btn)
        
        ball9.position = CGPoint(x: 0 + (page3ScrollView.frame.width / 2.5), y: 0)
        page3ScrollView.addChild(ball9)
        ball9Btn.position = ball9.position
        page3ScrollView.addChild(ball9Btn)
        
        ball10.position = CGPoint(x: 0 - (page4ScrollView.frame.width / 2.5), y: 0)
        page4ScrollView.addChild(ball10)
        ball10Btn.position = ball10.position
        page4ScrollView.addChild(ball10Btn)
        
        ball11.position = CGPoint(x: 0, y: 0)
        page4ScrollView.addChild(ball11)
        ball11Btn.position = ball11.position
        page4ScrollView.addChild(ball11Btn)
        
        ball12.position = CGPoint(x: 0 + (page4ScrollView.frame.width / 2.5), y: 0)
        page4ScrollView.addChild(ball12)
        ball12Btn.position = ball12.position
        page4ScrollView.addChild(ball12Btn)
        
        ball13.position = CGPoint(x: 0 - (page5ScrollView.frame.width / 2.5), y: 0)
        page5ScrollView.addChild(ball13)
        ball13Btn.position = ball13.position
        page5ScrollView.addChild(ball13Btn)
        
        ball14.position = CGPoint(x: 0, y: 0)
        page5ScrollView.addChild(ball14)
        ball14Btn.position = ball14.position
        page5ScrollView.addChild(ball14Btn)
        
        ball15.position = CGPoint(x: 0 + (page5ScrollView.frame.width / 2.5), y: 0)
        page5ScrollView.addChild(ball15)
        ball15Btn.position = ball15.position
        page5ScrollView.addChild(ball15Btn)
        
        ball16.position = CGPoint(x: 0 - (page6ScrollView.frame.width / 2.5), y: 0)
        page6ScrollView.addChild(ball16)
        ball16Btn.position = ball16.position
        page6ScrollView.addChild(ball16Btn)
        
        ball17.position = CGPoint(x: 0, y: 0)
        page6ScrollView.addChild(ball17)
        ball17Btn.position = ball17.position
        page6ScrollView.addChild(ball17Btn)
        
        ball18.position = CGPoint(x: 0 + (page6ScrollView.frame.width / 2.5), y: 0)
        page6ScrollView.addChild(ball18)
        ball18Btn.position = ball18.position
        page6ScrollView.addChild(ball18Btn)
        
        ball19.position = CGPoint(x: 0 - (page7ScrollView.frame.width / 2.5), y: 0)
        page7ScrollView.addChild(ball19)
        ball19Btn.position = ball19.position
        page7ScrollView.addChild(ball19Btn)
        
        ball20.position = CGPoint(x: 0, y: 0)
        page7ScrollView.addChild(ball20)
        ball20Btn.position = ball20.position
        page7ScrollView.addChild(ball20Btn)
        
        ball21.position = CGPoint(x: 0 + (page7ScrollView.frame.width / 2.5), y: 0)
        page7ScrollView.addChild(ball21)
        ball21Btn.position = ball21.position
        page7ScrollView.addChild(ball21Btn)
        
        ball22.position = CGPoint(x: 0 - (page8ScrollView.frame.width / 2.5), y: 0)
        page8ScrollView.addChild(ball22)
        ball22Btn.position = ball22.position
        page8ScrollView.addChild(ball22Btn)
        
        ball23.position = CGPoint(x: 0, y: 0)
        page8ScrollView.addChild(ball23)
        ball23Btn.position = ball23.position
        page8ScrollView.addChild(ball23Btn)
        
        ball24.position = CGPoint(x: 0 + (page8ScrollView.frame.width / 2.5), y: 0)
        page8ScrollView.addChild(ball24)
        ball24Btn.position = ball24.position
        page8ScrollView.addChild(ball24Btn)
        
        ball25.position = CGPoint(x: 0 - (page9ScrollView.frame.width / 2.5), y: 0)
        page9ScrollView.addChild(ball25)
        ball25Btn.position = ball25.position
        page9ScrollView.addChild(ball25Btn)
        
        ball26.position = CGPoint(x: 0, y: 0)
        page9ScrollView.addChild(ball26)
        ball26Btn.position = ball26.position
        page9ScrollView.addChild(ball26Btn)
        
        ball27.position = CGPoint(x: 0 + (page9ScrollView.frame.width / 2.5), y: 0)
        page9ScrollView.addChild(ball27)
        ball27Btn.position = ball27.position
        page9ScrollView.addChild(ball27Btn)
        
        ball28.position = CGPoint(x: 0 - (page10ScrollView.frame.width / 2.5), y: 0)
        page10ScrollView.addChild(ball28)
        ball28Btn.position = ball28.position
        page10ScrollView.addChild(ball28Btn)
        
        ball29.position = CGPoint(x: 0, y: 0)
        page10ScrollView.addChild(ball29)
        ball29Btn.position = ball29.position
        page10ScrollView.addChild(ball29Btn)
        
        ball30.position = CGPoint(x: 0 + (page10ScrollView.frame.width / 2.5), y: 0)
        page10ScrollView.addChild(ball30)
        ball30Btn.position = ball30.position
        page10ScrollView.addChild(ball30Btn)
        
        ball31.position = CGPoint(x: 0 - (page11ScrollView.frame.width / 2.5), y: 0)
        page11ScrollView.addChild(ball31)
        ball31Btn.position = ball31.position
        page11ScrollView.addChild(ball31Btn)
        
        ball32.position = CGPoint(x: 0, y: 0)
        page11ScrollView.addChild(ball32)
        ball32Btn.position = ball32.position
        page11ScrollView.addChild(ball32Btn)
        
        ball33.position = CGPoint(x: 0 + (page11ScrollView.frame.width / 2.5), y: 0)
        page11ScrollView.addChild(ball33)
        ball33Btn.position = ball33.position
        page11ScrollView.addChild(ball33Btn)
        
        ball34.position = CGPoint(x: 0 - (page12ScrollView.frame.width / 2.5), y: 0)
        page12ScrollView.addChild(ball34)
        ball34Btn.position = ball34.position
        page12ScrollView.addChild(ball34Btn)
        
        ball35.position = CGPoint(x: 0, y: 0)
        page12ScrollView.addChild(ball35)
        ball35Btn.position = ball35.position
        page12ScrollView.addChild(ball35Btn)
        
        ball36.position = CGPoint(x: 0 + (page12ScrollView.frame.width / 2.5), y: 0)
        page12ScrollView.addChild(ball36)
        ball36Btn.position = ball36.position
        page12ScrollView.addChild(ball36Btn)
        
        ball37.position = CGPoint(x: 0 - (page13ScrollView.frame.width / 2.5), y: 0)
        page13ScrollView.addChild(ball37)
        ball37Btn.position = ball37.position
        page13ScrollView.addChild(ball37Btn)
        
        ball38.position = CGPoint(x: 0, y: 0)
        page13ScrollView.addChild(ball38)
        ball38Btn.position = ball38.position
        page13ScrollView.addChild(ball38Btn)
        
        ball39.position = CGPoint(x: 0 + (page13ScrollView.frame.width / 2.5), y: 0)
        page13ScrollView.addChild(ball39)
        ball39Btn.position = ball39.position
        page13ScrollView.addChild(ball39Btn)
        
        ball40.position = CGPoint(x: 0 - (page14ScrollView.frame.width / 2.5), y: 0)
        page14ScrollView.addChild(ball40)
        ball40Btn.position = ball40.position
        page14ScrollView.addChild(ball40Btn)
        
        ball41.position = CGPoint(x: 0, y: 0)
        page14ScrollView.addChild(ball41)
        ball41Btn.position = ball41.position
        page14ScrollView.addChild(ball41Btn)
        
        ball42.position = CGPoint(x: 0 + (page14ScrollView.frame.width / 2.5), y: 0)
        page14ScrollView.addChild(ball42)
        ball42Btn.position = ball42.position
        page14ScrollView.addChild(ball42Btn)
        
        ball43.position = CGPoint(x: 0 - (page15ScrollView.frame.width / 2.5), y: 0)
        page15ScrollView.addChild(ball43)
        ball43Btn.position = ball43.position
        page15ScrollView.addChild(ball43Btn)
        
        ball44.position = CGPoint(x: 0, y: 0)
        page15ScrollView.addChild(ball44)
        ball44Btn.position = ball44.position
        page15ScrollView.addChild(ball44Btn)
        
        ball45.position = CGPoint(x: 0 + (page15ScrollView.frame.width / 2.5), y: 0)
        page15ScrollView.addChild(ball45)
        ball45Btn.position = ball45.position
        page15ScrollView.addChild(ball45Btn)
        
        ball46.position = CGPoint(x: 0 - (page16ScrollView.frame.width / 2.5), y: 0)
        page16ScrollView.addChild(ball46)
        ball46Btn.position = ball46.position
        page16ScrollView.addChild(ball46Btn)
        
        ball47.position = CGPoint(x: 0, y: 0)
        page16ScrollView.addChild(ball47)
        ball47Btn.position = ball47.position
        page16ScrollView.addChild(ball47Btn)
        
        ball48.position = CGPoint(x: 0 + (page16ScrollView.frame.width / 2.5), y: 0)
        page16ScrollView.addChild(ball48)
        ball48Btn.position = ball48.position
        page16ScrollView.addChild(ball48Btn)
        
        ball49.position = CGPoint(x: 0 - (page17ScrollView.frame.width / 5), y: 0)
        page17ScrollView.addChild(ball49)
        ball49Btn.position = ball49.position
        page17ScrollView.addChild(ball49Btn)
        
        scrollViewPlaceHolder.position = CGPoint(x: 0, y: 0)
        page17ScrollView.addChild(scrollViewPlaceHolder)
        
        ball50.position = CGPoint(x: 0 + (page17ScrollView.frame.width / 5), y: 0)
        page17ScrollView.addChild(ball50)
        ball50Btn.position = ball50.position
        page17ScrollView.addChild(ball50Btn)
        
        if ballInt == 1 {
            selector.position = ball1.position
            page1ScrollView.addChild(selector)
        } else if ballInt == 2 {
            selector.position = ball2.position
            page1ScrollView.addChild(selector)
        } else if ballInt == 3 {
            selector.position = ball3.position
            page1ScrollView.addChild(selector)
        } else if ballInt == 4 {
            selector.position = ball4.position
            page2ScrollView.addChild(selector)
        } else if ballInt == 5 {
            selector.position = ball5.position
            page2ScrollView.addChild(selector)
        } else if ballInt == 6 {
            selector.position = ball6.position
            page2ScrollView.addChild(selector)
        } else if ballInt == 7 {
            selector.position = ball7.position
            page3ScrollView.addChild(selector)
        } else if ballInt == 8 {
            selector.position = ball8.position
            page3ScrollView.addChild(selector)
        } else if ballInt == 9 {
            selector.position = ball9.position
            page3ScrollView.addChild(selector)
        } else if ballInt == 10 {
            selector.position = ball10.position
            selector.alpha = 0
            page4ScrollView.addChild(selector)
        } else if ballInt == 11 {
            selector.position = ball11.position
            selector.alpha = 0
            page4ScrollView.addChild(selector)
        } else if ballInt == 12 {
            selector.position = ball12.position
            selector.alpha = 0
            page4ScrollView.addChild(selector)
        } else if ballInt == 13 {
            selector.position = ball13.position
            selector.alpha = 0
            page5ScrollView.addChild(selector)
        } else if ballInt == 14 {
            selector.position = ball14.position
            selector.alpha = 0
            page5ScrollView.addChild(selector)
        } else if ballInt == 15 {
            selector.position = ball15.position
            selector.alpha = 0
            page5ScrollView.addChild(selector)
        } else if ballInt == 16 {
            selector.position = ball16.position
            selector.alpha = 0
            page6ScrollView.addChild(selector)
        } else if ballInt == 17 {
            selector.position = ball17.position
            selector.alpha = 0
            page6ScrollView.addChild(selector)
        } else if ballInt == 18 {
            selector.position = ball18.position
            selector.alpha = 0
            page6ScrollView.addChild(selector)
        } else if ballInt == 19 {
            selector.position = ball19.position
            selector.alpha = 0
            page7ScrollView.addChild(selector)
        } else if ballInt == 20 {
            selector.position = ball20.position
            selector.alpha = 0
            page7ScrollView.addChild(selector)
        } else if ballInt == 21 {
            selector.position = ball21.position
            selector.alpha = 0
            page7ScrollView.addChild(selector)
        } else if ballInt == 22 {
            selector.position = ball22.position
            selector.alpha = 0
            page8ScrollView.addChild(selector)
        } else if ballInt == 23 {
            selector.position = ball23.position
            selector.alpha = 0
            page8ScrollView.addChild(selector)
        } else if ballInt == 24 {
            selector.position = ball24.position
            selector.alpha = 0
            page8ScrollView.addChild(selector)
        } else if ballInt == 25 {
            selector.position = ball25.position
            selector.alpha = 0
            page9ScrollView.addChild(selector)
        } else if ballInt == 26 {
            selector.position = ball26.position
            selector.alpha = 0
            page9ScrollView.addChild(selector)
        } else if ballInt == 27 {
            selector.position = ball27.position
            selector.alpha = 0
            page9ScrollView.addChild(selector)
        } else if ballInt == 28 {
            selector.position = ball28.position
            selector.alpha = 0
            page10ScrollView.addChild(selector)
        } else if ballInt == 29 {
            selector.position = ball29.position
            selector.alpha = 0
            page10ScrollView.addChild(selector)
        } else if ballInt == 30 {
            selector.position = ball30.position
            selector.alpha = 0
            page10ScrollView.addChild(selector)
        } else if ballInt == 31 {
            selector.position = ball31.position
            selector.alpha = 0
            page11ScrollView.addChild(selector)
        } else if ballInt == 32 {
            selector.position = ball32.position
            selector.alpha = 0
            page11ScrollView.addChild(selector)
        } else if ballInt == 33 {
            selector.position = ball33.position
            selector.alpha = 0
            page11ScrollView.addChild(selector)
        } else if ballInt == 34 {
            selector.position = ball34.position
            selector.alpha = 0
            page12ScrollView.addChild(selector)
        } else if ballInt == 35 {
            selector.position = ball35.position
            selector.alpha = 0
            page12ScrollView.addChild(selector)
        } else if ballInt == 36 {
            selector.position = ball36.position
            selector.alpha = 0
            page12ScrollView.addChild(selector)
        } else if ballInt == 37 {
            selector.position = ball37.position
            selector.alpha = 0
            page13ScrollView.addChild(selector)
        } else if ballInt == 38 {
            selector.position = ball38.position
            selector.alpha = 0
            page13ScrollView.addChild(selector)
        } else if ballInt == 39 {
            selector.position = ball39.position
            selector.alpha = 0
            page13ScrollView.addChild(selector)
        } else if ballInt == 40 {
            selector.position = ball40.position
            selector.alpha = 0
            page14ScrollView.addChild(selector)
        } else if ballInt == 41 {
            selector.position = ball41.position
            selector.alpha = 0
            page14ScrollView.addChild(selector)
        } else if ballInt == 42 {
            selector.position = ball42.position
            selector.alpha = 0
            page14ScrollView.addChild(selector)
        } else if ballInt == 43 {
            selector.position = ball43.position
            selector.alpha = 0
            page15ScrollView.addChild(selector)
        } else if ballInt == 44 {
            selector.position = ball44.position
            selector.alpha = 0
            page15ScrollView.addChild(selector)
        } else if ballInt == 45 {
            selector.position = ball45.position
            selector.alpha = 0
            page15ScrollView.addChild(selector)
        } else if ballInt == 46 {
            selector.position = ball46.position
            selector.alpha = 0
            page16ScrollView.addChild(selector)
        } else if ballInt == 47 {
            selector.position = ball47.position
            selector.alpha = 0
            page16ScrollView.addChild(selector)
        } else if ballInt == 48 {
            selector.position = ball48.position
            selector.alpha = 0
            page16ScrollView.addChild(selector)
        } else if ballInt == 49 {
            selector.position = ball49.position
            selector.alpha = 0
            page17ScrollView.addChild(selector)
        } else if ballInt == 50 {
            selector.position = ball50.position
            selector.alpha = 0
            page17ScrollView.addChild(selector)
        } else {
            selector.position = ball1.position
            page1ScrollView.addChild(selector)
        }
        
    }
    
}
