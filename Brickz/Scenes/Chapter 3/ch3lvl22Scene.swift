//
//  ch3lvl22Scene.swift
//  Brickz
//
//  Created by Julian Cearley on 3/31/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

// make it so the ball doesnt move the barriers
// make it so the paddle doesnt move the barriers

import SpriteKit
import GameplayKit

class ch3lvl22Scene: SKScene, SKPhysicsContactDelegate {
    
    var triBallDropped = false
    
    var triBallCollected = false
    
    var continueString = UserDefaults.standard.string(forKey: "continueString")
    
    var adNum = UserDefaults.standard.integer(forKey: "adNum")
    
    let ball1 = BallNode()
    let ball2 = BallNode()
    let ball3 = BallNode()
    
    var ballCount = 1
    
    let paddle = PaddleNode()
    let powerUp = PowerUpNode()
    
    let brick1 = SKSpriteNode()
    let brick2 = SKSpriteNode()
    let brick3 = SKSpriteNode()
    let brick4 = SKSpriteNode()
    let brick5 = SKSpriteNode()
    let brick6 = SKSpriteNode()
    let brick7 = SKSpriteNode()
    let brick8 = SKSpriteNode()
    let brick9 = SKSpriteNode()
    let brick10 = SKSpriteNode()
    let brick11 = SKSpriteNode()
    let brick12 = SKSpriteNode()
    let brick13 = SKSpriteNode()
    let brick14 = SKSpriteNode()
    let brick15 = SKSpriteNode()
    let brick16 = SKSpriteNode()
    let brick17 = SKSpriteNode()
    let brick18 = SKSpriteNode()
    let brick19 = SKSpriteNode()
    let brick20 = SKSpriteNode()
    let brick21 = SKSpriteNode()
    let brick22 = SKSpriteNode()
    let brick23 = SKSpriteNode()
    let brick24 = SKSpriteNode()
    let brick25 = SKSpriteNode()
    let brick26 = SKSpriteNode()
    let brick27 = SKSpriteNode()
    let brick28 = SKSpriteNode()
    let brick29 = SKSpriteNode()
    let brick30 = SKSpriteNode()
    let brick31 = SKSpriteNode()
    let brick32 = SKSpriteNode()
    let brick33 = SKSpriteNode()
    let brick34 = SKSpriteNode()
    let brick35 = SKSpriteNode()
    let brick36 = SKSpriteNode()
    let brick37 = SKSpriteNode()
    let brick38 = SKSpriteNode()
    let brick39 = SKSpriteNode()
    let brick40 = SKSpriteNode()
    let brick41 = SKSpriteNode()
    let brick42 = SKSpriteNode()
    let brick43 = SKSpriteNode()
    let brick44 = SKSpriteNode()
    let brick45 = SKSpriteNode()
    let brick46 = SKSpriteNode()
    let brick47 = SKSpriteNode()
    let brick48 = SKSpriteNode()
    let brick49 = SKSpriteNode()
    let brick50 = SKSpriteNode()
    let brick51 = SKSpriteNode()
    let brick52 = SKSpriteNode()
    let brick53 = SKSpriteNode()
    let brick54 = SKSpriteNode()
    let brick55 = SKSpriteNode()
    let brick56 = SKSpriteNode()
    
    var brickLives: Array = [6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6,6]
    
    var brickCount = 56
    
    var gameStarted = false
    var gameOver = false
    
    var score = 0
    let scoreLbl = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
    
    var ch3lvl23Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl23Unlocked")
    
    let background = SKSpriteNode(imageNamed: "ch3Background")
    
    let leftBarrier = SKSpriteNode()
    let rightBarrier = SKSpriteNode()
    let topBarrier = SKSpriteNode()
    let bottomBarrier = SKSpriteNode()
    
    let fadeIn = SKAction.fadeIn(withDuration: 0.5)
    let fadeOut = SKAction.fadeOut(withDuration: 0.5)
    
    let pauseBtn = SKSpriteNode(imageNamed: "pauseImg")
    let nextBtn = SKSpriteNode(imageNamed: "nextImg")
    let retryBtn = SKSpriteNode(imageNamed: "retryImg")
    let mainMenuBtn = SKSpriteNode(imageNamed: "mainMenuImg")
    let continueBtn = SKSpriteNode(imageNamed: "continueImg")
    
    var woodBrickSize = CGSize()
    var cementBrickSize = CGSize()
    var steelBrickSize = CGSize()
    
    var coinsInWallet = UserDefaults.standard.integer(forKey: "coinsInWallet")
    let coinWalletLbl = SKLabelNode()
    let coinImg = SKSpriteNode(imageNamed: "brickzCoin")
    
    var paddleGrowActive = false
    var paddleShrinkActive = false
    var triBallActive = false
    var invincibleActive = false
    var x2Active = false
    var miniBallActive = false
    var giantBallActive = false
    
    let ggLbl = SKSpriteNode(imageNamed: "GGImg")
    
    let x2ActiveImg = SKSpriteNode(imageNamed: "x2ScorePU")
    let x2ActiveLbl = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
    let invincibleActiveImg = SKSpriteNode(imageNamed: "invincibleBallPU")
    let invincibleActiveLbl = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
    
    var moveObstacleLeft = SKAction()
    var moveObstacleRight = SKAction()
    var firstMoveMiddle = SKAction()
    var firstMoveBottom = SKAction()
    
    let obstacleTop = SKSpriteNode()
    let obstacleBottom = SKSpriteNode()
    let obstacleMiddle = SKSpriteNode()
    
    let iPhoneXLeftBarrier = SKSpriteNode()
    let iPhoneXRightBarrier = SKSpriteNode()
    let iPhoneXBottomBarrier = SKSpriteNode()
    
    var invincibleTime = 10
    var invincibleTimer = Timer()
    
    var x2Time = 10
    var x2Timer = Timer()
    
    var soundBool = UserDefaults.standard.bool(forKey: "soundBool")
    
    let buttonSnd = SKAction.playSoundFileNamed("ButtonSound", waitForCompletion: true)
    let wallBounceSnd = SKAction.playSoundFileNamed("BorderBounce", waitForCompletion: false)
    let brickHitSnd = SKAction.playSoundFileNamed("BrickCrumble", waitForCompletion: false)
    let brickDeathSnd = SKAction.playSoundFileNamed("BrickCrush.wav", waitForCompletion: false)
    let ballHitPaddleSnd = SKAction.playSoundFileNamed("PaddleHits.wav", waitForCompletion: false)
    let ballLaunchSnd = SKAction.playSoundFileNamed("InitialPaddleLaunch", waitForCompletion: false)
    let rocketLaunchSnd = SKAction.playSoundFileNamed("RocketLaunch.wav", waitForCompletion: false)
    let rocketExplosionSnd = SKAction.playSoundFileNamed("RocketBoom.wav", waitForCompletion: false)
    let coinCollectSnd = SKAction.playSoundFileNamed("Coins.wav", waitForCompletion: false)
    let puGrowSnd = SKAction.playSoundFileNamed("Expand.wav", waitForCompletion: false)
    let puShrinkSnd = SKAction.playSoundFileNamed("Compress.wav", waitForCompletion: false)
    let ggSnd = SKAction.playSoundFileNamed("DeathSnd.wav", waitForCompletion: false)
    let x2PUSnd = SKAction.playSoundFileNamed("PointsMultiplier.wav", waitForCompletion: false)
    let ballHitObstacleSnd = SKAction.playSoundFileNamed("WoodBounce.wav", waitForCompletion: false)
    let winLvlSnd = SKAction.playSoundFileNamed("LevelWin.wav", waitForCompletion: false)
    let deathPUSnd = SKAction.playSoundFileNamed("SkullandCrossBones.wav", waitForCompletion: false)
    let genPUSnd = SKAction.playSoundFileNamed("GenPUSnd.wav", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.physicsWorld.contactDelegate = self
        
        if adNum == 4 {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "displayAdKey"), object: nil)
            adNum = 0
            UserDefaults.standard.set(adNum, forKey: "adNum")
            UserDefaults.standard.synchronize()
        } else if adNum < 4 {
            adNum += 1
            UserDefaults.standard.set(adNum, forKey: "adNum")
            UserDefaults.standard.synchronize()
        }
        
        if view.frame.width == 375 && view.frame.height == 812 {
            // iPhoneX top Border
            iPhoneXLeftBarrier.size = CGSize(width: 1, height: self.frame.height / 15)
            iPhoneXLeftBarrier.position = CGPoint(x: self.frame.width / 4.5, y: self.frame.height / 1.001)
            iPhoneXLeftBarrier.zPosition = 1
            iPhoneXLeftBarrier.color = SKColor.clear
            iPhoneXLeftBarrier.name = "iPhoneXLeftBarrier"
            self.addChild(iPhoneXLeftBarrier)
            iPhoneXLeftBarrier.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: iPhoneXLeftBarrier.size.width / 2, height: iPhoneXLeftBarrier.size.height))
            iPhoneXLeftBarrier.physicsBody?.isDynamic = false
            iPhoneXLeftBarrier.physicsBody?.affectedByGravity = false
            iPhoneXLeftBarrier.physicsBody?.allowsRotation = false
            iPhoneXLeftBarrier.physicsBody?.categoryBitMask = PhysicsCategory.Barrier
            iPhoneXLeftBarrier.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
            iPhoneXLeftBarrier.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
            
            iPhoneXBottomBarrier.size = CGSize(width: self.frame.width / 1.8, height: 1)
            iPhoneXBottomBarrier.position = CGPoint(x: self.frame.width / 2, y: iPhoneXLeftBarrier.position.y - (iPhoneXLeftBarrier.size.height / 1.9))
            iPhoneXBottomBarrier.zPosition = 1
            iPhoneXBottomBarrier.color = SKColor.clear
            iPhoneXBottomBarrier.name = "iPhoneXBottomBarrier"
            self.addChild(iPhoneXBottomBarrier)
            iPhoneXBottomBarrier.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: iPhoneXBottomBarrier.size.width, height: iPhoneXBottomBarrier.size.height / 2))
            iPhoneXBottomBarrier.physicsBody?.isDynamic = false
            iPhoneXBottomBarrier.physicsBody?.affectedByGravity = false
            iPhoneXBottomBarrier.physicsBody?.allowsRotation = false
            iPhoneXBottomBarrier.physicsBody?.categoryBitMask = PhysicsCategory.Barrier
            iPhoneXBottomBarrier.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
            iPhoneXBottomBarrier.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
            
            iPhoneXRightBarrier.size = CGSize(width: 1, height: self.frame.height / 15)
            iPhoneXRightBarrier.position = CGPoint(x: self.frame.width / 1.29, y: self.frame.height / 1.001)
            iPhoneXRightBarrier.zPosition = 1
            iPhoneXRightBarrier.color = SKColor.clear
            iPhoneXRightBarrier.name = "iPhoneXRightBarrier"
            self.addChild(iPhoneXRightBarrier)
            iPhoneXRightBarrier.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: iPhoneXRightBarrier.size.width / 2, height: iPhoneXRightBarrier.size.height))
            iPhoneXRightBarrier.physicsBody?.isDynamic = false
            iPhoneXRightBarrier.physicsBody?.affectedByGravity = false
            iPhoneXRightBarrier.physicsBody?.allowsRotation = false
            iPhoneXRightBarrier.physicsBody?.categoryBitMask = PhysicsCategory.Barrier
            iPhoneXRightBarrier.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
            iPhoneXRightBarrier.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        }
        
        ggLbl.size = CGSize(width: self.frame.width / 1.9, height: self.frame.height / 15)
        ggLbl.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.3)
        ggLbl.zPosition = 1
        ggLbl.alpha = 0
        ggLbl.zPosition = 10
        self.addChild(ggLbl)
        
        scoreLbl.text = "\(score)"
        scoreLbl.fontColor = SKColor.white
        scoreLbl.fontSize = self.frame.width / 8
        scoreLbl.zPosition = 5
        scoreLbl.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.1)
        self.addChild(scoreLbl)
        
        coinImg.size = CGSize(width: self.frame.width / 12, height: self.frame.width / 12)
        coinImg.position = CGPoint(x: 0 + coinImg.size.width, y: self.frame.height - (coinImg.size.height))
        coinImg.zPosition = 1
        self.addChild(coinImg)
        
        coinWalletLbl.text = "\(coinsInWallet)"
        coinWalletLbl.fontSize = self.frame.width / 12
        coinWalletLbl.fontColor = SKColor.white
        coinWalletLbl.zPosition = 1
        coinWalletLbl.position = CGPoint(x: coinImg.position.x + (coinImg.size.width * 0.6), y: coinImg.position.y - (coinImg.size.height * 0.35))
        coinWalletLbl.horizontalAlignmentMode = .left
        self.addChild(coinWalletLbl)
        
        if view.frame.width == 768 && view.frame.height == 1024 || view.frame.width == 834 && view.frame.height == 1112 || view.frame.width == 1024 && view.frame.height == 1366 {
            woodBrickSize = CGSize(width: self.frame.width / 11, height: self.frame.height / 24)
            cementBrickSize = CGSize(width: self.frame.height / 24, height: self.frame.height / 24)
            steelBrickSize = CGSize(width: self.frame.width / 11, height: self.frame.width / 11)
        } else {
            woodBrickSize = CGSize(width: self.frame.width / 8, height: self.frame.height / 25)
            cementBrickSize = CGSize(width: self.frame.height / 25, height: self.frame.height / 25)
            steelBrickSize = CGSize(width: self.frame.width / 8, height: self.frame.width / 8)
        }
        
        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        background.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        background.zPosition = 0
        self.addChild(background)
        
        leftBarrier.size = CGSize(width: 1, height: self.frame.height)
        leftBarrier.position = CGPoint(x: 0, y: self.frame.height / 2)
        leftBarrier.zPosition = 1
        leftBarrier.color = SKColor.clear
        leftBarrier.name = "leftBarrier"
        self.addChild(leftBarrier)
        leftBarrier.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: leftBarrier.size.width, height: leftBarrier.size.height))
        leftBarrier.physicsBody?.isDynamic = false
        leftBarrier.physicsBody?.affectedByGravity = false
        leftBarrier.physicsBody?.allowsRotation = false
        leftBarrier.physicsBody?.categoryBitMask = PhysicsCategory.Barrier
        leftBarrier.physicsBody?.collisionBitMask = PhysicsCategory.Obstacle
        leftBarrier.physicsBody?.contactTestBitMask = PhysicsCategory.Obstacle
        
        rightBarrier.size = CGSize(width: 1, height: self.frame.height)
        rightBarrier.position = CGPoint(x: self.frame.width, y: self.frame.height / 2)
        rightBarrier.zPosition = 1
        rightBarrier.color = SKColor.clear
        rightBarrier.name = "rightBarrier"
        self.addChild(rightBarrier)
        rightBarrier.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: rightBarrier.size.width, height: rightBarrier.size.height))
        rightBarrier.physicsBody?.isDynamic = false
        rightBarrier.physicsBody?.affectedByGravity = false
        rightBarrier.physicsBody?.allowsRotation = false
        rightBarrier.physicsBody?.categoryBitMask = PhysicsCategory.Barrier
        rightBarrier.physicsBody?.collisionBitMask = PhysicsCategory.Obstacle
        rightBarrier.physicsBody?.contactTestBitMask = PhysicsCategory.Obstacle
        
        topBarrier.size = CGSize(width: self.frame.width * 25, height: 1)
        topBarrier.position = CGPoint(x: self.frame.width / 2, y: self.frame.height)
        topBarrier.zPosition = 1
        topBarrier.color = SKColor.clear
        topBarrier.name = "topBarrier"
        self.addChild(topBarrier)
        topBarrier.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: topBarrier.size.width, height: topBarrier.size.height))
        topBarrier.physicsBody?.isDynamic = false
        topBarrier.physicsBody?.affectedByGravity = false
        topBarrier.physicsBody?.allowsRotation = false
        topBarrier.physicsBody?.categoryBitMask = PhysicsCategory.Barrier
        topBarrier.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        topBarrier.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        bottomBarrier.size = CGSize(width: self.frame.width * 25, height: 1)
        bottomBarrier.position = CGPoint(x: self.frame.width / 2, y: 0)
        bottomBarrier.zPosition = 1
        bottomBarrier.color = SKColor.clear
        bottomBarrier.name = "bottomBarrier"
        self.addChild(bottomBarrier)
        bottomBarrier.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: bottomBarrier.size.width, height: bottomBarrier.size.height))
        bottomBarrier.physicsBody?.isDynamic = false
        bottomBarrier.physicsBody?.affectedByGravity = false
        bottomBarrier.physicsBody?.categoryBitMask = PhysicsCategory.Barrier
        bottomBarrier.physicsBody?.collisionBitMask = PhysicsCategory.Ball | PhysicsCategory.PowerUp
        bottomBarrier.physicsBody?.contactTestBitMask = PhysicsCategory.Ball | PhysicsCategory.PowerUp
        
        paddle.size = CGSize(width: self.frame.width / 4.8, height: self.frame.height / 25)
        paddle.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 10)
        paddle.zPosition = 1
        paddle.name = "paddle"
        self.addChild(paddle)
        paddle.physicsBody = SKPhysicsBody(rectangleOf: paddle.size)
        paddle.physicsBody?.affectedByGravity = false
        paddle.physicsBody?.isDynamic = false
        paddle.physicsBody?.categoryBitMask = PhysicsCategory.Paddle
        paddle.physicsBody?.collisionBitMask = PhysicsCategory.PowerUp | PhysicsCategory.Ball
        paddle.physicsBody?.contactTestBitMask = PhysicsCategory.PowerUp | PhysicsCategory.Ball
        
        ball1.size = CGSize(width: self.frame.width / 17.5, height: self.frame.width / 17.5)
        ball1.zPosition = 1
        ball1.position = CGPoint(x: self.frame.width / 2, y: paddle.position.y + (ball1.size.height))
        ball1.name = "ball"
        self.addChild(ball1)
        ball1.physicsBody = SKPhysicsBody(circleOfRadius: ball1.size.width / 2)
        ball1.physicsBody?.isDynamic = true
        ball1.physicsBody?.affectedByGravity = false
        ball1.physicsBody?.allowsRotation = true
        ball1.physicsBody?.categoryBitMask = PhysicsCategory.Ball
        ball1.physicsBody?.collisionBitMask = PhysicsCategory.Barrier | PhysicsCategory.Brick | PhysicsCategory.Paddle | PhysicsCategory.Obstacle | PhysicsCategory.Brick
        ball1.physicsBody?.contactTestBitMask = PhysicsCategory.Brick | PhysicsCategory.Barrier | PhysicsCategory.Paddle | PhysicsCategory.Obstacle | PhysicsCategory.Brick
        ball1.physicsBody?.linearDamping = 0
        ball1.physicsBody?.angularDamping = 0
        ball1.physicsBody?.friction = 0
        ball1.physicsBody?.restitution = 1
        
        ball2.size = CGSize(width: self.frame.width / 17.5, height: self.frame.width / 17.5)
        ball2.zPosition = 1
        ball2.position = CGPoint(x: self.frame.width / 2, y: paddle.position.y + (self.frame.width / 17.5))
        ball2.name = "ball"
        ball2.physicsBody = SKPhysicsBody(circleOfRadius: ball1.size.width / 2)
        ball2.physicsBody?.isDynamic = true
        ball2.physicsBody?.affectedByGravity = false
        ball2.physicsBody?.allowsRotation = true
        ball2.physicsBody?.categoryBitMask = PhysicsCategory.Ball
        ball2.physicsBody?.collisionBitMask = PhysicsCategory.Barrier | PhysicsCategory.Brick | PhysicsCategory.Paddle | PhysicsCategory.Obstacle | PhysicsCategory.Brick
        ball2.physicsBody?.contactTestBitMask = PhysicsCategory.Brick | PhysicsCategory.Barrier | PhysicsCategory.Paddle | PhysicsCategory.Obstacle | PhysicsCategory.Brick
        ball2.physicsBody?.linearDamping = 0
        ball2.physicsBody?.angularDamping = 0
        ball2.physicsBody?.friction = 0
        ball2.physicsBody?.restitution = 1
        
        ball3.size = CGSize(width: self.frame.width / 17.5, height: self.frame.width / 17.5)
        ball3.zPosition = 1
        ball3.position = CGPoint(x: self.frame.width / 2, y: paddle.position.y + (self.frame.width / 17.5))
        ball3.name = "ball"
        ball3.physicsBody = SKPhysicsBody(circleOfRadius: ball1.size.width / 2)
        ball3.physicsBody?.isDynamic = true
        ball3.physicsBody?.affectedByGravity = false
        ball3.physicsBody?.allowsRotation = true
        ball3.physicsBody?.categoryBitMask = PhysicsCategory.Ball
        ball3.physicsBody?.collisionBitMask = PhysicsCategory.Barrier | PhysicsCategory.Brick | PhysicsCategory.Paddle | PhysicsCategory.Obstacle | PhysicsCategory.Brick
        ball3.physicsBody?.contactTestBitMask = PhysicsCategory.Brick | PhysicsCategory.Barrier | PhysicsCategory.Paddle | PhysicsCategory.Obstacle | PhysicsCategory.Brick
        ball3.physicsBody?.linearDamping = 0
        ball3.physicsBody?.angularDamping = 0
        ball3.physicsBody?.friction = 0
        ball3.physicsBody?.restitution = 1
        
        brick1.texture = SKTexture(imageNamed: "brick2Texture6")
        brick1.size = cementBrickSize
        brick1.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.8 + (cementBrickSize.height))
        brick1.name = "brick1"
        brick1.zPosition = 1
        self.addChild(brick1)
        brick1.physicsBody = SKPhysicsBody(rectangleOf: brick1.size)
        brick1.physicsBody?.isDynamic = false
        brick1.physicsBody?.affectedByGravity = false
        brick1.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick1.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick2.texture = SKTexture(imageNamed: "brick2Texture6")
        brick2.size = cementBrickSize
        brick2.position = CGPoint(x: brick1.position.x + (brick1.size.width), y: brick1.position.y)
        brick2.name = "brick2"
        brick2.zPosition = 1
        self.addChild(brick2)
        brick2.physicsBody = SKPhysicsBody(rectangleOf: brick2.size)
        brick2.physicsBody?.isDynamic = false
        brick2.physicsBody?.affectedByGravity = false
        brick2.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick2.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick2.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick3.texture = SKTexture(imageNamed: "brick2Texture6")
        brick3.size = cementBrickSize
        brick3.position = CGPoint(x: brick1.position.x - (brick1.size.width), y: brick1.position.y)
        brick3.name = "brick3"
        brick3.zPosition = 1
        self.addChild(brick3)
        brick3.physicsBody = SKPhysicsBody(rectangleOf: brick3.size)
        brick3.physicsBody?.isDynamic = false
        brick3.physicsBody?.affectedByGravity = false
        brick3.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick3.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick3.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick4.texture = SKTexture(imageNamed: "brick2Texture6")
        brick4.size = cementBrickSize
        brick4.position = CGPoint(x: brick3.position.x - (brick3.size.width), y: brick3.position.y)
        brick4.name = "brick4"
        brick4.zPosition = 1
        self.addChild(brick4)
        brick4.physicsBody = SKPhysicsBody(rectangleOf: brick4.size)
        brick4.physicsBody?.isDynamic = false
        brick4.physicsBody?.affectedByGravity = false
        brick4.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick4.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick4.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick5.texture = SKTexture(imageNamed: "brick2Texture6")
        brick5.size = cementBrickSize
        brick5.position = CGPoint(x: brick4.position.x - (brick4.size.width), y: brick4.position.y)
        brick5.name = "brick5"
        brick5.zPosition = 1
        self.addChild(brick5)
        brick5.physicsBody = SKPhysicsBody(rectangleOf: brick5.size)
        brick5.physicsBody?.isDynamic = false
        brick5.physicsBody?.affectedByGravity = false
        brick5.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick5.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick5.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick6.texture = SKTexture(imageNamed: "brick2Texture6")
        brick6.size = cementBrickSize
        brick6.position = CGPoint(x: brick2.position.x + (brick2.size.width), y: brick2.position.y)
        brick6.name = "brick6"
        brick6.zPosition = 1
        self.addChild(brick6)
        brick6.physicsBody = SKPhysicsBody(rectangleOf: brick6.size)
        brick6.physicsBody?.isDynamic = false
        brick6.physicsBody?.affectedByGravity = false
        brick6.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick6.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick6.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick7.texture = SKTexture(imageNamed: "brick2Texture6")
        brick7.size = cementBrickSize
        brick7.position = CGPoint(x: brick6.position.x + (brick6.size.width), y: brick6.position.y)
        brick7.name = "brick7"
        brick7.zPosition = 1
        self.addChild(brick7)
        brick7.physicsBody = SKPhysicsBody(rectangleOf: brick7.size)
        brick7.physicsBody?.isDynamic = false
        brick7.physicsBody?.affectedByGravity = false
        brick7.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick7.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick7.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick8.texture = SKTexture(imageNamed: "brick2Texture6")
        brick8.size = cementBrickSize
        brick8.position = CGPoint(x: brick7.position.x - (brick7.size.width / 2), y:  brick7.position.y + (brick7.size.height))
        brick8.name = "brick8"
        brick8.zPosition = 1
        self.addChild(brick8)
        brick8.physicsBody = SKPhysicsBody(rectangleOf: brick8.size)
        brick8.physicsBody?.isDynamic = false
        brick8.physicsBody?.affectedByGravity = false
        brick8.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick8.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick8.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick9.texture = SKTexture(imageNamed: "brick2Texture6")
        brick9.size = cementBrickSize
        brick9.position = CGPoint(x: brick8.position.x - (brick8.size.width), y: brick8.position.y)
        brick9.name = "brick9"
        brick9.zPosition = 1
        self.addChild(brick9)
        brick9.physicsBody = SKPhysicsBody(rectangleOf: brick9.size)
        brick9.physicsBody?.isDynamic = false
        brick9.physicsBody?.affectedByGravity = false
        brick9.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick9.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick9.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick10.texture = SKTexture(imageNamed: "brick2Texture6")
        brick10.size = cementBrickSize
        brick10.position = CGPoint(x: brick9.position.x - (brick9.size.width), y: brick9.position.y)
        brick10.name = "brick10"
        brick10.zPosition = 1
        self.addChild(brick10)
        brick10.physicsBody = SKPhysicsBody(rectangleOf: brick10.size)
        brick10.physicsBody?.isDynamic = false
        brick10.physicsBody?.affectedByGravity = false
        brick10.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick10.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick10.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick11.texture = SKTexture(imageNamed: "brick2Texture6")
        brick11.size = cementBrickSize
        brick11.position = CGPoint(x: brick10.position.x - (brick10.size.width), y: brick10.position.y)
        brick11.name = "brick11"
        brick11.zPosition = 1
        self.addChild(brick11)
        brick11.physicsBody = SKPhysicsBody(rectangleOf: brick11.size)
        brick11.physicsBody?.isDynamic = false
        brick11.physicsBody?.affectedByGravity = false
        brick11.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick11.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick11.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick12.texture = SKTexture(imageNamed: "brick2Texture6")
        brick12.size = cementBrickSize
        brick12.position = CGPoint(x: brick11.position.x - (brick11.size.width), y: brick11.position.y)
        brick12.name = "brick12"
        brick12.zPosition = 1
        self.addChild(brick12)
        brick12.physicsBody = SKPhysicsBody(rectangleOf: brick12.size)
        brick12.physicsBody?.isDynamic = false
        brick12.physicsBody?.affectedByGravity = false
        brick12.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick12.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick12.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick13.texture = SKTexture(imageNamed: "brick2Texture6")
        brick13.size = cementBrickSize
        brick13.position = CGPoint(x: brick12.position.x - (brick12.size.width), y: brick12.position.y)
        brick13.name = "brick13"
        brick13.zPosition = 1
        self.addChild(brick13)
        brick13.physicsBody = SKPhysicsBody(rectangleOf: brick13.size)
        brick13.physicsBody?.isDynamic = false
        brick13.physicsBody?.affectedByGravity = false
        brick13.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick13.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick13.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick14.texture = SKTexture(imageNamed: "brick2Texture6")
        brick14.size = cementBrickSize
        brick14.position = CGPoint(x: brick13.position.x + (brick13.size.width / 2), y: brick13.position.y + (brick13.size.height))
        brick14.name = "brick14"
        brick14.zPosition = 1
        self.addChild(brick14)
        brick14.physicsBody = SKPhysicsBody(rectangleOf: brick14.size)
        brick14.physicsBody?.isDynamic = false
        brick14.physicsBody?.affectedByGravity = false
        brick14.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick14.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick14.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick15.texture = SKTexture(imageNamed: "brick2Texture6")
        brick15.size = cementBrickSize
        brick15.position = CGPoint(x: brick14.position.x + (brick14.size.width), y: brick14.position.y)
        brick15.name = "brick15"
        brick15.zPosition = 1
        self.addChild(brick15)
        brick15.physicsBody = SKPhysicsBody(rectangleOf: brick15.size)
        brick15.physicsBody?.isDynamic = false
        brick15.physicsBody?.affectedByGravity = false
        brick15.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick15.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick15.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick16.texture = SKTexture(imageNamed: "brick2Texture6")
        brick16.size = cementBrickSize
        brick16.position = CGPoint(x: brick15.position.x + (brick15.size.width), y: brick15.position.y)
        brick16.name = "brick16"
        brick16.zPosition = 1
        self.addChild(brick16)
        brick16.physicsBody = SKPhysicsBody(rectangleOf: brick16.size)
        brick16.physicsBody?.isDynamic = false
        brick16.physicsBody?.affectedByGravity = false
        brick16.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick16.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick16.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick17.texture = SKTexture(imageNamed: "brick2Texture6")
        brick17.size = cementBrickSize
        brick17.position = CGPoint(x: brick16.position.x + (brick16.size.width), y: brick16.position.y)
        brick17.name = "brick17"
        brick17.zPosition = 1
        self.addChild(brick17)
        brick17.physicsBody = SKPhysicsBody(rectangleOf: brick17.size)
        brick17.physicsBody?.isDynamic = false
        brick17.physicsBody?.affectedByGravity = false
        brick17.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick17.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick17.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick18.texture = SKTexture(imageNamed: "brick2Texture6")
        brick18.size = cementBrickSize
        brick18.position = CGPoint(x: brick17.position.x + (brick17.size.width), y: brick17.position.y)
        brick18.name = "brick18"
        brick18.zPosition = 1
        self.addChild(brick18)
        brick18.physicsBody = SKPhysicsBody(rectangleOf: brick18.size)
        brick18.physicsBody?.isDynamic = false
        brick18.physicsBody?.affectedByGravity = false
        brick18.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick18.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick18.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick19.texture = SKTexture(imageNamed: "brick2Texture6")
        brick19.size = cementBrickSize
        brick19.position = CGPoint(x: brick18.position.x - (brick18.size.width / 2), y: brick18.position.y + (brick18.size.height))
        brick19.name = "brick19"
        brick19.zPosition = 1
        self.addChild(brick19)
        brick19.physicsBody = SKPhysicsBody(rectangleOf: brick19.size)
        brick19.physicsBody?.isDynamic = false
        brick19.physicsBody?.affectedByGravity = false
        brick19.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick19.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick19.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick20.texture = SKTexture(imageNamed: "brick2Texture6")
        brick20.size = cementBrickSize
        brick20.position = CGPoint(x: brick19.position.x - (brick19.size.width), y: brick19.position.y)
        brick20.name = "brick20"
        brick20.zPosition = 1
        self.addChild(brick20)
        brick20.physicsBody = SKPhysicsBody(rectangleOf: brick20.size)
        brick20.physicsBody?.isDynamic = false
        brick20.physicsBody?.affectedByGravity = false
        brick20.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick20.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick20.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick21.texture = SKTexture(imageNamed: "brick2Texture6")
        brick21.size = cementBrickSize
        brick21.position = CGPoint(x: brick20.position.x - (brick20.size.width), y: brick20.position.y)
        brick21.name = "brick21"
        brick21.zPosition = 1
        self.addChild(brick21)
        brick21.physicsBody = SKPhysicsBody(rectangleOf: brick21.size)
        brick21.physicsBody?.isDynamic = false
        brick21.physicsBody?.affectedByGravity = false
        brick21.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick21.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick21.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick22.texture = SKTexture(imageNamed: "brick2Texture6")
        brick22.size = cementBrickSize
        brick22.position = CGPoint(x: brick21.position.x - (brick21.size.width), y: brick21.position.y)
        brick22.name = "brick22"
        brick22.zPosition = 1
        self.addChild(brick22)
        brick22.physicsBody = SKPhysicsBody(rectangleOf: brick22.size)
        brick22.physicsBody?.isDynamic = false
        brick22.physicsBody?.affectedByGravity = false
        brick22.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick22.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick22.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick23.texture = SKTexture(imageNamed: "brick2Texture6")
        brick23.size = cementBrickSize
        brick23.position = CGPoint(x: brick22.position.x + (brick22.size.width / 2), y: brick22.position.y + (brick22.size.height))
        brick23.name = "brick23"
        brick23.zPosition = 1
        self.addChild(brick23)
        brick23.physicsBody = SKPhysicsBody(rectangleOf: brick23.size)
        brick23.physicsBody?.isDynamic = false
        brick23.physicsBody?.affectedByGravity = false
        brick23.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick23.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick23.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick24.texture = SKTexture(imageNamed: "brick2Texture6")
        brick24.size = cementBrickSize
        brick24.position = CGPoint(x: brick23.position.x + (brick23.size.width), y: brick23.position.y)
        brick24.name = "brick24"
        brick24.zPosition = 1
        self.addChild(brick24)
        brick24.physicsBody = SKPhysicsBody(rectangleOf: brick24.size)
        brick24.physicsBody?.isDynamic = false
        brick24.physicsBody?.affectedByGravity = false
        brick24.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick24.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick24.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick25.texture = SKTexture(imageNamed: "brick2Texture6")
        brick25.size = cementBrickSize
        brick25.position = CGPoint(x: brick24.position.x + (brick24.size.width), y: brick24.position.y)
        brick25.name = "brick25"
        brick25.zPosition = 1
        self.addChild(brick25)
        brick25.physicsBody = SKPhysicsBody(rectangleOf: brick25.size)
        brick25.physicsBody?.isDynamic = false
        brick25.physicsBody?.affectedByGravity = false
        brick25.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick25.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick25.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick26.texture = SKTexture(imageNamed: "brick2Texture6")
        brick26.size = cementBrickSize
        brick26.position = CGPoint(x: brick25.position.x - (brick25.size.width / 2), y: brick25.position.y + (brick25.size.height))
        brick26.name = "brick26"
        brick26.zPosition = 1
        self.addChild(brick26)
        brick26.physicsBody = SKPhysicsBody(rectangleOf: brick26.size)
        brick26.physicsBody?.isDynamic = false
        brick26.physicsBody?.affectedByGravity = false
        brick26.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick26.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick26.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick27.texture = SKTexture(imageNamed: "brick2Texture6")
        brick27.size = cementBrickSize
        brick27.position = CGPoint(x: brick26.position.x - (brick26.size.width), y: brick26.position.y)
        brick27.name = "brick27"
        brick27.zPosition = 1
        self.addChild(brick27)
        brick27.physicsBody = SKPhysicsBody(rectangleOf: brick27.size)
        brick27.physicsBody?.isDynamic = false
        brick27.physicsBody?.affectedByGravity = false
        brick27.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick27.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick27.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick28.texture = SKTexture(imageNamed: "brick2Texture6")
        brick28.size = cementBrickSize
        brick28.position = CGPoint(x: brick27.position.x + (brick27.size.width / 2), y: brick27.position.y + (brick27.size.height))
        brick28.name = "brick28"
        brick28.zPosition = 1
        self.addChild(brick28)
        brick28.physicsBody = SKPhysicsBody(rectangleOf: brick28.size)
        brick28.physicsBody?.isDynamic = false
        brick28.physicsBody?.affectedByGravity = false
        brick28.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick28.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick28.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick29.texture = SKTexture(imageNamed: "brick2Texture6")
        brick29.size = cementBrickSize
        brick29.position = CGPoint(x: brick7.position.x, y: self.frame.height / 1.8 - (cementBrickSize.height))
        brick29.name = "brick29"
        brick29.zPosition = 1
        self.addChild(brick29)
        brick29.physicsBody = SKPhysicsBody(rectangleOf: brick29.size)
        brick29.physicsBody?.isDynamic = false
        brick29.physicsBody?.affectedByGravity = false
        brick29.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick29.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick29.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick30.texture = SKTexture(imageNamed: "brick2Texture6")
        brick30.size = cementBrickSize
        brick30.position = CGPoint(x: brick29.position.x - (brick29.size.width), y: brick29.position.y)
        brick30.name = "brick30"
        brick30.zPosition = 1
        self.addChild(brick30)
        brick30.physicsBody = SKPhysicsBody(rectangleOf: brick30.size)
        brick30.physicsBody?.isDynamic = false
        brick30.physicsBody?.affectedByGravity = false
        brick30.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick30.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick30.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick31.texture = SKTexture(imageNamed: "brick2Texture6")
        brick31.size = cementBrickSize
        brick31.position = CGPoint(x: brick30.position.x - (brick30.size.width), y: brick30.position.y)
        brick31.name = "brick31"
        brick31.zPosition = 1
        self.addChild(brick31)
        brick31.physicsBody = SKPhysicsBody(rectangleOf: brick31.size)
        brick31.physicsBody?.isDynamic = false
        brick31.physicsBody?.affectedByGravity = false
        brick31.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick31.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick31.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick32.texture = SKTexture(imageNamed: "brick2Texture6")
        brick32.size = cementBrickSize
        brick32.position = CGPoint(x: brick31.position.x - (brick31.size.width), y: brick31.position.y)
        brick32.name = "brick32"
        brick32.zPosition = 1
        self.addChild(brick32)
        brick32.physicsBody = SKPhysicsBody(rectangleOf: brick32.size)
        brick32.physicsBody?.isDynamic = false
        brick32.physicsBody?.affectedByGravity = false
        brick32.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick32.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick32.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick33.texture = SKTexture(imageNamed: "brick2Texture6")
        brick33.size = cementBrickSize
        brick33.position = CGPoint(x: brick32.position.x - (brick32.size.width), y: brick32.position.y)
        brick33.name = "brick33"
        brick33.zPosition = 1
        self.addChild(brick33)
        brick33.physicsBody = SKPhysicsBody(rectangleOf: brick33.size)
        brick33.physicsBody?.isDynamic = false
        brick33.physicsBody?.affectedByGravity = false
        brick33.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick33.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick33.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick34.texture = SKTexture(imageNamed: "brick2Texture6")
        brick34.size = cementBrickSize
        brick34.position = CGPoint(x: brick33.position.x - (brick33.size.width), y: brick33.position.y)
        brick34.name = "brick34"
        brick34.zPosition = 1
        self.addChild(brick34)
        brick34.physicsBody = SKPhysicsBody(rectangleOf: brick34.size)
        brick34.physicsBody?.isDynamic = false
        brick34.physicsBody?.affectedByGravity = false
        brick34.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick34.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick34.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick35.texture = SKTexture(imageNamed: "brick2Texture6")
        brick35.size = cementBrickSize
        brick35.position = CGPoint(x: brick34.position.x - (brick34.size.width), y: brick34.position.y)
        brick35.name = "brick35"
        brick35.zPosition = 1
        self.addChild(brick35)
        brick35.physicsBody = SKPhysicsBody(rectangleOf: brick35.size)
        brick35.physicsBody?.isDynamic = false
        brick35.physicsBody?.affectedByGravity = false
        brick35.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick35.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick35.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick36.texture = SKTexture(imageNamed: "brick2Texture6")
        brick36.size = cementBrickSize
        brick36.position = CGPoint(x: brick35.position.x + (brick35.size.width / 2), y: brick35.position.y - (brick35.size.height))
        brick36.name = "brick36"
        brick36.zPosition = 1
        self.addChild(brick36)
        brick36.physicsBody = SKPhysicsBody(rectangleOf: brick36.size)
        brick36.physicsBody?.isDynamic = false
        brick36.physicsBody?.affectedByGravity = false
        brick36.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick36.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick36.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick37.texture = SKTexture(imageNamed: "brick2Texture6")
        brick37.size = cementBrickSize
        brick37.position = CGPoint(x: brick36.position.x + (brick36.size.width), y: brick36.position.y)
        brick37.name = "brick37"
        brick37.zPosition = 1
        self.addChild(brick37)
        brick37.physicsBody = SKPhysicsBody(rectangleOf: brick37.size)
        brick37.physicsBody?.isDynamic = false
        brick37.physicsBody?.affectedByGravity = false
        brick37.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick37.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick37.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick38.texture = SKTexture(imageNamed: "brick2Texture6")
        brick38.size = cementBrickSize
        brick38.position = CGPoint(x: brick37.position.x + (brick37.size.width), y: brick37.position.y)
        brick38.name = "brick38"
        brick38.zPosition = 1
        self.addChild(brick38)
        brick38.physicsBody = SKPhysicsBody(rectangleOf: brick38.size)
        brick38.physicsBody?.isDynamic = false
        brick38.physicsBody?.affectedByGravity = false
        brick38.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick38.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick38.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick39.texture = SKTexture(imageNamed: "brick2Texture6")
        brick39.size = cementBrickSize
        brick39.position = CGPoint(x: brick38.position.x + (brick38.size.width), y: brick38.position.y)
        brick39.name = "brick39"
        brick39.zPosition = 1
        self.addChild(brick39)
        brick39.physicsBody = SKPhysicsBody(rectangleOf: brick39.size)
        brick39.physicsBody?.isDynamic = false
        brick39.physicsBody?.affectedByGravity = false
        brick39.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick39.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick39.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick40.texture = SKTexture(imageNamed: "brick2Texture6")
        brick40.size = cementBrickSize
        brick40.position = CGPoint(x: brick39.position.x + (brick39.size.width), y: brick39.position.y)
        brick40.name = "brick40"
        brick40.zPosition = 1
        self.addChild(brick40)
        brick40.physicsBody = SKPhysicsBody(rectangleOf: brick40.size)
        brick40.physicsBody?.isDynamic = false
        brick40.physicsBody?.affectedByGravity = false
        brick40.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick40.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick40.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick41.texture = SKTexture(imageNamed: "brick2Texture6")
        brick41.size = cementBrickSize
        brick41.position = CGPoint(x: brick40.position.x + (brick40.size.width), y: brick40.position.y)
        brick41.name = "brick41"
        brick41.zPosition = 1
        self.addChild(brick41)
        brick41.physicsBody = SKPhysicsBody(rectangleOf: brick41.size)
        brick41.physicsBody?.isDynamic = false
        brick41.physicsBody?.affectedByGravity = false
        brick41.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick41.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick41.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick42.texture = SKTexture(imageNamed: "brick2Texture6")
        brick42.size = cementBrickSize
        brick42.position = CGPoint(x: brick41.position.x - (brick41.size.width / 2), y: brick41.position.y - (brick41.size.width))
        brick42.name = "brick42"
        brick42.zPosition = 1
        self.addChild(brick42)
        brick42.physicsBody = SKPhysicsBody(rectangleOf: brick42.size)
        brick42.physicsBody?.isDynamic = false
        brick42.physicsBody?.affectedByGravity = false
        brick42.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick42.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick42.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick43.texture = SKTexture(imageNamed: "brick2Texture6")
        brick43.size = cementBrickSize
        brick43.position = CGPoint(x: brick42.position.x - (brick42.size.width), y: brick42.position.y)
        brick43.name = "brick43"
        brick43.zPosition = 1
        self.addChild(brick43)
        brick43.physicsBody = SKPhysicsBody(rectangleOf: brick43.size)
        brick43.physicsBody?.isDynamic = false
        brick43.physicsBody?.affectedByGravity = false
        brick43.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick43.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick43.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick44.texture = SKTexture(imageNamed: "brick2Texture6")
        brick44.size = cementBrickSize
        brick44.position = CGPoint(x: brick43.position.x - (brick43.size.width), y: brick43.position.y)
        brick44.name = "brick44"
        brick44.zPosition = 1
        self.addChild(brick44)
        brick44.physicsBody = SKPhysicsBody(rectangleOf: brick44.size)
        brick44.physicsBody?.isDynamic = false
        brick44.physicsBody?.affectedByGravity = false
        brick44.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick44.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick44.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick45.texture = SKTexture(imageNamed: "brick2Texture6")
        brick45.size = cementBrickSize
        brick45.position = CGPoint(x: brick44.position.x - (brick44.size.width), y: brick44.position.y)
        brick45.name = "brick45"
        brick45.zPosition = 1
        self.addChild(brick45)
        brick45.physicsBody = SKPhysicsBody(rectangleOf: brick45.size)
        brick45.physicsBody?.isDynamic = false
        brick45.physicsBody?.affectedByGravity = false
        brick45.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick45.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick45.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick46.texture = SKTexture(imageNamed: "brick2Texture6")
        brick46.size = cementBrickSize
        brick46.position = CGPoint(x: brick45.position.x - (brick45.size.width), y: brick45.position.y)
        brick46.name = "brick46"
        brick46.zPosition = 1
        self.addChild(brick46)
        brick46.physicsBody = SKPhysicsBody(rectangleOf: brick46.size)
        brick46.physicsBody?.isDynamic = false
        brick46.physicsBody?.affectedByGravity = false
        brick46.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick46.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick46.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick47.texture = SKTexture(imageNamed: "brick2Texture6")
        brick47.size = cementBrickSize
        brick47.position = CGPoint(x: brick46.position.x + (brick46.size.width / 2), y: brick46.position.y - (brick46.size.height))
        brick47.name = "brick47"
        brick47.zPosition = 1
        self.addChild(brick47)
        brick47.physicsBody = SKPhysicsBody(rectangleOf: brick47.size)
        brick47.physicsBody?.isDynamic = false
        brick47.physicsBody?.affectedByGravity = false
        brick47.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick47.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick47.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick48.texture = SKTexture(imageNamed: "brick2Texture6")
        brick48.size = cementBrickSize
        brick48.position = CGPoint(x: brick47.position.x + (brick47.size.width), y: brick47.position.y)
        brick48.name = "brick48"
        brick48.zPosition = 1
        self.addChild(brick48)
        brick48.physicsBody = SKPhysicsBody(rectangleOf: brick48.size)
        brick48.physicsBody?.isDynamic = false
        brick48.physicsBody?.affectedByGravity = false
        brick48.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick48.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick48.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick49.texture = SKTexture(imageNamed: "brick2Texture6")
        brick49.size = cementBrickSize
        brick49.position = CGPoint(x: brick48.position.x + (brick48.size.width), y: brick48.position.y)
        brick49.name = "brick49"
        brick49.zPosition = 1
        self.addChild(brick49)
        brick49.physicsBody = SKPhysicsBody(rectangleOf: brick49.size)
        brick49.physicsBody?.isDynamic = false
        brick49.physicsBody?.affectedByGravity = false
        brick49.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick49.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick49.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick50.texture = SKTexture(imageNamed: "brick2Texture6")
        brick50.size = cementBrickSize
        brick50.position = CGPoint(x: brick49.position.x + (brick49.size.width), y: brick49.position.y)
        brick50.name = "brick50"
        brick50.zPosition = 1
        self.addChild(brick50)
        brick50.physicsBody = SKPhysicsBody(rectangleOf: brick50.size)
        brick50.physicsBody?.isDynamic = false
        brick50.physicsBody?.affectedByGravity = false
        brick50.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick50.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick50.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick51.texture = SKTexture(imageNamed: "brick2Texture6")
        brick51.size = cementBrickSize
        brick51.position = CGPoint(x: brick50.position.x - (brick50.size.width / 2), y: brick50.position.y - (brick50.size.height))
        brick51.name = "brick51"
        brick51.zPosition = 1
        self.addChild(brick51)
        brick51.physicsBody = SKPhysicsBody(rectangleOf: brick51.size)
        brick51.physicsBody?.isDynamic = false
        brick51.physicsBody?.affectedByGravity = false
        brick51.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick51.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick51.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick52.texture = SKTexture(imageNamed: "brick2Texture6")
        brick52.size = cementBrickSize
        brick52.position = CGPoint(x: brick51.position.x - (brick51.size.width), y: brick51.position.y)
        brick52.name = "brick52"
        brick52.zPosition = 1
        self.addChild(brick52)
        brick52.physicsBody = SKPhysicsBody(rectangleOf: brick52.size)
        brick52.physicsBody?.isDynamic = false
        brick52.physicsBody?.affectedByGravity = false
        brick52.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick52.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick52.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick53.texture = SKTexture(imageNamed: "brick2Texture6")
        brick53.size = cementBrickSize
        brick53.position = CGPoint(x: brick52.position.x - (brick52.size.width), y: brick52.position.y)
        brick53.name = "brick53"
        brick53.zPosition = 1
        self.addChild(brick53)
        brick53.physicsBody = SKPhysicsBody(rectangleOf: brick53.size)
        brick53.physicsBody?.isDynamic = false
        brick53.physicsBody?.affectedByGravity = false
        brick53.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick53.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick53.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick54.texture = SKTexture(imageNamed: "brick2Texture6")
        brick54.size = cementBrickSize
        brick54.position = CGPoint(x: brick53.position.x + (brick53.size.width / 2), y: brick53.position.y - (brick53.size.height))
        brick54.name = "brick54"
        brick54.zPosition = 1
        self.addChild(brick54)
        brick54.physicsBody = SKPhysicsBody(rectangleOf: brick54.size)
        brick54.physicsBody?.isDynamic = false
        brick54.physicsBody?.affectedByGravity = false
        brick54.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick54.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick54.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick55.texture = SKTexture(imageNamed: "brick2Texture6")
        brick55.size = cementBrickSize
        brick55.position = CGPoint(x: brick54.position.x + (brick54.size.width), y: brick54.position.y)
        brick55.name = "brick55"
        brick55.zPosition = 1
        self.addChild(brick55)
        brick55.physicsBody = SKPhysicsBody(rectangleOf: brick55.size)
        brick55.physicsBody?.isDynamic = false
        brick55.physicsBody?.affectedByGravity = false
        brick55.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick55.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick55.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick56.texture = SKTexture(imageNamed: "brick2Texture6")
        brick56.size = cementBrickSize
        brick56.position = CGPoint(x: brick55.position.x - (brick55.size.width / 2), y: brick55.position.y - (brick55.size.height))
        brick56.name = "brick56"
        brick56.zPosition = 1
        self.addChild(brick56)
        brick56.physicsBody = SKPhysicsBody(rectangleOf: brick56.size)
        brick56.physicsBody?.isDynamic = false
        brick56.physicsBody?.affectedByGravity = false
        brick56.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick56.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick56.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        moveObstacleLeft = SKAction.moveTo(x: 0, duration: 2.5)
        moveObstacleRight = SKAction.moveTo(x: self.frame.width, duration: 2.5)
        firstMoveMiddle = SKAction.moveTo(x: self.frame.width, duration: 1.25)
        firstMoveBottom = SKAction.moveTo(x: self.frame.width, duration: 0.5)
        
        obstacleTop.size = CGSize(width: self.frame.width / 6, height: self.frame.height / 40)
        obstacleTop.position = CGPoint(x: 0 + (obstacleTop.size.width * 0.7), y: brick28.position.y + (brick28.size.height))
        obstacleTop.zPosition = 1
        obstacleTop.color = SKColor.brown
        obstacleTop.name = "obstacleTop"
        self.addChild(obstacleTop)
        obstacleTop.run(moveObstacleRight)
        obstacleTop.physicsBody = SKPhysicsBody(rectangleOf: obstacleTop.size)
        obstacleTop.physicsBody?.affectedByGravity = false
        obstacleTop.physicsBody?.isDynamic = true
        obstacleTop.physicsBody?.allowsRotation = false
        obstacleTop.physicsBody?.categoryBitMask = PhysicsCategory.Obstacle
        obstacleTop.physicsBody?.collisionBitMask = PhysicsCategory.Barrier | PhysicsCategory.Obstacle
        obstacleTop.physicsBody?.contactTestBitMask = PhysicsCategory.Barrier | PhysicsCategory.Obstacle
        
        obstacleMiddle.size = CGSize(width: self.frame.width / 6, height: self.frame.height / 40)
        obstacleMiddle.position = CGPoint(x: self.frame.width / 2, y: brick1.position.y - (brick1.size.height))
        obstacleMiddle.zPosition = 1
        obstacleMiddle.color = SKColor.brown
        obstacleMiddle.name = "obstacleMiddle"
        self.addChild(obstacleMiddle)
        obstacleMiddle.run(firstMoveMiddle)
        obstacleMiddle.physicsBody = SKPhysicsBody(rectangleOf: obstacleMiddle.size)
        obstacleMiddle.physicsBody?.affectedByGravity = false
        obstacleMiddle.physicsBody?.isDynamic = true
        obstacleMiddle.physicsBody?.allowsRotation = false
        obstacleMiddle.physicsBody?.categoryBitMask = PhysicsCategory.Obstacle
        obstacleMiddle.physicsBody?.collisionBitMask = PhysicsCategory.Barrier | PhysicsCategory.Obstacle
        obstacleMiddle.physicsBody?.contactTestBitMask = PhysicsCategory.Barrier | PhysicsCategory.Obstacle
        
        obstacleBottom.size = CGSize(width: self.frame.width / 6, height: self.frame.height / 40)
        obstacleBottom.position = CGPoint(x: self.frame.width - (obstacleBottom.size.width * 0.7), y: brick56.position.y - (brick56.size.height))
        obstacleBottom.zPosition = 1
        obstacleBottom.color = SKColor.brown
        obstacleBottom.name = "obstacleBottom"
        self.addChild(obstacleBottom)
        obstacleBottom.run(firstMoveBottom)
        obstacleBottom.physicsBody = SKPhysicsBody(rectangleOf: obstacleBottom.size)
        obstacleBottom.physicsBody?.affectedByGravity = false
        obstacleBottom.physicsBody?.isDynamic = true
        obstacleBottom.physicsBody?.allowsRotation = false
        obstacleBottom.physicsBody?.categoryBitMask = PhysicsCategory.Obstacle
        obstacleBottom.physicsBody?.collisionBitMask = PhysicsCategory.Barrier | PhysicsCategory.Obstacle
        obstacleBottom.physicsBody?.contactTestBitMask = PhysicsCategory.Barrier | PhysicsCategory.Obstacle
        
        pauseBtn.size = CGSize(width: self.frame.width / 10, height: self.frame.width / 10)
        pauseBtn.position = CGPoint(x: self.frame.width - (pauseBtn.size.width), y: self.frame.height - (pauseBtn.size.height))
        pauseBtn.zPosition = 3
        pauseBtn.name = "pauseBtn"
        self.addChild(pauseBtn)
        
        if view.frame.width == 768 && view.frame.height == 1024 || view.frame.width == 834 && view.frame.height == 1112 || view.frame.width == 1024 && view.frame.height == 1366 {
            continueBtn.size = CGSize(width: self.frame.width / 7.2, height: self.frame.width / 7.2)
            retryBtn.size = CGSize(width: self.frame.width / 7.2, height: self.frame.width / 7.2)
            mainMenuBtn.size = CGSize(width: self.frame.width / 7.2, height: self.frame.width / 7.2)
            nextBtn.size = CGSize(width: self.frame.width / 7.2, height: self.frame.width / 7.2)
        } else {
            continueBtn.size = CGSize(width: self.frame.width / 5, height: self.frame.width / 5)
            retryBtn.size = CGSize(width: self.frame.width / 5, height: self.frame.width / 5)
            mainMenuBtn.size = CGSize(width: self.frame.width / 5, height: self.frame.width / 5)
            nextBtn.size = CGSize(width: self.frame.width / 5, height: self.frame.width / 5)
        }
        
        continueBtn.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.3)
        continueBtn.name = "continueBtn"
        continueBtn.zPosition = 3
        continueBtn.alpha = 0
        self.addChild(continueBtn)
        
        retryBtn.position = CGPoint(x: self.frame.width / 2, y: continueBtn.position.y - (continueBtn.size.height * 1.5))
        retryBtn.name = "retryBtn"
        retryBtn.zPosition = 3
        retryBtn.alpha = 0
        self.addChild(retryBtn)
        
        mainMenuBtn.position = CGPoint(x: self.frame.width / 2, y: retryBtn.position.y - (retryBtn.size.height * 1.5))
        mainMenuBtn.name = "mainMenuBtn"
        mainMenuBtn.zPosition = 3
        mainMenuBtn.alpha = 0
        self.addChild(mainMenuBtn)
        
        nextBtn.position = CGPoint(x: self.frame.width / 2, y: mainMenuBtn.position.y - (mainMenuBtn.size.height * 1.5))
        nextBtn.name = "nextBtn"
        nextBtn.zPosition = 3
        nextBtn.alpha = 0
        self.addChild(nextBtn)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if(contact.bodyA.node != nil && contact.bodyB.node != nil) {
            let firstBody = contact.bodyA.node as! SKSpriteNode
            let secondBody = contact.bodyB.node as! SKSpriteNode
            
            if (firstBody.name == "rocket") && (secondBody.name == "iPhoneXBottomBarrier") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "iPhoneXBottomBarrier") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "obstacleTop") && (secondBody.name == "leftBarrier") {
                movingObstacleHitSensor(Obstacle: firstBody, Sensor: secondBody)
            } else if (firstBody.name == "leftBarrier") && (secondBody.name == "obstacleTop") {
                movingObstacleHitSensor(Obstacle: secondBody, Sensor: firstBody)
            }
            if (firstBody.name == "obstacleTop") && (secondBody.name == "rightBarrier") {
                movingObstacleHitSensor(Obstacle: firstBody, Sensor: secondBody)
            } else if (firstBody.name == "rightBarrier") && (secondBody.name == "obstacleTop") {
                movingObstacleHitSensor(Obstacle: secondBody, Sensor: firstBody)
            }
            if (firstBody.name == "obstacleMiddle") && (secondBody.name == "leftBarrier") {
                movingObstacleHitSensor(Obstacle: firstBody, Sensor: secondBody)
            } else if (firstBody.name == "leftBarrier") && (secondBody.name == "obstacleMiddle") {
                movingObstacleHitSensor(Obstacle: secondBody, Sensor: firstBody)
            }
            if (firstBody.name == "obstacleMiddle") && (secondBody.name == "rightBarrier") {
                movingObstacleHitSensor(Obstacle: firstBody, Sensor: secondBody)
            } else if (firstBody.name == "rightBarrier") && (secondBody.name == "obstacleMiddle") {
                movingObstacleHitSensor(Obstacle: secondBody, Sensor: firstBody)
            }
            if (firstBody.name == "obstacleBottom") && (secondBody.name == "leftBarrier") {
                movingObstacleHitSensor(Obstacle: firstBody, Sensor: secondBody)
            } else if (firstBody.name == "leftBarrier") && (secondBody.name == "obstacleBottom") {
                movingObstacleHitSensor(Obstacle: secondBody, Sensor: firstBody)
            }
            if (firstBody.name == "obstacleBottom") && (secondBody.name == "rightBarrier") {
                movingObstacleHitSensor(Obstacle: firstBody, Sensor: secondBody)
            } else if (firstBody.name == "rightBarrier") && (secondBody.name == "obstacleBottom") {
                movingObstacleHitSensor(Obstacle: secondBody, Sensor: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick1") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick1") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick2") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick2") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick3") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick3") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick4") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick4") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick5") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick5") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick6") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick6") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick7") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick7") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick8") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick8") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick9") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick9") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick10") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick10") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick11") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick11") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick12") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick12") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick13") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick13") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick14") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick14") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick15") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick15") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick16") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick16") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick17") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick17") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick18") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick18") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick19") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick19") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick20") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick20") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick21") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick21") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick22") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick22") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick23") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick23") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick24") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick24") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick25") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick25") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick26") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick26") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick27") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick27") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick28") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick28") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick29") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick29") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick30") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick30") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick31") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick31") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick32") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick32") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick33") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick33") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick34") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick34") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick35") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick35") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick36") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick36") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick37") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick37") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick38") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick38") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick39") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick39") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick40") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick40") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick41") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick41") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick42") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick42") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick43") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick43") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick44") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick44") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick45") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick45") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick46") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick46") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick47") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick47") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick48") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick48") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick49") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick49") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick50") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick50") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick51") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick51") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick52") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick52") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick53") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick53") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick54") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick54") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick55") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick55") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "brick56") {
                ballHitBrick(Ball: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick56") && (secondBody.name == "ball") {
                ballHitBrick(Ball: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "bottomBarrier") {
                ballHitBottomBarrier(Ball: firstBody, BottomBarrier: secondBody)
            } else if (firstBody.name == "bottomBarrier") && (secondBody.name == "ball") {
                ballHitBottomBarrier(Ball: secondBody, BottomBarrier: firstBody)
            }
            if (firstBody.name == "coinPowerUp") && (secondBody.name == "paddle") {
                powerUpHitPaddle(PowerUp: firstBody, Paddle: secondBody)
            } else if (firstBody.name == "paddle") && (secondBody.name == "coinPowerUp") {
                powerUpHitPaddle(PowerUp: secondBody, Paddle: firstBody)
            }
            if (firstBody.name == "coinPowerUp") && (secondBody.name == "bottomBarrier") {
                powerUpHitBottomBarrier(PowerUp: firstBody, BottomBarrier: secondBody)
            } else if (firstBody.name == "bottomBarrier") && (secondBody.name == "coinPowerUp") {
                powerUpHitBottomBarrier(PowerUp: secondBody, BottomBarrier: firstBody)
            }
            if (firstBody.name == "paddleGrowPowerUp") && (secondBody.name == "paddle") {
                powerUpHitPaddle(PowerUp: firstBody, Paddle: secondBody)
            } else if (firstBody.name == "paddle") && (secondBody.name == "paddleGrowPowerUp") {
                powerUpHitPaddle(PowerUp: secondBody, Paddle: firstBody)
            }
            if (firstBody.name == "paddleGrowPowerUp") && (secondBody.name == "bottomBarrier") {
                powerUpHitBottomBarrier(PowerUp: firstBody, BottomBarrier: secondBody)
            } else if (firstBody.name == "bottomBarrier") && (secondBody.name == "paddleGrowPowerUp") {
                powerUpHitBottomBarrier(PowerUp: secondBody, BottomBarrier: firstBody)
            }
            if (firstBody.name == "paddleShrinkPowerUp") && (secondBody.name == "paddle") {
                powerUpHitPaddle(PowerUp: firstBody, Paddle: secondBody)
            } else if (firstBody.name == "paddle") && (secondBody.name == "paddleShrinkPowerUp") {
                powerUpHitPaddle(PowerUp: secondBody, Paddle: firstBody)
            }
            if (firstBody.name == "paddleShrinkPowerUp") && (secondBody.name == "bottomBarrier") {
                powerUpHitBottomBarrier(PowerUp: firstBody, BottomBarrier: secondBody)
            } else if (firstBody.name == "bottomBarrier") && (secondBody.name == "paddleShrinkPowerUp") {
                powerUpHitBottomBarrier(PowerUp: secondBody, BottomBarrier: firstBody)
            }
            if (firstBody.name == "rocketShotPowerUp") && (secondBody.name == "paddle") {
                powerUpHitPaddle(PowerUp: firstBody, Paddle: secondBody)
            } else if (firstBody.name == "paddle") && (secondBody.name == "rocketShotPowerUp") {
                powerUpHitPaddle(PowerUp: secondBody, Paddle: firstBody)
            }
            if (firstBody.name == "rocketShotPowerUp") && (secondBody.name == "bottomBarrier") {
                powerUpHitBottomBarrier(PowerUp: firstBody, BottomBarrier: secondBody)
            } else if (firstBody.name == "bottomBarrier") && (secondBody.name == "rocketShotPowerUp") {
                powerUpHitBottomBarrier(PowerUp: secondBody, BottomBarrier: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "obstacleTop") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "obstacleTop") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "obstacleMiddle") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "obstacleMiddle") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "obstacleBottom") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "obstacleBottom") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "topBarrier") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "topBarrier") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick1") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick1") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick2") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick2") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick3") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick3") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick4") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick4") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick5") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick5") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick6") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick6") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick7") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick7") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick8") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick8") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick9") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick9") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick10") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick10") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick11") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick11") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick12") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick12") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick13") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick13") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick14") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick14") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick15") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick15") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick16") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick16") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick17") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick17") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "leftBarrier") {
                checkBallVelocity(Ball: firstBody, Barrier: secondBody)
            } else if (firstBody.name == "leftBarrier") && (secondBody.name == "ball") {
                checkBallVelocity(Ball: secondBody, Barrier: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "rightBarrier") {
                checkBallVelocity(Ball: firstBody, Barrier: secondBody)
            } else if (firstBody.name == "rightBarrier") && (secondBody.name == "ball") {
                checkBallVelocity(Ball: secondBody, Barrier: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "topBarrier") {
                checkBallVelocity(Ball: firstBody, Barrier: secondBody)
            } else if (firstBody.name == "topBarrier") && (secondBody.name == "ball") {
                checkBallVelocity(Ball: secondBody, Barrier: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "iPhoneXBottomBarrier") {
                checkBallVelocity(Ball: firstBody, Barrier: secondBody)
            } else if (firstBody.name == "iPhoneXBottomBarrier") && (secondBody.name == "ball") {
                checkBallVelocity(Ball: secondBody, Barrier: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick18") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick18") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick19") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick19") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick20") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick20") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick21") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick21") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick22") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick22") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick23") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick23") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick24") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick24") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick25") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick25") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick26") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick26") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick27") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick27") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick28") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick28") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick29") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick29") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick30") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick30") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick31") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick31") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick32") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick32") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick33") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick33") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick34") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick34") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick35") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick35") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick36") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick36") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick37") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick37") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick38") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick38") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick39") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick39") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick40") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick40") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick41") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick41") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick42") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick42") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick43") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick43") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick44") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick44") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick45") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick45") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick46") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick46") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick47") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick47") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick48") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick48") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick49") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick49") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick50") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick50") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick51") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick51") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick52") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick52") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick53") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick53") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick54") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick54") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick55") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick55") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "brick56") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "brick56") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "ball") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "ball") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "deathPowerUp") && (secondBody.name == "paddle") {
                powerUpHitPaddle(PowerUp: firstBody, Paddle: secondBody)
            } else if (firstBody.name == "paddle") && (secondBody.name == "deathPowerUp") {
                powerUpHitPaddle(PowerUp: secondBody, Paddle: firstBody)
            }
            if (firstBody.name == "deathPower") && (secondBody.name == "bottomBarrier") {
                powerUpHitBottomBarrier(PowerUp: firstBody, BottomBarrier: secondBody)
            } else if (firstBody.name == "bottomBarrier") && (secondBody.name == "deathPowerUp") {
                powerUpHitBottomBarrier(PowerUp: secondBody, BottomBarrier: firstBody)
            }
            if (firstBody.name == "invincibleBallPowerUp") && (secondBody.name == "paddle") {
                powerUpHitPaddle(PowerUp: firstBody, Paddle: secondBody)
            } else if (firstBody.name == "paddle") && (secondBody.name == "invincibleBallPowerUp") {
                powerUpHitPaddle(PowerUp: secondBody, Paddle: firstBody)
            }
            if (firstBody.name == "invincibleBallPowerUp") && (secondBody.name == "bottomBarrier") {
                powerUpHitBottomBarrier(PowerUp: firstBody, BottomBarrier: secondBody)
            } else if (firstBody.name == "bottomBarrier") && (secondBody.name == "invincibleBallPowerUp") {
                powerUpHitBottomBarrier(PowerUp: secondBody, BottomBarrier: firstBody)
            }
            if (firstBody.name == "triBallPowerUp") && (secondBody.name == "paddle") {
                powerUpHitPaddle(PowerUp: firstBody, Paddle: secondBody)
            } else if (firstBody.name == "paddle") && (secondBody.name == "triBallPowerUp") {
                powerUpHitPaddle(PowerUp: secondBody, Paddle: firstBody)
            }
            if (firstBody.name == "triBallPowerUp") && (secondBody.name == "bottomBarrier") {
                powerUpHitBottomBarrier(PowerUp: firstBody, BottomBarrier: secondBody)
            } else if (firstBody.name == "bottomBarrier") && (secondBody.name == "triBallPowerUp") {
                powerUpHitBottomBarrier(PowerUp: secondBody, BottomBarrier: firstBody)
            }
            if (firstBody.name == "x2ScorePowerUp") && (secondBody.name == "bottomBarrier") {
                powerUpHitBottomBarrier(PowerUp: firstBody, BottomBarrier: secondBody)
            } else if (firstBody.name == "bottomBarrier") && (secondBody.name == "x2ScorePowerUp") {
                powerUpHitBottomBarrier(PowerUp: secondBody, BottomBarrier: firstBody)
            }
            if (firstBody.name == "x2ScorePowerUp") && (secondBody.name == "paddle") {
                powerUpHitPaddle(PowerUp: firstBody, Paddle: secondBody)
            } else if (firstBody.name == "paddle") && (secondBody.name == "x2ScorePowerUp") {
                powerUpHitPaddle(PowerUp: secondBody, Paddle: firstBody)
            }
            if (firstBody.name == "plus100ScorePowerUp") && (secondBody.name == "bottomBarrier") {
                powerUpHitBottomBarrier(PowerUp: firstBody, BottomBarrier: secondBody)
            } else if (firstBody.name == "bottomBarrier") && (secondBody.name == "plus100ScorePowerUp") {
                powerUpHitBottomBarrier(PowerUp: secondBody, BottomBarrier: firstBody)
            }
            if (firstBody.name == "plus100ScorePowerUp") && (secondBody.name == "paddle") {
                powerUpHitPaddle(PowerUp: firstBody, Paddle: secondBody)
            } else if (firstBody.name == "paddle") && (secondBody.name == "plus100ScorePowerUp") {
                powerUpHitPaddle(PowerUp: secondBody, Paddle: firstBody)
            }
            if (firstBody.name == "miniBallPowerUp") && (secondBody.name == "bottomBarrier") {
                powerUpHitBottomBarrier(PowerUp: firstBody, BottomBarrier: secondBody)
            } else if (firstBody.name == "bottomBarrier") && (secondBody.name == "miniBallPowerUp") {
                powerUpHitBottomBarrier(PowerUp: secondBody, BottomBarrier: firstBody)
            }
            if (firstBody.name == "miniBallPowerUp") && (secondBody.name == "paddle") {
                powerUpHitPaddle(PowerUp: firstBody, Paddle: secondBody)
            } else if (firstBody.name == "paddle") && (secondBody.name == "miniBallPowerUp") {
                powerUpHitPaddle(PowerUp: secondBody, Paddle: firstBody)
            }
            if (firstBody.name == "giantBallPowerUp") && (secondBody.name == "bottomBarrier") {
                powerUpHitBottomBarrier(PowerUp: firstBody, BottomBarrier: secondBody)
            } else if (firstBody.name == "bottomBarrier") && (secondBody.name == "giantBallPowerUp") {
                powerUpHitBottomBarrier(PowerUp: secondBody, BottomBarrier: firstBody)
            }
            if (firstBody.name == "giantBallPowerUp") && (secondBody.name == "paddle") {
                powerUpHitPaddle(PowerUp: firstBody, Paddle: secondBody)
            } else if (firstBody.name == "paddle") && (secondBody.name == "giantBallPowerUp") {
                powerUpHitPaddle(PowerUp: secondBody, Paddle: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick1") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick1") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick2") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick2") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick3") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick3") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick4") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick4") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick5") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick5") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick6") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick6") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick7") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick7") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick8") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick8") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick9") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick9") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick10") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick10") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick11") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick11") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick12") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick12") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick13") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick13") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick14") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick14") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick15") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick15") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick16") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick16") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick17") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick17") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick18") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick18") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick19") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick19") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick20") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick20") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick21") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick21") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick22") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick22") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick23") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick23") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick24") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick24") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick25") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick25") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick26") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick26") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick27") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick27") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick28") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick28") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "ball29") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "ball29") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "ball30") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "ball30") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick31") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick31") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick32") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick32") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick33") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick33") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick34") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick34") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick35") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick35") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick36") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick36") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick37") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick37") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick38") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick38") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick39") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick39") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick40") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick40") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick41") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick41") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick42") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick42") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick43") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick43") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick44") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick44") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick45") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick45") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick46") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick46") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick47") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick47") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick48") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick48") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick49") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick49") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick50") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick50") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick51") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick51") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick52") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick52") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick53") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick53") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick54") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick54") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick55") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick55") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "rocketExplosionRadius") && (secondBody.name == "brick56") {
                explosionRadiusHitBrick(Radius: firstBody, Brick: secondBody)
            } else if (firstBody.name == "brick56") && (secondBody.name == "rocketExplosionRadius") {
                explosionRadiusHitBrick(Radius: secondBody, Brick: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "obstacleTop") {
                checkBallVelocity(Ball: firstBody, Barrier: secondBody)
            } else if (firstBody.name == "obstacleTop") && (secondBody.name == "ball") {
                checkBallVelocity(Ball: secondBody, Barrier: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "obstacleMiddle") {
                checkBallVelocity(Ball: firstBody, Barrier: secondBody)
            } else if (firstBody.name == "obstacleMiddle") && (secondBody.name == "ball") {
                checkBallVelocity(Ball: secondBody, Barrier: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "obstacleBottom") {
                checkBallVelocity(Ball: firstBody, Barrier: secondBody)
            } else if (firstBody.name == "obstacleBottom") && (secondBody.name == "ball") {
                checkBallVelocity(Ball: secondBody, Barrier: firstBody)
            }
            
        }
    }
    
    func movingObstacleHitSensor(Obstacle: SKSpriteNode, Sensor: SKSpriteNode) {
        if Obstacle.name == "obstacleTop" && Sensor.name == "leftBarrier" {
            obstacleTop.run(moveObstacleRight)
        }
        if Obstacle.name == "obstacleTop" && Sensor.name == "rightBarrier" {
            obstacleTop.run(moveObstacleLeft)
        }
        if Obstacle.name == "obstacleMiddle" && Sensor.name == "leftBarrier" {
            obstacleMiddle.run(moveObstacleRight)
        }
        if Obstacle.name == "obstacleMiddle" && Sensor.name == "rightBarrier" {
            obstacleMiddle.run(moveObstacleLeft)
        }
        if Obstacle.name == "obstacleBottom" && Sensor.name == "leftBarrier" {
            obstacleBottom.run(moveObstacleRight)
        }
        if Obstacle.name == "obstacleBottom" && Sensor.name == "rightBarrier" {
            obstacleBottom.run(moveObstacleLeft)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if gameStarted == false && touchedNode.name != "pauseBtn" {
                var vector = CGVector()
                
                var dx = CGFloat(location.x - self.frame.width / 2)
                var dy = CGFloat(location.y - paddle.position.y + (paddle.size.height / 1.1))
                
                let magnitude = sqrt(dx * dx + dy * dy)
                
                dx /= magnitude
                dy /= magnitude
                
                if view?.frame.width == 768 && view?.frame.height == 1024 {
                    vector = CGVector(dx: ((view?.frame.width)! / 21) * dx, dy: ((view?.frame.width)! / 21) * dy)
                    // Optional((-1.69431173801422, 671.981262207031))
                    // iPad (5th gen) through pro (9.7 Inch)
                } else if view?.frame.width == 834 && view?.frame.height == 1112 {
                    vector = CGVector(dx: ((view?.frame.width)! / 17) * dx, dy: ((view?.frame.width)! / 17) * dy)
                    // Optional((0.0, 671.755004882812))
                    // iPad pro (10.5 Inch)
                } else if view?.frame.width == 1024 && view?.frame.height == 1366 {
                    vector = CGVector(dx: ((view?.frame.width)! / 9.2) * dx, dy: ((view?.frame.width)! / 9.2) * dy)
                    // Optional((1.39736270904541, 671.98193359375))
                    // iPad pro (12.9 Inch)
                } else if view?.frame.width == 320 && view?.frame.height == 568 {
                    vector = CGVector(dx: ((view?.frame.width)! / 80) * dx, dy: ((view?.frame.width)! / 80) * dy)
                    // Optional((1.63292384147644, 489.585235595703))
                    // iPhone 5s and SE
                } else if view?.frame.width == 375 && view?.frame.height == 667 {
                    vector = CGVector(dx: ((view?.frame.width)! / 60) * dx, dy: ((view?.frame.width)! / 60) * dy)
                    // Optional((2.07877373695374, 489.446929931641))
                    // iPhone 6,7,8
                } else if view?.frame.width == 414 && view?.frame.height ==  736 {
                    vector = CGVector(dx: ((view?.frame.width)! / 56) * dx, dy: ((view?.frame.width)! / 56) * dy)
                    // Optional((1.9209446691093e-05, 489.418579101562))
                    // iPhone 6 plus, 7 plus, 8 plus
                } else if view?.frame.width == 375 && view?.frame.height == 812 {
                    vector = CGVector(dx: ((view?.frame.width)! / 58) * dx, dy: ((view?.frame.width)! / 58) * dy)
                    // Optional((-2.84653806686401, -489.443054199219))
                    // iPhone X
                }
                
                ball1.physicsBody?.applyImpulse(vector)
                
                gameStarted = true
                
            } else if gameStarted == true && gameOver == true {
                
            } else if gameStarted == true && gameOver == false && touchedNode.name != "pauseBtn" && touchedNode.name != "continueBtn" && touchedNode.name != "retryBtn" && touchedNode.name != "mainMenuBtn" && touchedNode.name != "nextBtn" {
                paddle.run(SKAction.moveTo(x: location.x, duration: 0.15))
            } else {
                
            }
            
            if touchedNode.name == "pauseBtn" && gameOver == false {
                continueBtn.run(fadeIn)
                retryBtn.run(fadeIn)
                mainMenuBtn.run(fadeIn)
                if ch3lvl23Unlocked == true {
                    nextBtn.run(fadeIn)
                }
                self.pauseBtn.run(fadeOut, completion: {
                    self.isPaused = true
                })
            }
            if touchedNode.name == "continueBtn" {
                self.isPaused = false
                pauseBtn.run(fadeIn)
                retryBtn.run(fadeOut)
                mainMenuBtn.run(fadeOut)
                nextBtn.run(fadeOut)
                continueBtn.run(fadeOut)
            }
            if touchedNode.name ==  "retryBtn" {
                let scene = ch3lvl22Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            }
            if touchedNode.name == "nextBtn" {
                let scene = ch3lvl23Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            }
            if touchedNode.name == "mainMenuBtn" {
                let scene = TitleScene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            }
            
        }
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        for touch in touches {
            let location = touch.location(in: self)
            
            if gameStarted == true && gameOver == false && touchedNode.name != "continueBtn" && touchedNode.name != "pauseBtn" && touchedNode.name != "retryBtn" && touchedNode.name != "mainMenuBtn" && touchedNode.name != "nextBtn"{
                paddle.run(SKAction.moveTo(x: location.x, duration: 0.05))
            }
            
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    func ballHitBrick(Ball: SKSpriteNode, Brick: SKSpriteNode) {
        let explosionWait = SKAction.wait(forDuration: 0.6)
        let brickExplosion = SKEmitterNode()
        let brickParticleTexture = SKTexture(imageNamed: "brick2ExplosionParticle")
        
        brickExplosion.particleTexture = brickParticleTexture
        brickExplosion.particleSize = CGSize(width: self.frame.width / 20, height: self.frame.height / 26)
        brickExplosion.physicsBody = SKPhysicsBody(circleOfRadius: brickExplosion.particleSize.width)
        brickExplosion.physicsBody?.affectedByGravity = true
        brickExplosion.physicsBody?.categoryBitMask = PhysicsCategory.ExplosionParticles
        brickExplosion.physicsBody?.contactTestBitMask = 0
        brickExplosion.physicsBody?.collisionBitMask = 0
        brickExplosion.particleBirthRate = 100
        brickExplosion.particleAlpha = 1
        brickExplosion.particleLifetime = 0.5
        brickExplosion.particleAlpha = 1
        brickExplosion.emissionAngle = 360
        brickExplosion.emissionAngleRange = 25
        brickExplosion.particleSpeed = 75
        brickExplosion.particleSpeedRange = 50
        brickExplosion.alpha = 1
        brickExplosion.particleScale = 0.5
        brickExplosion.zPosition = 3
        brickExplosion.particleLifetimeRange = 0
        brickExplosion.particlePositionRange = CGVector(dx: 0, dy: 0)
        brickExplosion.zPosition = 5
        
        let powerUp = PowerUpNode()
        
        if x2Active == false {
            score += 10
            scoreLbl.text = "\(score)"
        } else if x2Active == true {
            score += 20
            scoreLbl.text = "\(score)"
        }
        
        if powerUp.name == "coinPowerUp" {
            powerUp.texture = SKTexture(imageNamed: "brickzCoin")
            powerUp.size = CGSize(width: self.frame.width / 11, height: self.frame.width / 11)
            powerUp.physicsBody = SKPhysicsBody(circleOfRadius: powerUp.size.width / 2)
        } else if powerUp.name == "paddleGrowPowerUp" {
            if paddleGrowActive == true {
                
            } else {
                powerUp.texture = SKTexture(imageNamed: "paddleGrowImg")
                powerUp.size = CGSize(width: self.frame.width / 9, height: self.frame.width / 9)
                powerUp.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: powerUp.size.width, height: powerUp.size.height))
            }
        } else if powerUp.name == "paddleShrinkPowerUp" {
            if paddleShrinkActive == true {
                
            } else {
                powerUp.texture = SKTexture(imageNamed: "paddleShrinkImg")
                powerUp.size = CGSize(width: self.frame.width / 9, height: self.frame.width / 9)
                powerUp.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: powerUp.size.width, height: powerUp.size.height))
            }
        } else if powerUp.name == "rocketShotPowerUp" {
            powerUp.texture = SKTexture(imageNamed: "rocketPowerUpImg")
            powerUp.size = CGSize(width: self.frame.width / 16, height: self.frame.width / 8.5)
            powerUp.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: powerUp.size.width, height: powerUp.size.height))
        } else if powerUp.name == "deathPowerUp" {
            powerUp.texture = SKTexture(imageNamed: "GGPowerUp")
            powerUp.size = CGSize(width: self.frame.width / 10.5, height: self.frame.width / 10.5)
            powerUp.physicsBody = SKPhysicsBody(circleOfRadius: powerUp.size.width / 2)
        } else if powerUp.name == "invincibleBallPowerUp" {
            powerUp.texture = SKTexture(imageNamed: "invincibleBallPU")
            powerUp.size = CGSize(width: self.frame.width / 12, height: self.frame.width / 12)
            powerUp.physicsBody = SKPhysicsBody(circleOfRadius: powerUp.size.width / 2)
        } else if powerUp.name == "triBallPowerUp" {
            if triBallCollected == false && triBallDropped == false {
                triBallDropped = true
                powerUp.texture = SKTexture(imageNamed: "TriBallPU")
                powerUp.size = CGSize(width: self.frame.width / 10.5, height: self.frame.width / 10.5)
                powerUp.physicsBody = SKPhysicsBody(circleOfRadius: powerUp.size.width / 2)
            } else {
                
            }
        } else if powerUp.name == "x2ScorePowerUp" {
            powerUp.texture = SKTexture(imageNamed: "x2ScorePU")
            powerUp.size = CGSize(width: self.frame.width / 11, height: self.frame.width / 11)
            powerUp.physicsBody = SKPhysicsBody(circleOfRadius: powerUp.size.width / 2)
        } else if powerUp.name == "plus100ScorePowerUp" {
            powerUp.texture = SKTexture(imageNamed: "plus100ScorePU")
            powerUp.size = CGSize(width: self.frame.width / 10, height: self.frame.width / 11)
            powerUp.physicsBody = SKPhysicsBody(circleOfRadius: powerUp.size.width / 2)
        } else if powerUp.name == "miniBallPowerUp" {
            powerUp.texture = SKTexture(imageNamed: "miniBallPU")
            powerUp.size = CGSize(width: self.frame.width / 9, height: self.frame.width / 9)
            powerUp.physicsBody = SKPhysicsBody(circleOfRadius: powerUp.size.width / 2)
        } else if powerUp.name == "giantBallPowerUp" {
            powerUp.texture = SKTexture(imageNamed: "giantBallPU")
            powerUp.size = CGSize(width: self.frame.width / 9, height: self.frame.width / 9)
            powerUp.physicsBody = SKPhysicsBody(circleOfRadius: powerUp.size.width / 2)
        }
        
        scene?.physicsWorld.gravity = CGVector(dx: 0, dy: -1.5)
        powerUp.zPosition = 1
        powerUp.physicsBody?.affectedByGravity = true
        powerUp.physicsBody?.isDynamic = true
        powerUp.physicsBody?.categoryBitMask = PhysicsCategory.PowerUp
        powerUp.physicsBody?.contactTestBitMask = PhysicsCategory.Paddle | PhysicsCategory.Barrier
        powerUp.physicsBody?.collisionBitMask = PhysicsCategory.Paddle | PhysicsCategory.Barrier
        
        if Brick.name == "brick1" {
            if brickCount > 1 {
                powerUp.position = brick1.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[0] == 6 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[0] == 5 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[0] == 4 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[0] == 3 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[0] == 2 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[0] == 1 {
                brickLives[0] -= 1
                brickCount -= 1
                brick1.removeFromParent()
                brickExplosion.position = brick1.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick2" {
            if brickCount > 1 {
                powerUp.position = brick2.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
                
            }
            
            if brickLives[1] == 6 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[1] == 5 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[1] == 4 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[1] == 3 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[1] == 2 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[1] == 1 {
                brickLives[1] -= 1
                brickCount -= 1
                brick2.removeFromParent()
                brickExplosion.position = brick2.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick3" {
            if brickCount > 1 {
                powerUp.position = brick3.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
                
            }
            
            if brickLives[2] == 6 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[2] == 5 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[2] == 4 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[2] == 3 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[2] == 2 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[2] == 1 {
                brickLives[2] -= 1
                brickCount -= 1
                brick3.removeFromParent()
                brickExplosion.position = brick3.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick4" {
            if brickCount > 1 {
                powerUp.position = brick4.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[3] == 6 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[3] == 5 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[3] == 4 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[3] == 3 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[3] == 2 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[3] == 1 {
                brickLives[3] -= 1
                brickCount -= 1
                brick4.removeFromParent()
                brickExplosion.position = brick4.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick5" {
            if brickCount > 1 {
                powerUp.position = brick5.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[4] == 6 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[4] == 5 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[4] == 4 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[4] == 3 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[4] == 2 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[4] == 1 {
                brickLives[4] -= 1
                brickCount -= 1
                brick5.removeFromParent()
                brickExplosion.position = brick5.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick6" {
            if brickCount > 1 {
                powerUp.position = brick6.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[5] == 6 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[5] == 5 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[5] == 4 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[5] == 3 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[5] == 2 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[5] == 1 {
                brickLives[5] -= 1
                brickCount -= 1
                brick6.removeFromParent()
                brickExplosion.position = brick6.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick7" {
            if brickCount > 1 {
                powerUp.position = brick7.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[6] == 6 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[6] == 5 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[6] == 4 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[6] == 3 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[6] == 2 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[6] == 1 {
                brickLives[6] -= 1
                brickCount -= 1
                brick7.removeFromParent()
                brickExplosion.position = brick7.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick8" {
            if brickCount > 1 {
                powerUp.position = brick8.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[7] == 6 {
                brickLives[7] -= 1
                brick8.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[7] == 5 {
                brickLives[7] -= 1
                brick8.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[7] == 4 {
                brickLives[7] -= 1
                brick8.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[7] == 3 {
                brickLives[7] -= 1
                brick8.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[7] == 2 {
                brickLives[7] -= 1
                brick8.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[7] == 1 {
                brickLives[7] -= 1
                brickCount -= 1
                brick8.removeFromParent()
                brickExplosion.position = brick8.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick9" {
            if brickCount > 1 {
                powerUp.position = brick9.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[8] == 6 {
                brickLives[8] -= 1
                brick9.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[8] == 5 {
                brickLives[8] -= 1
                brick9.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[8] == 4 {
                brickLives[8] -= 1
                brick9.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[8] == 3 {
                brickLives[8] -= 1
                brick9.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[8] == 2 {
                brickLives[8] -= 1
                brick9.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[8] == 1 {
                brickLives[8] -= 1
                brickCount -= 1
                brick9.removeFromParent()
                brickExplosion.position = brick9.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick10" {
            if brickCount > 1 {
                powerUp.position = brick10.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[9] == 6 {
                brickLives[9] -= 1
                brick10.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[9] == 5 {
                brickLives[9] -= 1
                brick10.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[9] == 4 {
                brickLives[9] -= 1
                brick10.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[9] == 3 {
                brickLives[9] -= 1
                brick10.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[9] == 2 {
                brickLives[9] -= 1
                brick10.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[9] == 1 {
                brickLives[9] -= 1
                brickCount -= 1
                brick10.removeFromParent()
                brickExplosion.position = brick10.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick11" {
            if brickCount > 1 {
                powerUp.position = brick11.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[10] == 6 {
                brickLives[10] -= 1
                brick11.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[10] == 5 {
                brickLives[10] -= 1
                brick11.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[10] == 4 {
                brickLives[10] -= 1
                brick11.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[10] == 3 {
                brickLives[10] -= 1
                brick11.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[10] == 2 {
                brickLives[10] -= 1
                brick11.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[10] == 1 {
                brickLives[10] -= 1
                brickCount -= 1
                brick11.removeFromParent()
                brickExplosion.position = brick11.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick12" {
            if brickCount > 1 {
                powerUp.position = brick12.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[11] == 6 {
                brickLives[11] -= 1
                brick12.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[11] == 5 {
                brickLives[11] -= 1
                brick12.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[11] == 4 {
                brickLives[11] -= 1
                brick12.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[11] == 3 {
                brickLives[11] -= 1
                brick12.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[11] == 2 {
                brickLives[11] -= 1
                brick12.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[11] == 1 {
                brickLives[11] -= 1
                brickCount -= 1
                brick12.removeFromParent()
                brickExplosion.position = brick12.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick13" {
            if brickCount > 1 {
                powerUp.position = brick13.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[12] == 6 {
                brickLives[12] -= 1
                brick13.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[12] == 5 {
                brickLives[12] -= 1
                brick13.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[12] == 4 {
                brickLives[12] -= 1
                brick13.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[12] == 3 {
                brickLives[12] -= 1
                brick13.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[12] == 2 {
                brickLives[12] -= 1
                brick13.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[12] == 1 {
                brickLives[12] -= 1
                brickCount -= 1
                brick13.removeFromParent()
                brickExplosion.position = brick13.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick14" {
            if brickCount > 1 {
                powerUp.position = brick14.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[13] == 6 {
                brickLives[13] -= 1
                brick14.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[13] == 5 {
                brickLives[13] -= 1
                brick14.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[13] == 4 {
                brickLives[13] -= 1
                brick14.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[13] == 3 {
                brickLives[13] -= 1
                brick14.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[13] == 2 {
                brickLives[13] -= 1
                brick14.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[13] == 1 {
                brickLives[13] -= 1
                brickCount -= 1
                brick14.removeFromParent()
                brickExplosion.position = brick14.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick15" {
            if brickCount > 1 {
                powerUp.position = brick15.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[14] == 6 {
                brickLives[14] -= 1
                brick15.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[14] == 5 {
                brickLives[14] -= 1
                brick15.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[14] == 4 {
                brickLives[14] -= 1
                brick15.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[14] == 3 {
                brickLives[14] -= 1
                brick15.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[14] == 2 {
                brickLives[14] -= 1
                brick15.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[14] == 1 {
                brickLives[14] -= 1
                brickCount -= 1
                brick15.removeFromParent()
                brickExplosion.position = brick15.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick16" {
            if brickCount > 1 {
                powerUp.position = brick16.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[15] == 6 {
                brickLives[15] -= 1
                brick16.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[15] == 5 {
                brickLives[15] -= 1
                brick16.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[15] == 4 {
                brickLives[15] -= 1
                brick16.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[15] == 3 {
                brickLives[15] -= 1
                brick16.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[15] == 2 {
                brickLives[15] -= 1
                brick16.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[15] == 1 {
                brickLives[15] -= 1
                brickCount -= 1
                brick16.removeFromParent()
                brickExplosion.position = brick16.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick17" {
            if brickCount > 1 {
                powerUp.position = brick17.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[16] == 6 {
                brickLives[16] -= 1
                brick17.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[16] == 5 {
                brickLives[16] -= 1
                brick17.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[16] == 4 {
                brickLives[16] -= 1
                brick17.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[16] == 3 {
                brickLives[16] -= 1
                brick17.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[16] == 2 {
                brickLives[16] -= 1
                brick17.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[16] == 1 {
                brickLives[16] -= 1
                brickCount -= 1
                brick17.removeFromParent()
                brickExplosion.position = brick17.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick18" {
            if brickCount > 1 {
                powerUp.position = brick18.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[17] == 6 {
                brickLives[17] -= 1
                brick18.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[17] == 5 {
                brickLives[17] -= 1
                brick18.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[17] == 4 {
                brickLives[17] -= 1
                brick18.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[17] == 3 {
                brickLives[17] -= 1
                brick18.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[17] == 2 {
                brickLives[17] -= 1
                brick18.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[17] == 1 {
                brickLives[17] -= 1
                brickCount -= 1
                brick18.removeFromParent()
                brickExplosion.position = brick18.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick19" {
            if brickCount > 1 {
                powerUp.position = brick19.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[18] == 6 {
                brickLives[18] -= 1
                brick19.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[18] == 5 {
                brickLives[18] -= 1
                brick19.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[18] == 4 {
                brickLives[18] -= 1
                brick19.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[18] == 3 {
                brickLives[18] -= 1
                brick19.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[18] == 2 {
                brickLives[18] -= 1
                brick19.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[18] == 1 {
                brickLives[18] -= 1
                brickCount -= 1
                brick19.removeFromParent()
                brickExplosion.position = brick19.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick20" {
            if brickCount > 1 {
                powerUp.position = brick20.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[19] == 6 {
                brickLives[19] -= 1
                brick20.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[19] == 5 {
                brickLives[19] -= 1
                brick20.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[19] == 4 {
                brickLives[19] -= 1
                brick20.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[19] == 3 {
                brickLives[19] -= 1
                brick20.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[19] == 2 {
                brickLives[19] -= 1
                brick20.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[19] == 1 {
                brickLives[19] -= 1
                brickCount -= 1
                brick20.removeFromParent()
                brickExplosion.position = brick20.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick21" {
            if brickCount > 1 {
                powerUp.position = brick21.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[20] == 6 {
                brickLives[20] -= 1
                brick21.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[20] == 5 {
                brickLives[20] -= 1
                brick21.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[20] == 4 {
                brickLives[20] -= 1
                brick21.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[20] == 3 {
                brickLives[20] -= 1
                brick21.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[20] == 2 {
                brickLives[20] -= 1
                brick21.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[20] == 1 {
                brickLives[20] -= 1
                brickCount -= 1
                brick21.removeFromParent()
                brickExplosion.position = brick21.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick22" {
            if brickCount > 1 {
                powerUp.position = brick22.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[21] == 6 {
                brickLives[21] -= 1
                brick22.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[21] == 5 {
                brickLives[21] -= 1
                brick22.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[21] == 4 {
                brickLives[21] -= 1
                brick22.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[21] == 3 {
                brickLives[21] -= 1
                brick22.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[21] == 2 {
                brickLives[21] -= 1
                brick22.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[21] == 1 {
                brickLives[21] -= 1
                brickCount -= 1
                brick22.removeFromParent()
                brickExplosion.position = brick22.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick23" {
            if brickCount > 1 {
                powerUp.position = brick23.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[22] == 6 {
                brickLives[22] -= 1
                brick23.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[22] == 5 {
                brickLives[22] -= 1
                brick23.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[22] == 4 {
                brickLives[22] -= 1
                brick23.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[22] == 3 {
                brickLives[22] -= 1
                brick23.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[22] == 2 {
                brickLives[22] -= 1
                brick23.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[22] == 1 {
                brickLives[22] -= 1
                brickCount -= 1
                brick23.removeFromParent()
                brickExplosion.position = brick23.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick24" {
            if brickCount > 1 {
                powerUp.position = brick24.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[23] == 6 {
                brickLives[23] -= 1
                brick24.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[23] == 5 {
                brickLives[23] -= 1
                brick24.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[23] == 4 {
                brickLives[23] -= 1
                brick24.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[23] == 3 {
                brickLives[23] -= 1
                brick24.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[23] == 2 {
                brickLives[23] -= 1
                brick24.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[23] == 1 {
                brickLives[23] -= 1
                brickCount -= 1
                brick24.removeFromParent()
                brickExplosion.position = brick24.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick25" {
            if brickCount > 1 {
                powerUp.position = brick25.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[24] == 6 {
                brickLives[24] -= 1
                brick25.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[24] == 5 {
                brickLives[24] -= 1
                brick25.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[24] == 4 {
                brickLives[24] -= 1
                brick25.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[24] == 3 {
                brickLives[24] -= 1
                brick25.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[24] == 2 {
                brickLives[24] -= 1
                brick25.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[24] == 1 {
                brickLives[24] -= 1
                brickCount -= 1
                brick25.removeFromParent()
                brickExplosion.position = brick25.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick26" {
            if brickCount > 1 {
                powerUp.position = brick26.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[25] == 6 {
                brickLives[25] -= 1
                brick26.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[25] == 5 {
                brickLives[25] -= 1
                brick26.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[25] == 4 {
                brickLives[25] -= 1
                brick26.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[25] == 3 {
                brickLives[25] -= 1
                brick26.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[25] == 2 {
                brickLives[25] -= 1
                brick26.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[25] == 1 {
                brickLives[25] -= 1
                brickCount -= 1
                brick26.removeFromParent()
                brickExplosion.position = brick26.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick27" {
            if brickCount > 1 {
                powerUp.position = brick27.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[26] == 6 {
                brickLives[26] -= 1
                brick27.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[26] == 5 {
                brickLives[26] -= 1
                brick27.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[26] == 4 {
                brickLives[26] -= 1
                brick27.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[26] == 3 {
                brickLives[26] -= 1
                brick27.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[26] == 2 {
                brickLives[26] -= 1
                brick27.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[26] == 1 {
                brickLives[26] -= 1
                brickCount -= 1
                brick27.removeFromParent()
                brickExplosion.position = brick27.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick28" {
            if brickCount > 1 {
                powerUp.position = brick28.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[27] == 6 {
                brickLives[27] -= 1
                brick28.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[27] == 5 {
                brickLives[27] -= 1
                brick28.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[27] == 4 {
                brickLives[27] -= 1
                brick28.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[27] == 3 {
                brickLives[27] -= 1
                brick28.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[27] == 2 {
                brickLives[27] -= 1
                brick28.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[27] == 1 {
                brickLives[27] -= 1
                brickCount -= 1
                brick28.removeFromParent()
                brickExplosion.position = brick28.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick29" {
            if brickCount > 1 {
                powerUp.position = brick29.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[28] == 6 {
                brickLives[28] -= 1
                brick29.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[28] == 5 {
                brickLives[28] -= 1
                brick29.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[28] == 4 {
                brickLives[28] -= 1
                brick29.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[28] == 3 {
                brickLives[28] -= 1
                brick29.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[28] == 2 {
                brickLives[28] -= 1
                brick29.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[28] == 1 {
                brickLives[28] -= 1
                brickCount -= 1
                brick29.removeFromParent()
                brickExplosion.position = brick29.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick30" {
            if brickCount > 1 {
                powerUp.position = brick30.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[29] == 6 {
                brickLives[29] -= 1
                brick30.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[29] == 5 {
                brickLives[29] -= 1
                brick30.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[29] == 4 {
                brickLives[29] -= 1
                brick30.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[29] == 3 {
                brickLives[29] -= 1
                brick30.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[29] == 2 {
                brickLives[29] -= 1
                brick30.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[29] == 1 {
                brickLives[29] -= 1
                brickCount -= 1
                brick30.removeFromParent()
                brickExplosion.position = brick30.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick31" {
            if brickCount > 1 {
                powerUp.position = brick31.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[30] == 6 {
                brickLives[30] -= 1
                brick31.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[30] == 5 {
                brickLives[30] -= 1
                brick31.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[30] == 4 {
                brickLives[30] -= 1
                brick31.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[30] == 3 {
                brickLives[30] -= 1
                brick31.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[30] == 2 {
                brickLives[30] -= 1
                brick31.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[30] == 1 {
                brickLives[30] -= 1
                brickCount -= 1
                brick31.removeFromParent()
                brickExplosion.position = brick31.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick32" {
            if brickCount > 1 {
                powerUp.position = brick32.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[31] == 6 {
                brickLives[31] -= 1
                brick32.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[31] == 5 {
                brickLives[31] -= 1
                brick32.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[31] == 4 {
                brickLives[31] -= 1
                brick32.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[31] == 3 {
                brickLives[31] -= 1
                brick32.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[31] == 2 {
                brickLives[31] -= 1
                brick32.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[31] == 1 {
                brickLives[31] -= 1
                brickCount -= 1
                brick32.removeFromParent()
                brickExplosion.position = brick32.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick33" {
            if brickCount > 1 {
                powerUp.position = brick33.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[32] == 6 {
                brickLives[32] -= 1
                brick33.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[32] == 5 {
                brickLives[32] -= 1
                brick33.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[32] == 4 {
                brickLives[32] -= 1
                brick33.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[32] == 3 {
                brickLives[32] -= 1
                brick33.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[32] == 2 {
                brickLives[32] -= 1
                brick33.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[32] == 1 {
                brickLives[32] -= 1
                brickCount -= 1
                brick33.removeFromParent()
                brickExplosion.position = brick33.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick34" {
            if brickCount > 1 {
                powerUp.position = brick34.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[33] == 6 {
                brickLives[33] -= 1
                brick34.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[33] == 5 {
                brickLives[33] -= 1
                brick34.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[33] == 4 {
                brickLives[33] -= 1
                brick34.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[33] == 3 {
                brickLives[33] -= 1
                brick34.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[33] == 2 {
                brickLives[33] -= 1
                brick34.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[33] == 1 {
                brickLives[33] -= 1
                brickCount -= 1
                brick34.removeFromParent()
                brickExplosion.position = brick34.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick35" {
            if brickCount > 1 {
                powerUp.position = brick35.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[34] == 6 {
                brickLives[34] -= 1
                brick35.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[34] == 5 {
                brickLives[34] -= 1
                brick35.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[34] == 4 {
                brickLives[34] -= 1
                brick35.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[34] == 3 {
                brickLives[34] -= 1
                brick35.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[34] == 2 {
                brickLives[34] -= 1
                brick35.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[34] == 1 {
                brickLives[34] -= 1
                brickCount -= 1
                brick35.removeFromParent()
                brickExplosion.position = brick35.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick36" {
            if brickCount > 1 {
                powerUp.position = brick36.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[35] == 6 {
                brickLives[35] -= 1
                brick36.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[35] == 5 {
                brickLives[35] -= 1
                brick36.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[35] == 4 {
                brickLives[35] -= 1
                brick36.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[35] == 3 {
                brickLives[35] -= 1
                brick36.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[35] == 2 {
                brickLives[35] -= 1
                brick36.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[35] == 1 {
                brickLives[35] -= 1
                brickCount -= 1
                brick36.removeFromParent()
                brickExplosion.position = brick36.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick37" {
            if brickCount > 1 {
                powerUp.position = brick37.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[36] == 6 {
                brickLives[36] -= 1
                brick37.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[36] == 5 {
                brickLives[36] -= 1
                brick37.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[36] == 4 {
                brickLives[36] -= 1
                brick37.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[36] == 3 {
                brickLives[36] -= 1
                brick37.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[36] == 2 {
                brickLives[36] -= 1
                brick37.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[36] == 1 {
                brickLives[36] -= 1
                brickCount -= 1
                brick37.removeFromParent()
                brickExplosion.position = brick37.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick38" {
            if brickCount > 1 {
                powerUp.position = brick38.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[37] == 6 {
                brickLives[37] -= 1
                brick38.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[37] == 5 {
                brickLives[37] -= 1
                brick38.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[37] == 4 {
                brickLives[37] -= 1
                brick38.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[37] == 3 {
                brickLives[37] -= 1
                brick38.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[37] == 2 {
                brickLives[37] -= 1
                brick38.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[37] == 1 {
                brickLives[37] -= 1
                brickCount -= 1
                brick38.removeFromParent()
                brickExplosion.position = brick38.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick39" {
            if brickCount > 1 {
                powerUp.position = brick39.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[38] == 6 {
                brickLives[38] -= 1
                brick39.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[38] == 5 {
                brickLives[38] -= 1
                brick39.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[38] == 4 {
                brickLives[38] -= 1
                brick39.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[38] == 3 {
                brickLives[38] -= 1
                brick39.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[38] == 2 {
                brickLives[38] -= 1
                brick39.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[38] == 1 {
                brickLives[38] -= 1
                brickCount -= 1
                brick39.removeFromParent()
                brickExplosion.position = brick39.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick40" {
            if brickCount > 1 {
                powerUp.position = brick40.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[39] == 6 {
                brickLives[39] -= 1
                brick40.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[39] == 5 {
                brickLives[39] -= 1
                brick40.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[39] == 4 {
                brickLives[39] -= 1
                brick40.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[39] == 3 {
                brickLives[39] -= 1
                brick40.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[39] == 2 {
                brickLives[39] -= 1
                brick40.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[39] == 1 {
                brickLives[39] -= 1
                brickCount -= 1
                brick40.removeFromParent()
                brickExplosion.position = brick40.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick41" {
            if brickCount > 1 {
                powerUp.position = brick41.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[40] == 6 {
                brickLives[40] -= 1
                brick41.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[40] == 5 {
                brickLives[40] -= 1
                brick41.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[40] == 4 {
                brickLives[40] -= 1
                brick41.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[40] == 3 {
                brickLives[40] -= 1
                brick41.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[40] == 2 {
                brickLives[40] -= 1
                brick41.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[40] == 1 {
                brickLives[40] -= 1
                brickCount -= 1
                brick41.removeFromParent()
                brickExplosion.position = brick41.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick42" {
            if brickCount > 1 {
                powerUp.position = brick42.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[41] == 6 {
                brickLives[41] -= 1
                brick42.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[41] == 5 {
                brickLives[41] -= 1
                brick42.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[41] == 4 {
                brickLives[41] -= 1
                brick42.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[41] == 3 {
                brickLives[41] -= 1
                brick42.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[41] == 2 {
                brickLives[41] -= 1
                brick42.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[41] == 1 {
                brickLives[41] -= 1
                brickCount -= 1
                brick42.removeFromParent()
                brickExplosion.position = brick42.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick43" {
            if brickCount > 1 {
                powerUp.position = brick43.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[42] == 6 {
                brickLives[42] -= 1
                brick43.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[42] == 5 {
                brickLives[42] -= 1
                brick43.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[42] == 4 {
                brickLives[42] -= 1
                brick43.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[42] == 3 {
                brickLives[42] -= 1
                brick43.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[42] == 2 {
                brickLives[42] -= 1
                brick43.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[42] == 1 {
                brickLives[42] -= 1
                brickCount -= 1
                brick43.removeFromParent()
                brickExplosion.position = brick43.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick44" {
            if brickCount > 1 {
                powerUp.position = brick44.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[43] == 6 {
                brickLives[43] -= 1
                brick44.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[43] == 5 {
                brickLives[43] -= 1
                brick44.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[43] == 4 {
                brickLives[43] -= 1
                brick44.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[43] == 3 {
                brickLives[43] -= 1
                brick44.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[43] == 2 {
                brickLives[43] -= 1
                brick44.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[43] == 1 {
                brickLives[43] -= 1
                brickCount -= 1
                brick44.removeFromParent()
                brickExplosion.position = brick44.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick45" {
            if brickCount > 1 {
                powerUp.position = brick45.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[44] == 6 {
                brickLives[44] -= 1
                brick45.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[44] == 5 {
                brickLives[44] -= 1
                brick45.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[44] == 4 {
                brickLives[44] -= 1
                brick45.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[44] == 3 {
                brickLives[44] -= 1
                brick45.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[44] == 2 {
                brickLives[44] -= 1
                brick45.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[44] == 1 {
                brickLives[44] -= 1
                brickCount -= 1
                brick45.removeFromParent()
                brickExplosion.position = brick45.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick46" {
            if brickCount > 1 {
                powerUp.position = brick46.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[45] == 6 {
                brickLives[45] -= 1
                brick46.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[45] == 5 {
                brickLives[45] -= 1
                brick46.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[45] == 4 {
                brickLives[45] -= 1
                brick46.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[45] == 3 {
                brickLives[45] -= 1
                brick46.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[45] == 2 {
                brickLives[45] -= 1
                brick46.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[45] == 1 {
                brickLives[45] -= 1
                brickCount -= 1
                brick46.removeFromParent()
                brickExplosion.position = brick46.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick47" {
            if brickCount > 1 {
                powerUp.position = brick47.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[46] == 6 {
                brickLives[46] -= 1
                brick47.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[46] == 5 {
                brickLives[46] -= 1
                brick47.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[46] == 4 {
                brickLives[46] -= 1
                brick47.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[46] == 3 {
                brickLives[46] -= 1
                brick47.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[46] == 2 {
                brickLives[46] -= 1
                brick47.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[46] == 1 {
                brickLives[46] -= 1
                brickCount -= 1
                brick47.removeFromParent()
                brickExplosion.position = brick47.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick48" {
            if brickCount > 1 {
                powerUp.position = brick48.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[47] == 6 {
                brickLives[47] -= 1
                brick48.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[47] == 5 {
                brickLives[47] -= 1
                brick48.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[47] == 4 {
                brickLives[47] -= 1
                brick48.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[47] == 3 {
                brickLives[47] -= 1
                brick48.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[47] == 2 {
                brickLives[47] -= 1
                brick48.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[47] == 1 {
                brickLives[47] -= 1
                brickCount -= 1
                brick48.removeFromParent()
                brickExplosion.position = brick48.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick49" {
            if brickCount > 1 {
                powerUp.position = brick49.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[48] == 6 {
                brickLives[48] -= 1
                brick49.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[48] == 5 {
                brickLives[48] -= 1
                brick49.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[48] == 4 {
                brickLives[48] -= 1
                brick49.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[48] == 3 {
                brickLives[48] -= 1
                brick49.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[48] == 2 {
                brickLives[48] -= 1
                brick49.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[48] == 1 {
                brickLives[48] -= 1
                brickCount -= 1
                brick49.removeFromParent()
                brickExplosion.position = brick49.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick50" {
            if brickCount > 1 {
                powerUp.position = brick50.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[49] == 6 {
                brickLives[49] -= 1
                brick50.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[49] == 5 {
                brickLives[49] -= 1
                brick50.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[49] == 4 {
                brickLives[49] -= 1
                brick50.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[49] == 3 {
                brickLives[49] -= 1
                brick50.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[49] == 2 {
                brickLives[49] -= 1
                brick50.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[49] == 1 {
                brickLives[49] -= 1
                brickCount -= 1
                brick50.removeFromParent()
                brickExplosion.position = brick50.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick51" {
            if brickCount > 1 {
                powerUp.position = brick51.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[50] == 6 {
                brickLives[50] -= 1
                brick51.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[50] == 5 {
                brickLives[50] -= 1
                brick51.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[50] == 4 {
                brickLives[50] -= 1
                brick51.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[50] == 3 {
                brickLives[50] -= 1
                brick51.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[50] == 2 {
                brickLives[50] -= 1
                brick51.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[50] == 1 {
                brickLives[50] -= 1
                brickCount -= 1
                brick51.removeFromParent()
                brickExplosion.position = brick51.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick52" {
            if brickCount > 1 {
                powerUp.position = brick52.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[51] == 6 {
                brickLives[51] -= 1
                brick52.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[51] == 5 {
                brickLives[51] -= 1
                brick52.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[51] == 4 {
                brickLives[51] -= 1
                brick52.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[51] == 3 {
                brickLives[51] -= 1
                brick52.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[51] == 2 {
                brickLives[51] -= 1
                brick52.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[51] == 1 {
                brickLives[51] -= 1
                brickCount -= 1
                brick52.removeFromParent()
                brickExplosion.position = brick52.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick53" {
            if brickCount > 1 {
                powerUp.position = brick53.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[52] == 6 {
                brickLives[52] -= 1
                brick53.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[52] == 5 {
                brickLives[52] -= 1
                brick53.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[52] == 4 {
                brickLives[52] -= 1
                brick53.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[52] == 3 {
                brickLives[52] -= 1
                brick53.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[52] == 2 {
                brickLives[52] -= 1
                brick53.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[52] == 1 {
                brickLives[52] -= 1
                brickCount -= 1
                brick53.removeFromParent()
                brickExplosion.position = brick53.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick54" {
            if brickCount > 1 {
                powerUp.position = brick54.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[53] == 6 {
                brickLives[53] -= 1
                brick54.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[53] == 5 {
                brickLives[53] -= 1
                brick54.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[53] == 4 {
                brickLives[53] -= 1
                brick54.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[53] == 3 {
                brickLives[53] -= 1
                brick54.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[53] == 2 {
                brickLives[53] -= 1
                brick54.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[53] == 1 {
                brickLives[53] -= 1
                brickCount -= 1
                brick54.removeFromParent()
                brickExplosion.position = brick54.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick55" {
            if brickCount > 1 {
                powerUp.position = brick55.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[54] == 6 {
                brickLives[54] -= 1
                brick55.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[54] == 5 {
                brickLives[54] -= 1
                brick55.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[54] == 4 {
                brickLives[54] -= 1
                brick55.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[54] == 3 {
                brickLives[54] -= 1
                brick55.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[54] == 2 {
                brickLives[54] -= 1
                brick55.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[54] == 1 {
                brickLives[54] -= 1
                brickCount -= 1
                brick55.removeFromParent()
                brickExplosion.position = brick55.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick56" {
            if brickCount > 1 {
                powerUp.position = brick56.position
                
                if powerUp.name == "paddleGrowPowerUp" && paddleGrowActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "paddleShrinkPowerUp" && paddleShrinkActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "invincibleBallPowerUp" && invincibleActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "triBallPowerUp" && triBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "x2ScorePowerUp" && x2Active == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "miniBallPowerUp" && miniBallActive == true {
                    print("Power Up Already Active")
                } else if powerUp.name == "giantBallPowerUp" && giantBallActive == true {
                    print("Power Up Already Active")
                } else {
                    self.addChild(powerUp)
                }
            }
            
            if brickLives[55] == 6 {
                brickLives[55] -= 1
                brick56.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[55] == 5 {
                brickLives[55] -= 1
                brick56.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[55] == 4 {
                brickLives[55] -= 1
                brick56.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[55] == 3 {
                brickLives[55] -= 1
                brick56.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[55] == 2 {
                brickLives[55] -= 1
                brick56.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[55] == 1 {
                brickLives[55] -= 1
                brickCount -= 1
                brick56.removeFromParent()
                brickExplosion.position = brick56.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if brickCount == 0 {
            print("ch3lvl22 completed")
            gameOver = true
            
            if ch3lvl23Unlocked == false {
                continueString = "ch3lvl23"
                UserDefaults.standard.set("ch3lvl23", forKey: "continueString")
            }
            ch3lvl23Unlocked = true
            UserDefaults.standard.set(true, forKey: "ch3lvl23Unlocked")
            UserDefaults.standard.synchronize()
            
            let explosionWait = SKAction.wait(forDuration: 0.6)
            let ballExplosion1 = SKEmitterNode()
            let ballExplosion2 = SKEmitterNode()
            let ballExplosion3 = SKEmitterNode()
            let ballParticleTexture = self.ball1.texture
            
            ballExplosion1.particleTexture = ballParticleTexture
            ballExplosion1.particleSize = CGSize(width: self.frame.width / 20, height: self.frame.height / 26)
            ballExplosion1.physicsBody = SKPhysicsBody(circleOfRadius: ballExplosion1.particleSize.width)
            ballExplosion1.physicsBody?.affectedByGravity = true
            ballExplosion1.physicsBody?.categoryBitMask = PhysicsCategory.ExplosionParticles
            ballExplosion1.physicsBody?.contactTestBitMask = 0
            ballExplosion1.physicsBody?.collisionBitMask = 0
            ballExplosion1.particleBirthRate = 100
            ballExplosion1.particleAlpha = 1
            ballExplosion1.particleLifetime = 0.5
            ballExplosion1.particleAlpha = 1
            ballExplosion1.emissionAngle = 360
            ballExplosion1.emissionAngleRange = 25
            ballExplosion1.particleSpeed = 75
            ballExplosion1.particleSpeedRange = 50
            ballExplosion1.alpha = 1
            ballExplosion1.particleScale = 0.5
            ballExplosion1.zPosition = 3
            ballExplosion1.particleLifetimeRange = 0
            ballExplosion1.particlePositionRange = CGVector(dx: 0, dy: 0)
            ballExplosion1.zPosition = 5
            
            ballExplosion2.particleTexture = ballParticleTexture
            ballExplosion2.particleSize = CGSize(width: self.frame.width / 20, height: self.frame.height / 26)
            ballExplosion2.physicsBody = SKPhysicsBody(circleOfRadius: ballExplosion2.particleSize.width)
            ballExplosion2.physicsBody?.affectedByGravity = true
            ballExplosion2.physicsBody?.categoryBitMask = PhysicsCategory.ExplosionParticles
            ballExplosion2.physicsBody?.contactTestBitMask = 0
            ballExplosion2.physicsBody?.collisionBitMask = 0
            ballExplosion2.particleBirthRate = 100
            ballExplosion2.particleAlpha = 1
            ballExplosion2.particleLifetime = 0.5
            ballExplosion2.particleAlpha = 1
            ballExplosion2.emissionAngle = 360
            ballExplosion2.emissionAngleRange = 25
            ballExplosion2.particleSpeed = 75
            ballExplosion2.particleSpeedRange = 50
            ballExplosion2.alpha = 1
            ballExplosion2.particleScale = 0.5
            ballExplosion2.zPosition = 3
            ballExplosion2.particleLifetimeRange = 0
            ballExplosion2.particlePositionRange = CGVector(dx: 0, dy: 0)
            ballExplosion2.zPosition = 5
            
            ballExplosion3.particleTexture = ballParticleTexture
            ballExplosion3.particleSize = CGSize(width: self.frame.width / 20, height: self.frame.height / 26)
            ballExplosion3.physicsBody = SKPhysicsBody(circleOfRadius: ballExplosion3.particleSize.width)
            ballExplosion3.physicsBody?.affectedByGravity = true
            ballExplosion3.physicsBody?.categoryBitMask = PhysicsCategory.ExplosionParticles
            ballExplosion3.physicsBody?.contactTestBitMask = 0
            ballExplosion3.physicsBody?.collisionBitMask = 0
            ballExplosion3.particleBirthRate = 100
            ballExplosion3.particleAlpha = 1
            ballExplosion3.particleLifetime = 0.5
            ballExplosion3.particleAlpha = 1
            ballExplosion3.emissionAngle = 360
            ballExplosion3.emissionAngleRange = 25
            ballExplosion3.particleSpeed = 75
            ballExplosion3.particleSpeedRange = 50
            ballExplosion3.alpha = 1
            ballExplosion3.particleScale = 0.5
            ballExplosion3.zPosition = 3
            ballExplosion3.particleLifetimeRange = 0
            ballExplosion3.particlePositionRange = CGVector(dx: 0, dy: 0)
            ballExplosion3.zPosition = 5
            
            ball1.removeFromParent()
            ball2.removeFromParent()
            ball3.removeFromParent()
            ballExplosion1.position = ball1.position
            ballExplosion2.position = ball2.position
            ballExplosion3.position = ball3.position
            if ball1.position.y > paddle.position.y {
                self.addChild(ballExplosion1)
            }
            if ball2.position.y > paddle.position.y {
                self.addChild(ballExplosion2)
            }
            if ball3.position.y > paddle.position.y {
                self.addChild(ballExplosion3)
            }
            self.run(explosionWait, completion: {
                ballExplosion1.removeFromParent()
                ballExplosion2.removeFromParent()
                ballExplosion3.removeFromParent()
                self.run(SKAction.wait(forDuration: 0.5), completion: {
                    let scene = ch3lvl23Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
                    let transition = SKTransition.fade(withDuration: 1)
                    scene.scaleMode = .aspectFill
                    self.view?.presentScene(scene, transition: transition)
                })
            })
            
        }
    }
    
    func powerUpHitPaddle(PowerUp: SKSpriteNode, Paddle: SKSpriteNode) {
        let explosionWait = SKAction.wait(forDuration: 0.6)
        let powerUpExplosion = SKEmitterNode()
        let powerUpParticleTexture = PowerUp.texture
        
        powerUpExplosion.particleTexture = powerUpParticleTexture
        powerUpExplosion.particleSize = CGSize(width: self.frame.width / 20, height: self.frame.height / 26)
        powerUpExplosion.physicsBody = SKPhysicsBody(circleOfRadius: powerUpExplosion.particleSize.width)
        powerUpExplosion.physicsBody?.affectedByGravity = false
        powerUpExplosion.physicsBody?.categoryBitMask = PhysicsCategory.ExplosionParticles
        powerUpExplosion.physicsBody?.contactTestBitMask = 0
        powerUpExplosion.physicsBody?.collisionBitMask = 0
        powerUpExplosion.particleBirthRate = 100
        powerUpExplosion.particleAlpha = 1
        powerUpExplosion.particleLifetime = 0.5
        powerUpExplosion.particleAlpha = 1
        powerUpExplosion.emissionAngle = 360
        powerUpExplosion.emissionAngleRange = 25
        powerUpExplosion.particleSpeed = 75
        powerUpExplosion.particleSpeedRange = 50
        powerUpExplosion.alpha = 1
        powerUpExplosion.particleScale = 0.5
        powerUpExplosion.zPosition = 3
        powerUpExplosion.particleLifetimeRange = 0
        powerUpExplosion.particlePositionRange = CGVector(dx: 0, dy: 0)
        powerUpExplosion.zPosition = 5
        
        let paddleGrowTime = SKAction.wait(forDuration: 5)
        let paddleShrinkTime = SKAction.wait(forDuration: 5)
        let invinvibleTime = SKAction.wait(forDuration: 8)
        
        if PowerUp.name == "coinPowerUp" {
            
            powerUpExplosion.physicsBody?.affectedByGravity = true
            
            let plusOneLabelFade = SKAction.fadeOut(withDuration: 1.2)
            let plusOneLabelMove = SKAction.moveTo(y: PowerUp.position.y + (PowerUp.size.height * 3.5), duration: 1.2)
            
            coinsInWallet += 1
            UserDefaults.standard.set(coinsInWallet, forKey: "coinsInWallet")
            UserDefaults.standard.synchronize()
            coinWalletLbl.text = "\(coinsInWallet)"
            
            let plusOneLbl = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
            plusOneLbl.text = "+1"
            plusOneLbl.fontSize = self.frame.width / 12
            plusOneLbl.fontColor = SKColor.white
            plusOneLbl.position = CGPoint(x: PowerUp.position.x, y: PowerUp.position.y)
            plusOneLbl.zPosition = 1
            self.addChild(plusOneLbl)
            plusOneLbl.run(plusOneLabelMove)
            plusOneLbl.run(plusOneLabelFade)
            
            print("Coin Collected!")
            
        } else if PowerUp.name == "paddleGrowPowerUp" {
            if gameOver == false && paddleGrowActive == false {
                paddleGrowActive = true
                self.paddle.run(SKAction.scaleX(to: 2, y: 1, duration: 0.5))
                self.run(paddleGrowTime, completion: {
                    self.paddle.run(SKAction.scaleX(to: 1, y: 1, duration: 0.5))
                    self.paddleGrowActive = false
                })
            } else if paddleShrinkActive == true {
                paddleShrinkActive = false
                self.paddle.run(SKAction.scaleX(to: 1, y: 1, duration: 0.5))
            } else {
                
            }
        } else if PowerUp.name == "paddleShrinkPowerUp" {
            if gameOver == false && paddleShrinkActive == false {
                paddleShrinkActive = true
                self.paddle.run(SKAction.scaleX(to: 0.5, y: 1, duration: 0.5))
                self.run(paddleShrinkTime, completion: {
                    self.paddle.run(SKAction.scaleX(to: 1, y: 1, duration: 0.5))
                    self.paddleShrinkActive = false
                })
            } else if paddleGrowActive == true {
                paddleGrowActive = false
                self.paddle.run(SKAction.scaleX(to: 1, y: 1, duration: 0.5))
            } else {
                
            }
        } else if PowerUp.name == "rocketShotPowerUp" {
            if gameOver == false {
                let engineExplosion = SKEmitterNode(fileNamed: "RocketFire.sks")
                
                engineExplosion?.zPosition = 10
                
                let rocket = SKSpriteNode(imageNamed: "rocketImg")
                rocket.size = CGSize(width: self.frame.width / 16, height: self.frame.width / 8.5)
                rocket.position = CGPoint(x: paddle.position.x, y: paddle.position.y + (rocket.size.height * 0.6))
                rocket.zPosition = 1
                rocket.name = "rocket"
                rocket.color = SKColor.orange
                self.addChild(rocket)
                rocket.physicsBody = SKPhysicsBody(rectangleOf: rocket.size)
                rocket.physicsBody?.isDynamic = true
                rocket.physicsBody?.affectedByGravity = false
                rocket.physicsBody?.allowsRotation = false
                rocket.physicsBody?.categoryBitMask = PhysicsCategory.Rocket
                rocket.physicsBody?.collisionBitMask = PhysicsCategory.Obstacle | PhysicsCategory.Brick | PhysicsCategory.Barrier
                rocket.physicsBody?.contactTestBitMask = PhysicsCategory.Obstacle | PhysicsCategory.Brick | PhysicsCategory.Barrier
                
                var dx = CGFloat(Paddle.position.x - Paddle.position.x)
                var dy = CGFloat(Paddle.position.y - rocket.position.y)
                
                let magnitude = sqrt(dx * dx + dy * dy)
                
                dx /= magnitude
                dy /= magnitude
                
                var vector = CGVector()
                
                if view?.frame.width == 768 && view?.frame.height == 1024 {
                    vector = CGVector(dx: ((view?.frame.width)! / 2.8) * dx, dy: ((view?.frame.width)! / 2.8) * dy)
                    // Optional((-1.69431173801422, 671.981262207031))
                    // iPad (5th gen) through pro (9.7 Inch)
                } else if view?.frame.width == 834 && view?.frame.height == 1112 {
                    vector = CGVector(dx: ((view?.frame.width)! / 2.75) * dx, dy: ((view?.frame.width)! / 2.75) * dy)
                    // Optional((0.0, 671.755004882812))
                    // iPad pro (10.5 Inch)
                } else if view?.frame.width == 1024 && view?.frame.height == 1366 {
                    vector = CGVector(dx: ((view?.frame.width)! / 2.2) * dx, dy: ((view?.frame.width)! / 2.2) * dy)
                    // Optional((1.39736270904541, 671.98193359375))
                    // iPad pro (12.9 Inch)
                } else if view?.frame.width == 320 && view?.frame.height == 568 {
                    vector = CGVector(dx: ((view?.frame.width)! / 9.2) * dx, dy: ((view?.frame.width)! / 9.2) * dy)
                    // Optional((1.63292384147644, 489.585235595703))
                    // iPhone 5s and SE
                } else if view?.frame.width == 375 && view?.frame.height == 667 {
                    vector = CGVector(dx: ((view?.frame.width)! / 8.45) * dx, dy: ((view?.frame.width)! / 8.45) * dy)
                    // Optional((2.07877373695374, 489.446929931641))
                    // iPhone 6,7,8
                } else if view?.frame.width == 414 && view?.frame.height ==  736 {
                    vector = CGVector(dx: ((view?.frame.width)! / 7.9) * dx, dy: ((view?.frame.width)! / 7.9) * dy)
                    // Optional((1.9209446691093e-05, 489.418579101562))
                    // iPhone 6 plus, 7 plus, 8 plus
                } else if view?.frame.width == 375 && view?.frame.height == 812 {
                    vector = CGVector(dx: ((view?.frame.width)! / 7.9) * dx, dy: ((view?.frame.width)! / 7.9) * dy)
                    // Optional((-2.84653806686401, -489.443054199219))
                    // iPhone X
                }
                
                rocket.physicsBody?.applyImpulse(vector)
                engineExplosion?.position = CGPoint(x: 0, y: 0 - (rocket.size.height * 0.75))
                if view?.frame.width == 768 && view?.frame.height == 1024 || view?.frame.width == 834 && view?.frame.height == 1112 || view?.frame.width == 1024 && view?.frame.height == 1366 {
                    engineExplosion?.particleScale = 0.18
                } else {
                    engineExplosion?.particleScale = 0.08
                }
                rocket.addChild(engineExplosion!)
                
            }
        } else if PowerUp.name == "deathPowerUp" {
            if invincibleActive == false {
                
                let ballExplosion1 = SKEmitterNode()
                let ballExplosion2 = SKEmitterNode()
                let ballExplosion3 = SKEmitterNode()
                let ballParticleTexture = self.ball1.texture
                
                ballExplosion1.particleTexture = ballParticleTexture
                ballExplosion1.particleSize = CGSize(width: self.frame.width / 20, height: self.frame.height / 26)
                ballExplosion1.physicsBody = SKPhysicsBody(circleOfRadius: ballExplosion1.particleSize.width)
                ballExplosion1.physicsBody?.affectedByGravity = true
                ballExplosion1.physicsBody?.categoryBitMask = PhysicsCategory.ExplosionParticles
                ballExplosion1.physicsBody?.contactTestBitMask = 0
                ballExplosion1.physicsBody?.collisionBitMask = 0
                ballExplosion1.particleBirthRate = 100
                ballExplosion1.particleAlpha = 1
                ballExplosion1.particleLifetime = 0.5
                ballExplosion1.particleAlpha = 1
                ballExplosion1.emissionAngle = 90
                ballExplosion1.emissionAngleRange = 180
                ballExplosion1.particleSpeed = 450
                ballExplosion1.particleSpeedRange = 150
                ballExplosion1.alpha = 1
                ballExplosion1.particleScale = 0.5
                ballExplosion1.zPosition = 3
                ballExplosion1.particleLifetimeRange = 0
                ballExplosion1.particlePositionRange = CGVector(dx: 0, dy: 0)
                ballExplosion1.zPosition = 5
                
                ballExplosion2.particleTexture = ballParticleTexture
                ballExplosion2.particleSize = CGSize(width: self.frame.width / 20, height: self.frame.height / 26)
                ballExplosion2.physicsBody = SKPhysicsBody(circleOfRadius: ballExplosion2.particleSize.width)
                ballExplosion2.physicsBody?.affectedByGravity = true
                ballExplosion2.physicsBody?.categoryBitMask = PhysicsCategory.ExplosionParticles
                ballExplosion2.physicsBody?.contactTestBitMask = 0
                ballExplosion2.physicsBody?.collisionBitMask = 0
                ballExplosion2.particleBirthRate = 100
                ballExplosion2.particleAlpha = 1
                ballExplosion2.particleLifetime = 0.5
                ballExplosion2.particleAlpha = 1
                ballExplosion2.emissionAngle = 90
                ballExplosion2.emissionAngleRange = 180
                ballExplosion2.particleSpeed = 450
                ballExplosion2.particleSpeedRange = 150
                ballExplosion2.alpha = 1
                ballExplosion2.particleScale = 0.5
                ballExplosion2.zPosition = 3
                ballExplosion2.particleLifetimeRange = 0
                ballExplosion2.particlePositionRange = CGVector(dx: 0, dy: 0)
                ballExplosion2.zPosition = 5
                
                ballExplosion3.particleTexture = ballParticleTexture
                ballExplosion3.particleSize = CGSize(width: self.frame.width / 20, height: self.frame.height / 26)
                ballExplosion3.physicsBody = SKPhysicsBody(circleOfRadius: ballExplosion3.particleSize.width)
                ballExplosion3.physicsBody?.affectedByGravity = true
                ballExplosion3.physicsBody?.categoryBitMask = PhysicsCategory.ExplosionParticles
                ballExplosion3.physicsBody?.contactTestBitMask = 0
                ballExplosion3.physicsBody?.collisionBitMask = 0
                ballExplosion3.particleBirthRate = 100
                ballExplosion3.particleAlpha = 1
                ballExplosion3.particleLifetime = 0.5
                ballExplosion3.particleAlpha = 1
                ballExplosion3.emissionAngle = 90
                ballExplosion3.emissionAngleRange = 180
                ballExplosion3.particleSpeed = 450
                ballExplosion3.particleSpeedRange = 150
                ballExplosion3.alpha = 1
                ballExplosion3.particleScale = 0.5
                ballExplosion3.zPosition = 3
                ballExplosion3.particleLifetimeRange = 0
                ballExplosion3.particlePositionRange = CGVector(dx: 0, dy: 0)
                ballExplosion3.zPosition = 5
                
                if gameOver == false {
                    pauseBtn.run(fadeOut)
                    ggLbl.run(fadeIn)
                    retryBtn.run(fadeIn)
                    mainMenuBtn.run(fadeIn)
                    if ch3lvl23Unlocked == true {
                        nextBtn.run(fadeIn)
                    }
                    
                    self.gameOver = true
                    ball2.removeFromParent()
                    ball3.removeFromParent()
                    self.ball1.removeFromParent()
                    ballExplosion1.position = self.ball1.position
                    ballExplosion2.position = self.ball1.position
                    ballExplosion3.position = self.ball1.position
                    if ball1.position.y > paddle.position.y {
                        self.addChild(ballExplosion1)
                    }
                    if ball2.position.y > paddle.position.y {
                        self.addChild(ballExplosion2)
                    }
                    if ball3.position.y > paddle.position.y {
                        self.addChild(ballExplosion3)
                    }
                    self.run(explosionWait, completion: {
                        ballExplosion1.removeFromParent()
                        ballExplosion2.removeFromParent()
                        ballExplosion3.removeFromParent()
                    })
                    
                }
                
            }
        } else if PowerUp.name == "invincibleBallPowerUp" {
            if invincibleActive == true {
                invincibleTime += 10
                invincibleActiveLbl.text = "\(invincibleTime)"
            } else {
                invincibleTime = 10
                invincibleActiveLbl.text = "\(invincibleTime)"
            }
            
            if gameOver == false && invincibleActive == false {
                
                invincibleActiveImg.size = CGSize(width: self.frame.width / 13, height: self.frame.width / 13)
                if x2Active == true {
                    invincibleActiveImg.position = CGPoint(x: 0 + (invincibleActiveImg.size.width), y: self.frame.height / 1.18 - (invincibleActiveImg.size.height * 1.2))
                } else if x2Active == false {
                    invincibleActiveImg.position = CGPoint(x: 0 + (invincibleActiveImg.size.width), y: self.frame.height / 1.18)
                }
                invincibleActiveImg.zPosition = 4
                invincibleActiveImg.alpha = 0
                self.addChild(invincibleActiveImg)
                invincibleActiveImg.run(fadeIn)
                
                invincibleActiveLbl.text = "\(invincibleTime)"
                invincibleActiveLbl.fontSize = self.frame.width / 15
                invincibleActiveLbl.position = CGPoint(x: invincibleActiveImg.position.x + (invincibleActiveImg.size.width * 1.1), y: invincibleActiveImg.position.y - (invincibleActiveImg.size.height * 0.45))
                invincibleActiveLbl.zPosition = 4
                invincibleActiveLbl.alpha = 0
                self.addChild(invincibleActiveLbl)
                invincibleActiveLbl.run(fadeIn)
                
                invincibleTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.invincibleTimeFunc), userInfo: nil, repeats: true)
                
                invincibleActive = true
                
            }
        } else if PowerUp.name == "triBallPowerUp" {
            if gameOver == false && triBallActive == false {
                triBallActive = true
                triBallCollected = true
                
                var vector = CGVector()
                
                let shootWait = SKAction.wait(forDuration: 0.5)
                
                var dx = CGFloat(Paddle.position.x - Paddle.position.x)
                var dy = CGFloat(topBarrier.position.y - ball1.position.y)
                
                let magnitude = sqrt(dx * dx + dy * dy)
                
                dx /= magnitude
                dy /= magnitude
                
                if view?.frame.width == 768 && view?.frame.height == 1024 {
                    vector = CGVector(dx: ((view?.frame.width)! / 21) * dx, dy: ((view?.frame.width)! / 21) * dy)
                    // Optional((-1.69431173801422, 671.981262207031))
                    // iPad (5th gen) through pro (9.7 Inch)
                } else if view?.frame.width == 834 && view?.frame.height == 1112 {
                    vector = CGVector(dx: ((view?.frame.width)! / 17) * dx, dy: ((view?.frame.width)! / 17) * dy)
                    // Optional((0.0, 671.755004882812))
                    // iPad pro (10.5 Inch)
                } else if view?.frame.width == 1024 && view?.frame.height == 1366 {
                    vector = CGVector(dx: ((view?.frame.width)! / 9.2) * dx, dy: ((view?.frame.width)! / 9.2) * dy)
                    // Optional((1.39736270904541, 671.98193359375))
                    // iPad pro (12.9 Inch)
                } else if view?.frame.width == 320 && view?.frame.height == 568 {
                    vector = CGVector(dx: ((view?.frame.width)! / 80) * dx, dy: ((view?.frame.width)! / 80) * dy)
                    // Optional((1.63292384147644, 489.585235595703))
                    // iPhone 5s and SE
                } else if view?.frame.width == 375 && view?.frame.height == 667 {
                    vector = CGVector(dx: ((view?.frame.width)! / 60) * dx, dy: ((view?.frame.width)! / 60) * dy)
                    // Optional((2.07877373695374, 489.446929931641))
                    // iPhone 6,7,8
                } else if view?.frame.width == 414 && view?.frame.height ==  736 {
                    vector = CGVector(dx: ((view?.frame.width)! / 56) * dx, dy: ((view?.frame.width)! / 56) * dy)
                    // Optional((1.9209446691093e-05, 489.418579101562))
                    // iPhone 6 plus, 7 plus, 8 plus
                } else if view?.frame.width == 375 && view?.frame.height == 812 {
                    vector = CGVector(dx: ((view?.frame.width)! / 58) * dx, dy: ((view?.frame.width)! / 58) * dy)
                    // Optional((-2.84653806686401, -489.443054199219))
                    // iPhone X
                }
                
                ball2.position = CGPoint(x: paddle.position.x, y:  paddle.position.y + (ball2.size.height))
                self.addChild(ball2)
                ballCount = 2
                ball2.physicsBody?.applyImpulse(vector)
                self.run(shootWait, completion: {
                    if self.gameOver == false {
                        self.addChild(self.ball3)
                        self.ballCount = 3
                        self.ball3.position = CGPoint(x: self.paddle.position.x, y:  self.paddle.position.y + (self.ball3.size.height))
                        self.ball3.physicsBody?.applyImpulse(vector)
                    }
                })
                
            }
        } else if PowerUp.name == "x2ScorePowerUp" {
            if x2Active == true {
                x2Time += 10
                x2ActiveLbl.text = "\(x2Time)"
            } else {
                x2Time = 10
                x2ActiveLbl.text = "\(x2Time)"
            }
            
            if gameOver == false && x2Active == false {
                x2ActiveImg.size = CGSize(width: self.frame.width / 13, height: self.frame.width / 13)
                if invincibleActive == true {
                    x2ActiveImg.position = CGPoint(x: 0 + x2ActiveImg.size.width, y: self.frame.height / 1.18 - (x2ActiveImg.size.height * 1.5))
                } else if invincibleActive == false {
                    x2ActiveImg.position = CGPoint(x: 0 + x2ActiveImg.size.width, y: self.frame.height / 1.18)
                }
                x2ActiveImg.zPosition = 4
                x2ActiveImg.alpha = 0
                self.addChild(x2ActiveImg)
                x2ActiveImg.run(fadeIn)
                
                x2ActiveLbl.text = "\(x2Time)"
                x2ActiveLbl.fontSize = self.frame.width / 15
                x2ActiveLbl.position = CGPoint(x: x2ActiveImg.position.x + (x2ActiveImg.size.width * 1.2), y: x2ActiveImg.position.y - (x2ActiveImg.size.height * 0.3))
                x2ActiveLbl.zPosition = 4
                x2ActiveLbl.alpha = 0
                self.addChild(x2ActiveLbl)
                x2ActiveLbl.run(fadeIn)
                
                x2Timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.x2TimeFunc), userInfo: nil, repeats: true)
                
                x2Active = true
                
            }
        } else if PowerUp.name == "plus100ScorePowerUp" {
            if gameOver == false {
                score += 100
                scoreLbl.text = "\(score)"
            }
        } else if PowerUp.name == "miniBallPowerUp" {
            if gameOver == false && miniBallActive == false {
                miniBallActive = true
                ball1.run(SKAction.scale(to: 0.5, duration: 0.5))
                ball2.run(SKAction.scale(to: 0.5, duration: 0.5))
                ball3.run(SKAction.scale(to: 0.5, duration: 0.5))
                self.run(paddleShrinkTime, completion: {
                    self.ball1.run(SKAction.scale(to: 1, duration: 0.5))
                    self.ball2.run(SKAction.scale(to: 1, duration: 0.5))
                    self.ball3.run(SKAction.scale(to: 1, duration: 0.5))
                    self.miniBallActive = false
                })
            } else if giantBallActive == true {
                ball1.run(SKAction.scale(to: 1, duration: 0.5))
                ball2.run(SKAction.scale(to: 1, duration: 0.5))
                ball3.run(SKAction.scale(to: 1, duration: 0.5))
                giantBallActive = false
            } else {
                
            }
        } else if PowerUp.name == "giantBallPowerUp" {
            if gameOver == false && giantBallActive == false {
                giantBallActive = true
                ball1.run(SKAction.scale(to: 2, duration: 0.5))
                ball2.run(SKAction.scale(to: 2, duration: 0.5))
                ball3.run(SKAction.scale(to: 2, duration: 0.5))
                self.run(paddleGrowTime, completion: {
                    self.ball1.run(SKAction.scale(to: 1, duration: 0.5))
                    self.ball2.run(SKAction.scale(to: 1, duration: 0.5))
                    self.ball3.run(SKAction.scale(to: 1, duration: 0.5))
                    self.giantBallActive = false
                })
            } else if miniBallActive == true {
                self.miniBallActive = false
                ball1.run(SKAction.scale(to: 1, duration: 0.5))
                ball2.run(SKAction.scale(to: 1, duration: 0.5))
                ball3.run(SKAction.scale(to: 1, duration: 0.5))
            } else {
                
            }
        }
        
        PowerUp.removeFromParent()
        powerUpExplosion.position = PowerUp.position
        self.addChild(powerUpExplosion)
        self.run(explosionWait, completion: {
            powerUpExplosion.removeFromParent()
        })
    }
    
    func powerUpHitBottomBarrier(PowerUp: SKSpriteNode, BottomBarrier: SKSpriteNode) {
        PowerUp.removeFromParent()
        if PowerUp.name == "triBallPowerUp" {
            triBallDropped = false
        }
    }
    
    func ballHitBottomBarrier(Ball: SKSpriteNode, BottomBarrier: SKSpriteNode) {
        let explosionWait = SKAction.wait(forDuration: 0.8)
        let ballExplosion = SKEmitterNode()
        let ballParticleTexture = self.ball1.texture
        
        ballExplosion.particleTexture = ballParticleTexture
        ballExplosion.particleSize = CGSize(width: self.frame.width / 20, height: self.frame.height / 26)
        ballExplosion.physicsBody = SKPhysicsBody(circleOfRadius: ballExplosion.particleSize.width)
        ballExplosion.physicsBody?.affectedByGravity = true
        ballExplosion.physicsBody?.categoryBitMask = PhysicsCategory.ExplosionParticles
        ballExplosion.physicsBody?.contactTestBitMask = 0
        ballExplosion.physicsBody?.collisionBitMask = 0
        ballExplosion.particleBirthRate = 100
        ballExplosion.particleAlpha = 1
        ballExplosion.particleLifetime = 0.5
        ballExplosion.particleAlpha = 1
        ballExplosion.emissionAngle = 90
        ballExplosion.emissionAngleRange = 180
        ballExplosion.particleSpeed = 450
        ballExplosion.particleSpeedRange = 150
        ballExplosion.alpha = 1
        ballExplosion.particleScale = 0.5
        ballExplosion.zPosition = 3
        ballExplosion.particleLifetimeRange = 0
        ballExplosion.particlePositionRange = CGVector(dx: 0, dy: 0)
        ballExplosion.zPosition = 5
        
        if invincibleActive == false {
            if ballCount == 1 {
                gameOver = true
                pauseBtn.run(fadeOut)
                ggLbl.run(fadeIn)
                retryBtn.run(fadeIn)
                mainMenuBtn.run(fadeIn)
                
                Ball.removeFromParent()
                ballExplosion.position = Ball.position
                self.addChild(ballExplosion)
                self.run(explosionWait, completion: {
                    ballExplosion.removeFromParent()
                })
                
                if ch3lvl23Unlocked == true {
                    nextBtn.run(fadeIn)
                }
                
            } else if ballCount >= 2 {
                ballCount -= 1
                Ball.removeFromParent()
                ballExplosion.position = Ball.position
                self.addChild(ballExplosion)
                self.run(explosionWait, completion: {
                    ballExplosion.removeFromParent()
                })
            }
        } else {
            print("Invinible ball is active!")
        }
    }
    
    func explosionRadiusHitBrick(Radius: SKSpriteNode, Brick: SKSpriteNode) {
        let explosionWait = SKAction.wait(forDuration: 0.6)
        let brickExplosion = SKEmitterNode()
        let brickParticleTexture = SKTexture(imageNamed: "brick2ExplosionParticle")
        
        brickExplosion.particleTexture = brickParticleTexture
        brickExplosion.particleSize = CGSize(width: self.frame.width / 20, height: self.frame.height / 26)
        brickExplosion.physicsBody = SKPhysicsBody(circleOfRadius: brickExplosion.particleSize.width)
        brickExplosion.physicsBody?.affectedByGravity = true
        brickExplosion.physicsBody?.categoryBitMask = PhysicsCategory.ExplosionParticles
        brickExplosion.physicsBody?.contactTestBitMask = 0
        brickExplosion.physicsBody?.collisionBitMask = 0
        brickExplosion.particleBirthRate = 100
        brickExplosion.particleAlpha = 1
        brickExplosion.particleLifetime = 0.5
        brickExplosion.particleAlpha = 1
        brickExplosion.emissionAngle = 360
        brickExplosion.emissionAngleRange = 25
        brickExplosion.particleSpeed = 75
        brickExplosion.particleSpeedRange = 50
        brickExplosion.alpha = 1
        brickExplosion.particleScale = 0.5
        brickExplosion.zPosition = 3
        brickExplosion.particleLifetimeRange = 0
        brickExplosion.particlePositionRange = CGVector(dx: 0, dy: 0)
        brickExplosion.zPosition = 5
        
        if Brick.name == "brick1" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[0] == 6 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[0] == 5 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[0] == 4 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[0] == 3 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[0] == 2 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[0] == 1 {
                brickLives[0] -= 1
                brickCount -= 1
                brick1.removeFromParent()
                brickExplosion.position = brick1.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick2" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[1] == 6 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[1] == 5 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[1] == 4 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[1] == 3 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[1] == 2 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[1] == 1 {
                brickLives[1] -= 1
                brickCount -= 1
                brick2.removeFromParent()
                brickExplosion.position = brick2.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        if Brick.name == "brick3" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[2] == 6 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[2] == 5 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[2] == 4 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[2] == 3 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[2] == 2 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[2] == 1 {
                brickLives[2] -= 1
                brickCount -= 1
                brick3.removeFromParent()
                brickExplosion.position = brick3.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick4" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[3] == 6 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[3] == 5 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[3] == 4 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[3] == 3 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[3] == 2 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[3] == 1 {
                brickLives[3] -= 1
                brickCount -= 1
                brick4.removeFromParent()
                brickExplosion.position = brick4.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick5" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[4] == 6 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[4] == 5 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[4] == 4 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[4] == 3 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[4] == 2 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[4] == 1 {
                brickLives[4] -= 1
                brickCount -= 1
                brick5.removeFromParent()
                brickExplosion.position = brick5.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick6" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[5] == 6 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[5] == 5 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[5] == 4 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[5] == 3 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[5] == 2 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[5] == 1 {
                brickLives[5] -= 1
                brickCount -= 1
                brick6.removeFromParent()
                brickExplosion.position = brick6.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick7" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[6] == 6 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[6] == 5 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[6] == 4 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[6] == 3 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[6] == 2 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[6] == 1 {
                brickLives[6] -= 1
                brickCount -= 1
                brick7.removeFromParent()
                brickExplosion.position = brick7.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick8" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[7] == 6 {
                brickLives[7] -= 1
                brick8.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[7] == 5 {
                brickLives[7] -= 1
                brick8.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[7] == 4 {
                brickLives[7] -= 1
                brick8.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[7] == 3 {
                brickLives[7] -= 1
                brick8.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[7] == 2 {
                brickLives[7] -= 1
                brick8.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[7] == 1 {
                brickLives[7] -= 1
                brickCount -= 1
                brick8.removeFromParent()
                brickExplosion.position = brick8.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick9" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[8] == 6 {
                brickLives[8] -= 1
                brick9.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[8] == 5 {
                brickLives[8] -= 1
                brick9.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[8] == 4 {
                brickLives[8] -= 1
                brick9.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[8] == 3 {
                brickLives[8] -= 1
                brick9.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[8] == 2 {
                brickLives[8] -= 1
                brick9.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[8] == 1 {
                brickLives[8] -= 1
                brickCount -= 1
                brick9.removeFromParent()
                brickExplosion.position = brick9.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick10" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[9] == 6 {
                brickLives[9] -= 1
                brick10.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[9] == 5 {
                brickLives[9] -= 1
                brick10.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[9] == 4 {
                brickLives[9] -= 1
                brick10.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[9] == 3 {
                brickLives[9] -= 1
                brick10.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[9] == 2 {
                brickLives[9] -= 1
                brick10.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[9] == 1 {
                brickLives[9] -= 1
                brickCount -= 1
                brick10.removeFromParent()
                brickExplosion.position = brick10.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick11" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[10] == 6 {
                brickLives[10] -= 1
                brick11.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[10] == 5 {
                brickLives[10] -= 1
                brick11.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[10] == 4 {
                brickLives[10] -= 1
                brick11.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[10] == 3 {
                brickLives[10] -= 1
                brick11.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[10] == 2 {
                brickLives[10] -= 1
                brick11.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[10] == 1 {
                brickLives[10] -= 1
                brickCount -= 1
                brick11.removeFromParent()
                brickExplosion.position = brick11.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick12" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[11] == 6 {
                brickLives[11] -= 1
                brick12.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[11] == 5 {
                brickLives[11] -= 1
                brick12.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[11] == 4 {
                brickLives[11] -= 1
                brick12.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[11] == 3 {
                brickLives[11] -= 1
                brick12.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[11] == 2 {
                brickLives[11] -= 1
                brick12.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[11] == 1 {
                brickLives[11] -= 1
                brickCount -= 1
                brick12.removeFromParent()
                brickExplosion.position = brick12.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick13" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[12] == 6 {
                brickLives[12] -= 1
                brick13.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[12] == 5 {
                brickLives[12] -= 1
                brick13.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[12] == 4 {
                brickLives[12] -= 1
                brick13.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[12] == 3 {
                brickLives[12] -= 1
                brick13.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[12] == 2 {
                brickLives[12] -= 1
                brick13.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[12] == 1 {
                brickLives[12] -= 1
                brickCount -= 1
                brick13.removeFromParent()
                brickExplosion.position = brick13.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick14" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[13] == 6 {
                brickLives[13] -= 1
                brick14.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[13] == 5 {
                brickLives[13] -= 1
                brick14.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[13] == 4 {
                brickLives[13] -= 1
                brick14.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[13] == 3 {
                brickLives[13] -= 1
                brick14.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[13] == 2 {
                brickLives[13] -= 1
                brick14.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[13] == 1 {
                brickLives[13] -= 1
                brickCount -= 1
                brick14.removeFromParent()
                brickExplosion.position = brick14.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick15" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[14] == 6 {
                brickLives[14] -= 1
                brick15.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[14] == 5 {
                brickLives[14] -= 1
                brick15.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[14] == 4 {
                brickLives[14] -= 1
                brick15.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[14] == 3 {
                brickLives[14] -= 1
                brick15.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[14] == 2 {
                brickLives[14] -= 1
                brick15.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[14] == 1 {
                brickLives[14] -= 1
                brickCount -= 1
                brick15.removeFromParent()
                brickExplosion.position = brick15.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick16" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[15] == 6 {
                brickLives[15] -= 1
                brick16.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[15] == 5 {
                brickLives[15] -= 1
                brick16.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[15] == 4 {
                brickLives[15] -= 1
                brick16.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[15] == 3 {
                brickLives[15] -= 1
                brick16.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[15] == 2 {
                brickLives[15] -= 1
                brick16.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[15] == 1 {
                brickLives[15] -= 1
                brickCount -= 1
                brick16.removeFromParent()
                brickExplosion.position = brick16.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick17" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[16] == 6 {
                brickLives[16] -= 1
                brick17.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[16] == 5 {
                brickLives[16] -= 1
                brick17.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[16] == 4 {
                brickLives[16] -= 1
                brick17.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[16] == 3 {
                brickLives[16] -= 1
                brick17.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[16] == 2 {
                brickLives[16] -= 1
                brick17.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[16] == 1 {
                brickLives[16] -= 1
                brickCount -= 1
                brick17.removeFromParent()
                brickExplosion.position = brick17.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick18" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[17] == 6 {
                brickLives[17] -= 1
                brick18.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[17] == 5 {
                brickLives[17] -= 1
                brick18.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[17] == 4 {
                brickLives[17] -= 1
                brick18.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[17] == 3 {
                brickLives[17] -= 1
                brick18.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[17] == 2 {
                brickLives[17] -= 1
                brick18.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[17] == 1 {
                brickLives[17] -= 1
                brickCount -= 1
                brick18.removeFromParent()
                brickExplosion.position = brick18.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick19" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[18] == 6 {
                brickLives[18] -= 1
                brick19.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[18] == 5 {
                brickLives[18] -= 1
                brick19.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[18] == 4 {
                brickLives[18] -= 1
                brick19.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[18] == 3 {
                brickLives[18] -= 1
                brick19.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[18] == 2 {
                brickLives[18] -= 1
                brick19.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[18] == 1 {
                brickLives[18] -= 1
                brickCount -= 1
                brick19.removeFromParent()
                brickExplosion.position = brick19.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick20" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[19] == 6 {
                brickLives[19] -= 1
                brick20.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[19] == 5 {
                brickLives[19] -= 1
                brick20.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[19] == 4 {
                brickLives[19] -= 1
                brick20.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[19] == 3 {
                brickLives[19] -= 1
                brick20.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[19] == 2 {
                brickLives[19] -= 1
                brick20.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[19] == 1 {
                brickLives[19] -= 1
                brickCount -= 1
                brick20.removeFromParent()
                brickExplosion.position = brick20.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick21" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[20] == 6 {
                brickLives[20] -= 1
                brick21.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[20] == 5 {
                brickLives[20] -= 1
                brick21.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[20] == 4 {
                brickLives[20] -= 1
                brick21.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[20] == 3 {
                brickLives[20] -= 1
                brick21.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[20] == 2 {
                brickLives[20] -= 1
                brick21.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[20] == 1 {
                brickLives[20] -= 1
                brickCount -= 1
                brick21.removeFromParent()
                brickExplosion.position = brick21.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick22" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[21] == 6 {
                brickLives[21] -= 1
                brick22.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[21] == 5 {
                brickLives[21] -= 1
                brick22.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[21] == 4 {
                brickLives[21] -= 1
                brick22.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[21] == 3 {
                brickLives[21] -= 1
                brick22.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[21] == 2 {
                brickLives[21] -= 1
                brick22.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[21] == 1 {
                brickLives[21] -= 1
                brickCount -= 1
                brick22.removeFromParent()
                brickExplosion.position = brick22.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick23" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[22] == 6 {
                brickLives[22] -= 1
                brick23.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[22] == 5 {
                brickLives[22] -= 1
                brick23.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[22] == 4 {
                brickLives[22] -= 1
                brick23.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[22] == 3 {
                brickLives[22] -= 1
                brick23.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[22] == 2 {
                brickLives[22] -= 1
                brick23.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[22] == 1 {
                brickLives[22] -= 1
                brickCount -= 1
                brick23.removeFromParent()
                brickExplosion.position = brick23.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick24" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[23] == 6 {
                brickLives[23] -= 1
                brick24.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[23] == 5 {
                brickLives[23] -= 1
                brick24.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[23] == 4 {
                brickLives[23] -= 1
                brick24.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[23] == 3 {
                brickLives[23] -= 1
                brick24.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[23] == 2 {
                brickLives[223] -= 1
                brick24.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[23] == 1 {
                brickLives[23] -= 1
                brickCount -= 1
                brick24.removeFromParent()
                brickExplosion.position = brick24.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick25" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[24] == 6 {
                brickLives[24] -= 1
                brick25.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[24] == 5 {
                brickLives[24] -= 1
                brick25.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[24] == 4 {
                brickLives[24] -= 1
                brick25.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[24] == 3 {
                brickLives[24] -= 1
                brick25.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[24] == 2 {
                brickLives[24] -= 1
                brick25.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[24] == 1 {
                brickLives[24] -= 1
                brickCount -= 1
                brick25.removeFromParent()
                brickExplosion.position = brick25.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick26" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[25] == 6 {
                brickLives[25] -= 1
                brick26.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[25] == 5 {
                brickLives[25] -= 1
                brick26.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[25] == 4 {
                brickLives[25] -= 1
                brick26.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[25] == 3 {
                brickLives[25] -= 1
                brick26.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[25] == 2 {
                brickLives[25] -= 1
                brick26.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[25] == 1 {
                brickLives[25] -= 1
                brickCount -= 1
                brick26.removeFromParent()
                brickExplosion.position = brick26.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick27" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[26] == 6 {
                brickLives[26] -= 1
                brick27.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[26] == 5 {
                brickLives[26] -= 1
                brick27.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[26] == 4 {
                brickLives[26] -= 1
                brick27.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[26] == 3 {
                brickLives[26] -= 1
                brick27.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[26] == 2 {
                brickLives[26] -= 1
                brick27.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[26] == 1 {
                brickLives[26] -= 1
                brickCount -= 1
                brick27.removeFromParent()
                brickExplosion.position = brick27.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick28" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[27] == 6 {
                brickLives[27] -= 1
                brick28.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[27] == 5 {
                brickLives[27] -= 1
                brick28.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[27] == 4 {
                brickLives[27] -= 1
                brick28.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[27] == 3 {
                brickLives[27] -= 1
                brick28.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[27] == 2 {
                brickLives[27] -= 1
                brick28.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[27] == 1 {
                brickLives[27] -= 1
                brickCount -= 1
                brick28.removeFromParent()
                brickExplosion.position = brick28.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick29" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[28] == 6 {
                brickLives[28] -= 1
                brick29.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[28] == 5 {
                brickLives[28] -= 1
                brick29.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[28] == 4 {
                brickLives[28] -= 1
                brick29.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[28] == 3 {
                brickLives[28] -= 1
                brick29.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[28] == 2 {
                brickLives[28] -= 1
                brick29.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[28] == 1 {
                brickLives[28] -= 1
                brickCount -= 1
                brick29.removeFromParent()
                brickExplosion.position = brick29.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick30" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[29] == 6 {
                brickLives[29] -= 1
                brick30.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[29] == 5 {
                brickLives[29] -= 1
                brick30.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[29] == 4 {
                brickLives[29] -= 1
                brick30.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[29] == 3 {
                brickLives[29] -= 1
                brick30.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[29] == 2 {
                brickLives[29] -= 1
                brick30.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[29] == 1 {
                brickLives[29] -= 1
                brickCount -= 1
                brick30.removeFromParent()
                brickExplosion.position = brick30.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick31" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[30] == 6 {
                brickLives[30] -= 1
                brick31.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[30] == 5 {
                brickLives[30] -= 1
                brick31.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[30] == 4 {
                brickLives[30] -= 1
                brick31.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[30] == 3 {
                brickLives[30] -= 1
                brick31.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[30] == 2 {
                brickLives[30] -= 1
                brick31.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[30] == 1 {
                brickLives[30] -= 1
                brickCount -= 1
                brick31.removeFromParent()
                brickExplosion.position = brick31.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick32" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[31] == 6 {
                brickLives[31] -= 1
                brick32.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[31] == 5 {
                brickLives[31] -= 1
                brick32.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[31] == 4 {
                brickLives[31] -= 1
                brick32.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[31] == 3 {
                brickLives[31] -= 1
                brick32.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[31] == 2 {
                brickLives[31] -= 1
                brick32.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[31] == 1 {
                brickLives[31] -= 1
                brickCount -= 1
                brick32.removeFromParent()
                brickExplosion.position = brick32.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick33" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[32] == 6 {
                brickLives[32] -= 1
                brick33.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[32] == 5 {
                brickLives[32] -= 1
                brick33.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[32] == 4 {
                brickLives[32] -= 1
                brick33.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[32] == 3 {
                brickLives[32] -= 1
                brick33.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[32] == 2 {
                brickLives[32] -= 1
                brick33.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[32] == 1 {
                brickLives[32] -= 1
                brickCount -= 1
                brick33.removeFromParent()
                brickExplosion.position = brick33.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick34" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[33] == 6 {
                brickLives[33] -= 1
                brick34.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[33] == 5 {
                brickLives[33] -= 1
                brick34.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[33] == 4 {
                brickLives[33] -= 1
                brick34.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[33] == 3 {
                brickLives[33] -= 1
                brick34.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[33] == 2 {
                brickLives[33] -= 1
                brick34.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[33] == 1 {
                brickLives[33] -= 1
                brickCount -= 1
                brick34.removeFromParent()
                brickExplosion.position = brick34.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick35" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[34] == 6 {
                brickLives[34] -= 1
                brick35.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[34] == 5 {
                brickLives[34] -= 1
                brick35.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[34] == 4 {
                brickLives[34] -= 1
                brick35.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[34] == 3 {
                brickLives[34] -= 1
                brick35.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[34] == 2 {
                brickLives[34] -= 1
                brick35.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[34] == 1 {
                brickLives[34] -= 1
                brickCount -= 1
                brick35.removeFromParent()
                brickExplosion.position = brick35.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick36" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[35] == 6 {
                brickLives[35] -= 1
                brick36.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[35] == 5 {
                brickLives[35] -= 1
                brick36.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[35] == 4 {
                brickLives[35] -= 1
                brick36.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[35] == 3 {
                brickLives[35] -= 1
                brick36.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[35] == 2 {
                brickLives[35] -= 1
                brick36.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[35] == 1 {
                brickLives[35] -= 1
                brickCount -= 1
                brick36.removeFromParent()
                brickExplosion.position = brick36.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick37" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[36] == 6 {
                brickLives[36] -= 1
                brick37.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[36] == 5 {
                brickLives[36] -= 1
                brick37.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[36] == 4 {
                brickLives[36] -= 1
                brick37.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[36] == 3 {
                brickLives[36] -= 1
                brick37.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[36] == 2 {
                brickLives[36] -= 1
                brick37.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[36] == 1 {
                brickLives[36] -= 1
                brickCount -= 1
                brick37.removeFromParent()
                brickExplosion.position = brick37.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick38" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[37] == 6 {
                brickLives[37] -= 1
                brick38.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[37] == 5 {
                brickLives[37] -= 1
                brick38.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[37] == 4 {
                brickLives[37] -= 1
                brick38.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[37] == 3 {
                brickLives[37] -= 1
                brick38.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[37] == 2 {
                brickLives[37] -= 1
                brick38.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[37] == 1 {
                brickLives[37] -= 1
                brickCount -= 1
                brick38.removeFromParent()
                brickExplosion.position = brick38.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick39" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[38] == 6 {
                brickLives[38] -= 1
                brick39.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[38] == 5 {
                brickLives[38] -= 1
                brick39.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[38] == 4 {
                brickLives[38] -= 1
                brick39.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[38] == 3 {
                brickLives[38] -= 1
                brick39.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[38] == 2 {
                brickLives[38] -= 1
                brick39.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[38] == 1 {
                brickLives[38] -= 1
                brickCount -= 1
                brick39.removeFromParent()
                brickExplosion.position = brick39.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick40" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[39] == 6 {
                brickLives[39] -= 1
                brick40.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[39] == 5 {
                brickLives[39] -= 1
                brick40.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[39] == 4 {
                brickLives[39] -= 1
                brick40.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[39] == 3 {
                brickLives[39] -= 1
                brick40.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[39] == 2 {
                brickLives[39] -= 1
                brick40.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[39] == 1 {
                brickLives[39] -= 1
                brickCount -= 1
                brick40.removeFromParent()
                brickExplosion.position = brick40.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick41" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[40] == 6 {
                brickLives[40] -= 1
                brick41.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[40] == 5 {
                brickLives[40] -= 1
                brick41.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[40] == 4 {
                brickLives[40] -= 1
                brick41.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[40] == 3 {
                brickLives[40] -= 1
                brick41.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[40] == 2 {
                brickLives[40] -= 1
                brick41.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[40] == 1 {
                brickLives[40] -= 1
                brickCount -= 1
                brick41.removeFromParent()
                brickExplosion.position = brick41.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick42" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[41] == 6 {
                brickLives[41] -= 1
                brick42.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[41] == 5 {
                brickLives[41] -= 1
                brick42.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[41] == 4 {
                brickLives[41] -= 1
                brick42.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[41] == 3 {
                brickLives[41] -= 1
                brick42.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[41] == 2 {
                brickLives[41] -= 1
                brick42.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[41] == 1 {
                brickLives[41] -= 1
                brickCount -= 1
                brick42.removeFromParent()
                brickExplosion.position = brick42.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick43" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[42] == 6 {
                brickLives[42] -= 1
                brick43.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[42] == 5 {
                brickLives[42] -= 1
                brick43.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[42] == 4 {
                brickLives[42] -= 1
                brick43.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[42] == 3 {
                brickLives[42] -= 1
                brick43.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[42] == 2 {
                brickLives[42] -= 1
                brick43.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[42] == 1 {
                brickLives[42] -= 1
                brickCount -= 1
                brick43.removeFromParent()
                brickExplosion.position = brick43.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick44" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[43] == 6 {
                brickLives[43] -= 1
                brick44.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[43] == 5 {
                brickLives[43] -= 1
                brick44.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[43] == 4 {
                brickLives[43] -= 1
                brick44.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[43] == 3 {
                brickLives[43] -= 1
                brick44.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[43] == 2 {
                brickLives[43] -= 1
                brick44.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[43] == 1 {
                brickLives[43] -= 1
                brickCount -= 1
                brick44.removeFromParent()
                brickExplosion.position = brick44.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick45" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[44] == 6 {
                brickLives[44] -= 1
                brick45.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[44] == 5 {
                brickLives[44] -= 1
                brick45.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[44] == 4 {
                brickLives[44] -= 1
                brick45.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[44] == 3 {
                brickLives[44] -= 1
                brick45.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[44] == 2 {
                brickLives[44] -= 1
                brick45.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[44] == 1 {
                brickLives[44] -= 1
                brickCount -= 1
                brick45.removeFromParent()
                brickExplosion.position = brick45.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick46" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[45] == 6 {
                brickLives[45] -= 1
                brick46.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[45] == 5 {
                brickLives[45] -= 1
                brick46.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[45] == 4 {
                brickLives[45] -= 1
                brick46.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[45] == 3 {
                brickLives[45] -= 1
                brick46.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[45] == 2 {
                brickLives[45] -= 1
                brick46.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[45] == 1 {
                brickLives[45] -= 1
                brickCount -= 1
                brick46.removeFromParent()
                brickExplosion.position = brick46.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick47" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[46] == 6 {
                brickLives[46] -= 1
                brick47.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[46] == 5 {
                brickLives[46] -= 1
                brick47.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[46] == 4 {
                brickLives[46] -= 1
                brick47.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[46] == 3 {
                brickLives[46] -= 1
                brick47.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[46] == 2 {
                brickLives[46] -= 1
                brick47.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[46] == 1 {
                brickLives[46] -= 1
                brickCount -= 1
                brick47.removeFromParent()
                brickExplosion.position = brick47.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick49" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[48] == 6 {
                brickLives[48] -= 1
                brick49.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[48] == 5 {
                brickLives[48] -= 1
                brick49.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[48] == 4 {
                brickLives[48] -= 1
                brick49.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[48] == 3 {
                brickLives[48] -= 1
                brick49.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[48] == 2 {
                brickLives[48] -= 1
                brick49.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[48] == 1 {
                brickLives[48] -= 1
                brickCount -= 1
                brick49.removeFromParent()
                brickExplosion.position = brick49.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick50" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[49] == 6 {
                brickLives[49] -= 1
                brick50.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[49] == 5 {
                brickLives[49] -= 1
                brick50.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[49] == 4 {
                brickLives[49] -= 1
                brick50.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[49] == 3 {
                brickLives[49] -= 1
                brick50.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[49] == 2 {
                brickLives[49] -= 1
                brick50.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[49] == 1 {
                brickLives[49] -= 1
                brickCount -= 1
                brick50.removeFromParent()
                brickExplosion.position = brick50.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick51" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[50] == 6 {
                brickLives[50] -= 1
                brick51.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[50] == 5 {
                brickLives[50] -= 1
                brick51.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[50] == 4 {
                brickLives[50] -= 1
                brick51.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[50] == 3 {
                brickLives[50] -= 1
                brick51.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[50] == 2 {
                brickLives[50] -= 1
                brick51.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[50] == 1 {
                brickLives[50] -= 1
                brickCount -= 1
                brick51.removeFromParent()
                brickExplosion.position = brick51.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick52" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[51] == 6 {
                brickLives[51] -= 1
                brick52.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[51] == 5 {
                brickLives[51] -= 1
                brick52.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[51] == 4 {
                brickLives[51] -= 1
                brick52.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[51] == 3 {
                brickLives[51] -= 1
                brick52.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[51] == 2 {
                brickLives[51] -= 1
                brick52.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[51] == 1 {
                brickLives[51] -= 1
                brickCount -= 1
                brick52.removeFromParent()
                brickExplosion.position = brick52.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick53" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[52] == 6 {
                brickLives[52] -= 1
                brick53.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[52] == 5 {
                brickLives[52] -= 1
                brick53.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[52] == 4 {
                brickLives[52] -= 1
                brick53.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[52] == 3 {
                brickLives[52] -= 1
                brick53.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[52] == 2 {
                brickLives[52] -= 1
                brick53.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[52] == 1 {
                brickLives[52] -= 1
                brickCount -= 1
                brick53.removeFromParent()
                brickExplosion.position = brick53.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick54" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[53] == 6 {
                brickLives[53] -= 1
                brick54.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[53] == 5 {
                brickLives[53] -= 1
                brick54.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[53] == 4 {
                brickLives[53] -= 1
                brick54.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[53] == 3 {
                brickLives[53] -= 1
                brick54.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[53] == 2 {
                brickLives[53] -= 1
                brick54.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[53] == 1 {
                brickLives[53] -= 1
                brickCount -= 1
                brick54.removeFromParent()
                brickExplosion.position = brick54.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick55" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[54] == 6 {
                brickLives[54] -= 1
                brick55.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[54] == 5 {
                brickLives[54] -= 1
                brick55.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[54] == 4 {
                brickLives[54] -= 1
                brick55.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[54] == 3 {
                brickLives[54] -= 1
                brick55.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[54] == 2 {
                brickLives[54] -= 1
                brick55.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[54] == 1 {
                brickLives[54] -= 1
                brickCount -= 1
                brick55.removeFromParent()
                brickExplosion.position = brick55.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if Brick.name == "brick56" {
            score += 10
            scoreLbl.text = "\(score)"
            
            if brickLives[55] == 6 {
                brickLives[55] -= 1
                brick56.texture = SKTexture(imageNamed: "brick2Texture5")
            } else if brickLives[55] == 5 {
                brickLives[55] -= 1
                brick56.texture = SKTexture(imageNamed: "brick2Texture4")
            } else if brickLives[55] == 4 {
                brickLives[55] -= 1
                brick56.texture = SKTexture(imageNamed: "brick2Texture3")
            } else if brickLives[55] == 3 {
                brickLives[55] -= 1
                brick56.texture = SKTexture(imageNamed: "brick2Texture2")
            } else if brickLives[55] == 2 {
                brickLives[55] -= 1
                brick56.texture = SKTexture(imageNamed: "brick2Texture1")
            } else if brickLives[55] == 1 {
                brickLives[55] -= 1
                brickCount -= 1
                brick56.removeFromParent()
                brickExplosion.position = brick56.position
                self.addChild(brickExplosion)
                self.run(explosionWait, completion: {
                    brickExplosion.removeFromParent()
                })
            }
        }
        
        if brickCount == 0 {
            print("ch3lv22 completed")
            gameOver = true
            
            if ch3lvl23Unlocked == false {
                continueString = "ch3lvl23"
                UserDefaults.standard.set("ch3lvl23", forKey: "continueString")
            }
            ch3lvl23Unlocked = true
            UserDefaults.standard.set(true, forKey: "ch3lvl23Unlocked")
            UserDefaults.standard.synchronize()
            
            let explosionWait = SKAction.wait(forDuration: 0.6)
            let ballExplosion = SKEmitterNode()
            let ballParticleTexture = self.ball1.texture
            
            ballExplosion.particleTexture = ballParticleTexture
            ballExplosion.particleSize = CGSize(width: self.frame.width / 20, height: self.frame.height / 26)
            ballExplosion.physicsBody = SKPhysicsBody(circleOfRadius: ballExplosion.particleSize.width)
            ballExplosion.physicsBody?.affectedByGravity = true
            ballExplosion.physicsBody?.categoryBitMask = PhysicsCategory.ExplosionParticles
            ballExplosion.physicsBody?.contactTestBitMask = 0
            ballExplosion.physicsBody?.collisionBitMask = 0
            ballExplosion.particleBirthRate = 100
            ballExplosion.particleAlpha = 1
            ballExplosion.particleLifetime = 0.5
            ballExplosion.particleAlpha = 1
            ballExplosion.emissionAngle = 360
            ballExplosion.emissionAngleRange = 25
            ballExplosion.particleSpeed = 75
            ballExplosion.particleSpeedRange = 50
            ballExplosion.alpha = 1
            ballExplosion.particleScale = 0.5
            ballExplosion.zPosition = 3
            ballExplosion.particleLifetimeRange = 0
            ballExplosion.particlePositionRange = CGVector(dx: 0, dy: 0)
            ballExplosion.zPosition = 5
            
            ball1.removeFromParent()
            ball2.removeFromParent()
            ball3.removeFromParent()
            ballExplosion.position = self.ball1.position
            self.addChild(ballExplosion)
            self.run(explosionWait, completion: {
                ballExplosion.removeFromParent()
                
                let scene = ch3lvl23Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            })
            
        }
        
    }
    
    func rocketHitStoppingPoint(Rocket: SKSpriteNode, StoppingPoint: SKSpriteNode) {
        let explosionWait = SKAction.wait(forDuration: 0.6)
        let rocketExplosion = SKEmitterNode()
        let rocketParticleTexture = SKTexture(imageNamed: "rocketExplosionParticle")
        
        rocketExplosion.particleTexture = rocketParticleTexture
        rocketExplosion.particleSize = CGSize(width: self.frame.width / 10, height: self.frame.height / 13)
        rocketExplosion.physicsBody = SKPhysicsBody(circleOfRadius: rocketExplosion.particleSize.width)
        rocketExplosion.physicsBody?.affectedByGravity = true
        rocketExplosion.physicsBody?.categoryBitMask = PhysicsCategory.ExplosionParticles
        rocketExplosion.physicsBody?.contactTestBitMask = 0
        rocketExplosion.physicsBody?.collisionBitMask = 0
        rocketExplosion.particleBirthRate = 100
        rocketExplosion.particleAlpha = 1
        rocketExplosion.particleLifetime = 0.5
        rocketExplosion.particleAlpha = 1
        rocketExplosion.emissionAngle = 360
        rocketExplosion.emissionAngleRange = 25
        rocketExplosion.particleSpeed = 75
        rocketExplosion.particleSpeedRange = 50
        rocketExplosion.alpha = 1
        rocketExplosion.particleScale = 0.5
        rocketExplosion.zPosition = 3
        rocketExplosion.particleLifetimeRange = 0
        rocketExplosion.particlePositionRange = CGVector(dx: 0, dy: 0)
        rocketExplosion.zPosition = 5
        
        let explosionTime = SKAction.wait(forDuration: 0.1)
        
        let rocketRadius = SKSpriteNode()
        rocketRadius.size = CGSize(width: 1, height: 1)
        rocketRadius.position = Rocket.position
        rocketRadius.name = "rocketExplosionRadius"
        rocketRadius.zPosition = 1
        rocketRadius.color = SKColor.yellow
        rocketRadius.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.width / 3)
        rocketRadius.physicsBody?.affectedByGravity = false
        rocketRadius.physicsBody?.isDynamic = true
        rocketRadius.physicsBody?.categoryBitMask = PhysicsCategory.RocketExplosion
        rocketRadius.physicsBody?.collisionBitMask = PhysicsCategory.Brick | 0
        rocketRadius.physicsBody?.contactTestBitMask = PhysicsCategory.Brick | 0
        
        if gameOver == false {
            self.addChild(rocketRadius)
        }
        
        Rocket.removeFromParent()
        
        rocketExplosion.position = Rocket.position
        self.addChild(rocketExplosion)
        self.run(explosionWait, completion: {
            rocketExplosion.removeFromParent()
        })
        
        self.run(explosionTime, completion: {
            rocketRadius.removeFromParent()
        })
        
    }
    
    func checkBallVelocity(Ball: SKSpriteNode, Barrier: SKSpriteNode) {
        var maxSpeed = CGFloat()
        var minSpeed = CGFloat()
        
        if view?.frame.width == 768 && view?.frame.height == 1024 {
            maxSpeed = 29
            minSpeed = 28
            // Optional((-1.69431173801422, 671.981262207031))
            // iPad (5th gen) through pro (9.7 Inch)
        } else if view?.frame.width == 834 && view?.frame.height == 1112 {
            maxSpeed = 30
            minSpeed = 29
            // Optional((0.0, 671.755004882812))
            // iPad pro (10.5 Inch)
        } else if view?.frame.width == 1024 && view?.frame.height == 1366 {
            maxSpeed = 30
            minSpeed = 29
            // Optional((1.39736270904541, 671.98193359375))
            // iPad pro (12.9 Inch)
        } else if view?.frame.width == 320 && view?.frame.height == 568 {
            maxSpeed = 22
            minSpeed = 23
            // Optional((1.63292384147644, 489.585235595703))
            // iPhone 5s and SE
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            maxSpeed = 22
            minSpeed = 23
            // Optional((2.07877373695374, 489.446929931641))
            // iPhone 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            maxSpeed = 22
            minSpeed = 23
            // Optional((1.9209446691093e-05, 489.418579101562))
            // iPhone 6 plus, 7 plus, 8 plus
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            maxSpeed = 22
            minSpeed = 23
            // Optional((-2.84653806686401, -489.443054199219))
            // iPhone X
        }
        
        let dxSpeed1 = fabs(CGFloat((ball1.physicsBody?.velocity.dx)!))
        let dySpeed1 = fabs(CGFloat((ball1.physicsBody?.velocity.dy)!))
        
        let dxSpeed2 = fabs(CGFloat((ball2.physicsBody?.velocity.dx)!))
        let dySpeed2 = fabs(CGFloat((ball2.physicsBody?.velocity.dy)!))
        
        let dxSpeed3 = fabs(CGFloat((ball3.physicsBody?.velocity.dx)!))
        let dySpeed3 = fabs(CGFloat((ball3.physicsBody?.velocity.dy)!))
        
        let speed1 = sqrt(dxSpeed1 + dySpeed1)
        let speed2 = sqrt(dxSpeed2 + dySpeed2)
        let speed3 = sqrt(dxSpeed3 + dySpeed3)
        print(speed1)
        
        if view?.frame.width == 768 && view?.frame.height == 1024 {
            if dxSpeed1 <= 20.0 && dxSpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0.0))
            } else if dxSpeed1 >= -20 && dxSpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: -(10), dy: 0.0))
            }
            if dySpeed1 <= 20.0 && dySpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 10))
            } else if dySpeed1 >= -20 && dySpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(10)))
            }
            
            if dxSpeed2 <= 20.0 && dxSpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0.0))
            } else if dxSpeed2 >= -20 && dxSpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: -(10), dy: 0.0))
            }
            if dySpeed2 <= 20.0 && dySpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 10))
            } else if dySpeed2 >= -20 && dySpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(10)))
            }
            
            if dxSpeed3 <= 20.0 && dxSpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0.0))
            } else if dxSpeed3 >= -20 && dxSpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: -(10), dy: 0.0))
            }
            if dySpeed3 <= 20.0 && dySpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 10))
            } else if dySpeed3 >= -20 && dySpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(10)))
            }
            // Optional((-1.69431173801422, 671.981262207031))
            // iPad (5th gen) through pro (9.7 Inch)
        } else if view?.frame.width == 834 && view?.frame.height == 1112 {
            if dxSpeed1 <= 20.0 && dxSpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0.0))
            } else if dxSpeed1 >= -20 && dxSpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: -(10), dy: 0.0))
            }
            if dySpeed1 <= 20.0 && dySpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 10))
            } else if dySpeed1 >= -20 && dySpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(10)))
            }
            
            if dxSpeed2 <= 20.0 && dxSpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0.0))
            } else if dxSpeed2 >= -20 && dxSpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: -(10), dy: 0.0))
            }
            if dySpeed2 <= 20.0 && dySpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 10))
            } else if dySpeed2 >= -20 && dySpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(10)))
            }
            
            if dxSpeed3 <= 20.0 && dxSpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 10, dy: 0.0))
            } else if dxSpeed3 >= -20 && dxSpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: -(10), dy: 0.0))
            }
            if dySpeed3 <= 20.0 && dySpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 10))
            } else if dySpeed3 >= -20 && dySpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(10)))
            }
            // Optional((0.0, 671.755004882812))
            // iPad pro (10.5 Inch)
        } else if view?.frame.width == 1024 && view?.frame.height == 1366 {
            if dxSpeed1 <= 20.0 && dxSpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 11, dy: 0.0))
            } else if dxSpeed1 >= -20 && dxSpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: -(11), dy: 0.0))
            }
            if dySpeed1 <= 20.0 && dySpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 11))
            } else if dySpeed1 >= -20 && dySpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(11)))
            }
            
            if dxSpeed2 <= 20.0 && dxSpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 11, dy: 0.0))
            } else if dxSpeed2 >= -20 && dxSpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: -(11), dy: 0.0))
            }
            if dySpeed2 <= 20.0 && dySpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 11))
            } else if dySpeed2 >= -20 && dySpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(11)))
            }
            
            if dxSpeed3 <= 20.0 && dxSpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 11, dy: 0.0))
            } else if dxSpeed3 >= -20 && dxSpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: -(11), dy: 0.0))
            }
            if dySpeed3 <= 20.0 && dySpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 11))
            } else if dySpeed3 >= -20 && dySpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(11)))
            }
            // Optional((1.39736270904541, 671.98193359375))
            // iPad pro (12.9 Inch)
        } else if view?.frame.width == 320 && view?.frame.height == 568 {
            if dxSpeed1 <= 20.0 && dxSpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.8, dy: 0.0))
            } else if dxSpeed1 >= -20 && dxSpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: -(0.8), dy: 0.0))
            }
            if dySpeed1 <= 20.0 && dySpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 0.8))
            } else if dySpeed1 >= -20 && dySpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(0.8)))
            }
            
            if dxSpeed2 <= 20.0 && dxSpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.8, dy: 0.0))
            } else if dxSpeed2 >= -20 && dxSpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: -(0.8), dy: 0.0))
            }
            if dySpeed2 <= 20.0 && dySpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 0.8))
            } else if dySpeed2 >= -20 && dySpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(0.8)))
            }
            
            if dxSpeed3 <= 20.0 && dxSpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.8, dy: 0.0))
            } else if dxSpeed3 >= -20 && dxSpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: -(0.8), dy: 0.0))
            }
            if dySpeed3 <= 20.0 && dySpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 0.8))
            } else if dySpeed3 >= -20 && dySpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(0.8)))
            }
            // Optional((1.63292384147644, 489.585235595703))
            // iPhone 5s and SE
        } else if view?.frame.width == 375 && view?.frame.height == 667 {
            if dxSpeed1 <= 20.0 && dxSpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 1.2, dy: 0.0))
            } else if dxSpeed1 >= -20 && dxSpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: -(1.2), dy: 0.0))
            }
            if dySpeed1 <= 20.0 && dySpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 1.2))
            } else if dySpeed1 >= -20 && dySpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(1.2)))
            }
            
            if dxSpeed2 <= 20.0 && dxSpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 1.2, dy: 0.0))
            } else if dxSpeed2 >= -20 && dxSpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: -(1.2), dy: 0.0))
            }
            if dySpeed2 <= 20.0 && dySpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 1.2))
            } else if dySpeed2 >= -20 && dySpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(1.2)))
            }
            
            if dxSpeed3 <= 20.0 && dxSpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 1.2, dy: 0.0))
            } else if dxSpeed3 >= -20 && dxSpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: -(1.2), dy: 0.0))
            }
            if dySpeed3 <= 20.0 && dySpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 1.2))
            } else if dySpeed3 >= -20 && dySpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(1.2)))
            }
            
            
            // Optional((2.07877373695374, 489.446929931641))
            // iPhone 6,7,8
        } else if view?.frame.width == 414 && view?.frame.height ==  736 {
            if dxSpeed1 <= 20.0 && dxSpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 1.5, dy: 0.0))
            } else if dxSpeed1 >= -20 && dxSpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: -(1.5), dy: 0.0))
            }
            if dySpeed1 <= 20.0 && dySpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 1.5))
            } else if dySpeed1 >= -20 && dySpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(1.5)))
            }
            
            if dxSpeed2 <= 20.0 && dxSpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 1.5, dy: 0.0))
            } else if dxSpeed2 >= -20 && dxSpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: -(1.5), dy: 0.0))
            }
            if dySpeed2 <= 20.0 && dySpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 1.5))
            } else if dySpeed2 >= -20 && dySpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(1.5)))
            }
            
            if dxSpeed3 <= 20.0 && dxSpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 1.5, dy: 0.0))
            } else if dxSpeed3 >= -20 && dxSpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: -(1.5), dy: 0.0))
            }
            if dySpeed3 <= 20.0 && dySpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 1.5))
            } else if dySpeed3 >= -20 && dySpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(1.5)))
            }
            // Optional((1.9209446691093e-05, 489.418579101562))
            // iPhone 6 plus, 7 plus, 8 plus
        } else if view?.frame.width == 375 && view?.frame.height == 812 {
            if dxSpeed1 <= 20.0 && dxSpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 1.5, dy: 0.0))
            } else if dxSpeed1 >= -20 && dxSpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: -(1.5), dy: 0.0))
            }
            if dySpeed1 <= 20.0 && dySpeed1 >= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 1.5))
            } else if dySpeed1 >= -20 && dySpeed1 <= 0 {
                ball1.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(1.5)))
            }
            
            if dxSpeed2 <= 20.0 && dxSpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 1.5, dy: 0.0))
            } else if dxSpeed2 >= -20 && dxSpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: -(1.5), dy: 0.0))
            }
            if dySpeed2 <= 20.0 && dySpeed2 >= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 1.5))
            } else if dySpeed2 >= -20 && dySpeed2 <= 0 {
                ball2.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(1.5)))
            }
            
            if dxSpeed3 <= 20.0 && dxSpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 1.5, dy: 0.0))
            } else if dxSpeed3 >= -20 && dxSpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: -(1.5), dy: 0.0))
            }
            if dySpeed3 <= 20.0 && dySpeed3 >= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: 1.5))
            } else if dySpeed3 >= -20 && dySpeed3 <= 0 {
                ball3.physicsBody?.applyImpulse(CGVector(dx: 0.0, dy: -(1.5)))
            }
            // Optional((-2.84653806686401, -489.443054199219))
            // iPhone X
        }
        
        // X = 2.5
        // Plus = 2.5
        // 6,7,8 = 3
        // 5, SE = 2
        // 12.9 Ipad = 35
        // 10.5 Ipad = 34
        // iPad 5th Gen = 33
        
        if speed1 > maxSpeed {
            ball1.physicsBody?.linearDamping = 0.1
        } else if speed1 < minSpeed {
            ball1.physicsBody?.linearDamping = 0.0
        }
        
        if speed2 > maxSpeed {
            ball2.physicsBody?.linearDamping = 0.1
        } else if speed2 < minSpeed {
            ball2.physicsBody?.linearDamping = 0.0
        }
        
        if speed3 > maxSpeed {
            ball3.physicsBody?.linearDamping = 0.1
        } else if speed3 < minSpeed {
            ball3.physicsBody?.linearDamping = 0.0
        }
    }
    
    @objc func x2TimeFunc() {
        if x2Time >= 1 {
            x2Time -= 1
            x2ActiveLbl.text = "\(x2Time)"
        } else if x2Time == 0 {
            self.x2Active = false
            self.x2ActiveImg.run(self.fadeOut)
            self.x2ActiveLbl.run(self.fadeOut, completion: {
                self.x2ActiveImg.removeFromParent()
                self.x2ActiveLbl.removeFromParent()
                self.x2Time = 10
            })
        }
    }
    
    @objc func invincibleTimeFunc() {
        if invincibleTime >= 1 {
            invincibleTime -= 1
            invincibleActiveLbl.text = "\(invincibleTime)"
        } else if invincibleTime == 0 {
            self.invincibleActive = false
            self.invincibleActiveImg.run(self.fadeOut)
            self.invincibleActiveLbl.run(self.fadeOut, completion: {
                self.invincibleActiveImg.removeFromParent()
                self.invincibleActiveLbl.removeFromParent()
                self.invincibleTime = 10
            })
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        print(self.ball1.physicsBody?.velocity)
        
        leftBarrier.position = CGPoint(x: 0, y: self.frame.height / 2)
        rightBarrier.position = CGPoint(x: self.frame.width, y: self.frame.height / 2)
        topBarrier.position = CGPoint(x: self.frame.width / 2, y: self.frame.height)
        
        if ballCount == 1 {
            triBallActive = false
        } else if ballCount > 1 {
            triBallActive = true
        }
    }
    
}
