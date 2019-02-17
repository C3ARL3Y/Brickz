//
//  ch4lvl6Scene.swift
//  Brickz
//
//  Created by Julian Cearley on 4/22/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import SpriteKit
import GameplayKit

class ch4lvl6Scene: SKScene, SKPhysicsContactDelegate {
    
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
    
    var brickLives: Array = [9,9,9,9,9,9,9]
    
    var brickCount = 7
    
    var gameStarted = false
    var gameOver = false
    
    var score = 0
    let scoreLbl = SKLabelNode(fontNamed: "HelveticaNeue-Bold")
    
    var ch4lvl7Unlocked = UserDefaults.standard.bool(forKey: "ch4lvl7Unlocked")
    
    let background = SKSpriteNode(imageNamed: "ch4Background")
    
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
    
    let topSensor = SKSpriteNode()
    let bottomSensor = SKSpriteNode()
    
    var moveObstacleUp = SKAction()
    var moveObstacleDown = SKAction()
    var moveObstacleLeft = SKAction()
    var moveObstacleRight = SKAction()
    
    let obstacleTop = SKSpriteNode()
    let obstacleBottom = SKSpriteNode()
    let obstacleLeft = SKSpriteNode()
    let obstacleRight = SKSpriteNode()
    
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
        
        brick1.texture = SKTexture(imageNamed: "brick3Texture9")
        brick1.size = steelBrickSize
        brick1.position = CGPoint(x: self.frame.width / 2 - (brick1.size.width / 2), y: self.frame.height / 1.7)
        brick1.name = "brick1"
        brick1.zPosition = 1
        self.addChild(brick1)
        brick1.physicsBody = SKPhysicsBody(rectangleOf: brick1.size)
        brick1.physicsBody?.isDynamic = false
        brick1.physicsBody?.affectedByGravity = false
        brick1.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick1.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick1.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick2.texture = SKTexture(imageNamed: "brick3Texture9")
        brick2.size = steelBrickSize
        brick2.position = CGPoint(x:self.frame.width / 2 + (brick2.size.width / 2) , y: brick1.position.y)
        brick2.name = "brick2"
        brick2.zPosition = 1
        self.addChild(brick2)
        brick2.physicsBody = SKPhysicsBody(rectangleOf: brick2.size)
        brick2.physicsBody?.isDynamic = false
        brick2.physicsBody?.affectedByGravity = false
        brick2.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick2.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick2.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick3.texture = SKTexture(imageNamed: "brick3Texture9")
        brick3.size = steelBrickSize
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
        
        brick4.texture = SKTexture(imageNamed: "brick3Texture9")
        brick4.size = steelBrickSize
        brick4.position = CGPoint(x: brick2.position.x + (brick2.size.width), y: brick2.position.y)
        brick4.name = "brick4"
        brick4.zPosition = 1
        self.addChild(brick4)
        brick4.physicsBody = SKPhysicsBody(rectangleOf: brick4.size)
        brick4.physicsBody?.isDynamic = false
        brick4.physicsBody?.affectedByGravity = false
        brick4.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick4.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick4.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick5.texture = SKTexture(imageNamed: "brick3Texture9")
        brick5.size = steelBrickSize
        brick5.position = CGPoint(x: brick1.position.x, y: brick1.position.y + (brick1.size.height))
        brick5.name = "brick5"
        brick5.zPosition = 1
        self.addChild(brick5)
        brick5.physicsBody = SKPhysicsBody(rectangleOf: brick5.size)
        brick5.physicsBody?.isDynamic = false
        brick5.physicsBody?.affectedByGravity = false
        brick5.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick5.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick5.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick6.texture = SKTexture(imageNamed: "brick3Texture9")
        brick6.size = steelBrickSize
        brick6.position = CGPoint(x: brick2.position.x, y: brick2.position.y + (brick2.size.height))
        brick6.name = "brick6"
        brick6.zPosition = 1
        self.addChild(brick6)
        brick6.physicsBody = SKPhysicsBody(rectangleOf: brick6.size)
        brick6.physicsBody?.isDynamic = false
        brick6.physicsBody?.affectedByGravity = false
        brick6.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick6.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick6.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        brick7.texture = SKTexture(imageNamed: "brick3Texture9")
        brick7.size = steelBrickSize
        brick7.position = CGPoint(x: brick2.position.x - (brick2.size.width / 2), y: brick6.position.y + (brick6.size.height))
        brick7.name = "brick7"
        brick7.zPosition = 1
        self.addChild(brick7)
        brick7.physicsBody = SKPhysicsBody(rectangleOf: brick7.size)
        brick7.physicsBody?.isDynamic = false
        brick7.physicsBody?.affectedByGravity = false
        brick7.physicsBody?.categoryBitMask = PhysicsCategory.Brick
        brick7.physicsBody?.collisionBitMask = PhysicsCategory.Rocket
        brick7.physicsBody?.contactTestBitMask = PhysicsCategory.Rocket
        
        topSensor.size = CGSize(width: self.frame.width, height: 1)
        topSensor.position = CGPoint(x: self.frame.width / 2, y: brick7.position.y + (brick7.size.height))
        topSensor.zPosition = 1
        topSensor.color = SKColor.clear
        topSensor.name = "topSensor"
        self.addChild(topSensor)
        topSensor.physicsBody = SKPhysicsBody(rectangleOf: topSensor.size)
        topSensor.physicsBody?.isDynamic = false
        topSensor.physicsBody?.affectedByGravity = false
        topSensor.physicsBody?.allowsRotation = false
        topSensor.physicsBody?.friction = 0
        topSensor.physicsBody?.restitution = 1
        topSensor.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
        topSensor.physicsBody?.collisionBitMask = PhysicsCategory.Obstacle
        topSensor.physicsBody?.contactTestBitMask = PhysicsCategory.Obstacle
        
        bottomSensor.size = CGSize(width: self.frame.width, height: 1)
        bottomSensor.position = CGPoint(x: self.frame.width / 2, y: brick1.position.y - (brick1.size.height))
        bottomSensor.zPosition = 1
        bottomSensor.color = SKColor.clear
        bottomSensor.name = "bottomSensor"
        self.addChild(bottomSensor)
        bottomSensor.physicsBody = SKPhysicsBody(rectangleOf: bottomSensor.size)
        bottomSensor.physicsBody?.isDynamic = false
        bottomSensor.physicsBody?.affectedByGravity = false
        bottomSensor.physicsBody?.allowsRotation = false
        bottomSensor.physicsBody?.friction = 0
        bottomSensor.physicsBody?.restitution = 1
        bottomSensor.physicsBody?.categoryBitMask = PhysicsCategory.Sensor
        bottomSensor.physicsBody?.collisionBitMask = PhysicsCategory.Obstacle
        bottomSensor.physicsBody?.contactTestBitMask = PhysicsCategory.Obstacle
        
        moveObstacleUp = SKAction.moveTo(y: topSensor.position.y, duration: 2)
        moveObstacleDown = SKAction.moveTo(y: bottomSensor.position.y, duration: 2)
        moveObstacleLeft = SKAction.moveTo(x: 0, duration: 2.1)
        moveObstacleRight = SKAction.moveTo(x: self.frame.width, duration: 2.1)
        
        obstacleTop.size = CGSize(width: self.frame.width / 6, height: self.frame.height / 40)
        obstacleTop.position = CGPoint(x: 0 + (obstacleTop.size.width * 0.6), y: topSensor.position.y + (obstacleTop.size.height))
        obstacleTop.zPosition = 1
        obstacleTop.color = SKColor.darkGray
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
        
        obstacleBottom.size = CGSize(width: self.frame.width / 6, height: self.frame.height / 40)
        obstacleBottom.position = CGPoint(x: self.frame.width - (obstacleBottom.size.width * 0.6), y: bottomSensor.position.y - (obstacleBottom.size.height))
        obstacleBottom.zPosition = 1
        obstacleBottom.color = SKColor.darkGray
        obstacleBottom.name = "obstacleBottom"
        self.addChild(obstacleBottom)
        obstacleBottom.run(moveObstacleLeft)
        obstacleBottom.physicsBody = SKPhysicsBody(rectangleOf: obstacleBottom.size)
        obstacleBottom.physicsBody?.affectedByGravity = false
        obstacleBottom.physicsBody?.isDynamic = true
        obstacleBottom.physicsBody?.allowsRotation = false
        obstacleBottom.physicsBody?.categoryBitMask = PhysicsCategory.Obstacle
        obstacleBottom.physicsBody?.collisionBitMask = PhysicsCategory.Barrier | PhysicsCategory.Obstacle
        obstacleBottom.physicsBody?.contactTestBitMask = PhysicsCategory.Barrier | PhysicsCategory.Obstacle
        
        obstacleLeft.size = CGSize(width: self.frame.height / 40, height: self.frame.width / 8)
        obstacleLeft.position = CGPoint(x: brick3.position.x - (brick3.size.height), y: bottomSensor.position.y + (obstacleLeft.size.height * 0.6))
        obstacleLeft.zPosition = 1
        obstacleLeft.color = SKColor.darkGray
        obstacleLeft.name = "obstacleLeft"
        self.addChild(obstacleLeft)
        obstacleLeft.run(moveObstacleUp)
        obstacleLeft.physicsBody = SKPhysicsBody(rectangleOf: obstacleLeft.size)
        obstacleLeft.physicsBody?.affectedByGravity = false
        obstacleLeft.physicsBody?.isDynamic = true
        obstacleLeft.physicsBody?.allowsRotation = false
        obstacleLeft.physicsBody?.categoryBitMask = PhysicsCategory.Obstacle
        obstacleLeft.physicsBody?.collisionBitMask = PhysicsCategory.Barrier | PhysicsCategory.Obstacle
        obstacleLeft.physicsBody?.contactTestBitMask = PhysicsCategory.Barrier | PhysicsCategory.Obstacle
        
        obstacleRight.size = CGSize(width: self.frame.height / 40, height: self.frame.width / 8)
        obstacleRight.position = CGPoint(x: brick4.position.x + (brick4.size.height), y: topSensor.position.y - (obstacleRight.size.height * 0.6))
        obstacleRight.zPosition = 1
        obstacleRight.color = SKColor.darkGray
        obstacleRight.name = "obstacleRight"
        self.addChild(obstacleRight)
        obstacleRight.run(moveObstacleDown)
        obstacleRight.physicsBody = SKPhysicsBody(rectangleOf: obstacleRight.size)
        obstacleRight.physicsBody?.affectedByGravity = false
        obstacleRight.physicsBody?.isDynamic = true
        obstacleRight.physicsBody?.allowsRotation = false
        obstacleRight.physicsBody?.categoryBitMask = PhysicsCategory.Obstacle
        obstacleRight.physicsBody?.collisionBitMask = PhysicsCategory.Barrier | PhysicsCategory.Obstacle
        obstacleRight.physicsBody?.contactTestBitMask = PhysicsCategory.Barrier | PhysicsCategory.Obstacle
        
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
            
            if (firstBody.name == "ball") && (secondBody.name == "obstacleLeft") {
                checkBallVelocity(Ball: firstBody, Barrier: secondBody)
            } else if (firstBody.name == "obstacleLeft") && (secondBody.name == "ball") {
                checkBallVelocity(Ball: secondBody, Barrier: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "obstacleRight") {
                checkBallVelocity(Ball: firstBody, Barrier: secondBody)
            } else if (firstBody.name == "obstacleRight") && (secondBody.name == "ball") {
                checkBallVelocity(Ball: secondBody, Barrier: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "obstacleTop") {
                checkBallVelocity(Ball: firstBody, Barrier: secondBody)
            } else if (firstBody.name == "obstacleTop") && (secondBody.name == "ball") {
                checkBallVelocity(Ball: secondBody, Barrier: firstBody)
            }
            if (firstBody.name == "ball") && (secondBody.name == "obstacleBottom") {
                checkBallVelocity(Ball: firstBody, Barrier: secondBody)
            } else if (firstBody.name == "obstacleBottom") && (secondBody.name == "ball") {
                checkBallVelocity(Ball: secondBody, Barrier: firstBody)
            }
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
            if (firstBody.name == "obstacleLeft") && (secondBody.name == "topSensor") {
                movingObstacleHitSensor(Obstacle: firstBody, Sensor: secondBody)
            } else if (firstBody.name == "topSensor") && (secondBody.name == "obstacleLeft") {
                movingObstacleHitSensor(Obstacle: secondBody, Sensor: firstBody)
            }
            if (firstBody.name == "obstacleLeft") && (secondBody.name == "bottomSensor") {
                movingObstacleHitSensor(Obstacle: firstBody, Sensor: secondBody)
            } else if (firstBody.name == "bottomSensor") && (secondBody.name == "obstacleLeft") {
                movingObstacleHitSensor(Obstacle: secondBody, Sensor: firstBody)
            }
            if (firstBody.name == "obstacleRight") && (secondBody.name == "topSensor") {
                movingObstacleHitSensor(Obstacle: firstBody, Sensor: secondBody)
            } else if (firstBody.name == "topSensor") && (secondBody.name == "obstacleRight") {
                movingObstacleHitSensor(Obstacle: secondBody, Sensor: firstBody)
            }
            if (firstBody.name == "obstacleRight") && (secondBody.name == "bottomSensor") {
                movingObstacleHitSensor(Obstacle: firstBody, Sensor: secondBody)
            } else if (firstBody.name == "bottomSensor") && (secondBody.name == "obstacleRight") {
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
            if (firstBody.name == "rocket") && (secondBody.name == "obstacleBottom") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "obstacleBottom") && (secondBody.name == "rocket") {
                rocketHitStoppingPoint(Rocket: secondBody, StoppingPoint: firstBody)
            }
            if (firstBody.name == "rocket") && (secondBody.name == "obstacleLeft") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "obstacleLeft") && (secondBody.name == "rocket") {
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
            if (firstBody.name == "rocket") && (secondBody.name == "obstacleRight") {
                rocketHitStoppingPoint(Rocket: firstBody, StoppingPoint: secondBody)
            } else if (firstBody.name == "obstacleRight") && (secondBody.name == "rocket") {
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
            
        }
    }
    
    func movingObstacleHitSensor(Obstacle: SKSpriteNode, Sensor: SKSpriteNode) {
        if Obstacle.name == "obstacleTop" && Sensor.name == "leftBarrier" {
            obstacleTop.run(moveObstacleRight)
        }
        if Obstacle.name == "obstacleTop" && Sensor.name == "rightBarrier" {
            obstacleTop.run(moveObstacleLeft)
        }
        if Obstacle.name == "obstacleBottom" && Sensor.name == "leftBarrier" {
            obstacleBottom.run(moveObstacleRight)
        }
        if Obstacle.name == "obstacleBottom" && Sensor.name == "rightBarrier" {
            obstacleBottom.run(moveObstacleLeft)
        }
        if Obstacle.name == "obstacleLeft" && Sensor.name == "topSensor" {
            obstacleLeft.run(moveObstacleDown)
        }
        if Obstacle.name == "obstacleLeft" && Sensor.name == "bottomSensor" {
            obstacleLeft.run(moveObstacleUp)
        }
        if Obstacle.name == "obstacleRight" && Sensor.name == "topSensor" {
            obstacleRight.run(moveObstacleDown)
        }
        if Obstacle.name == "obstacleRight" && Sensor.name == "bottomSensor" {
            obstacleRight.run(moveObstacleUp)
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
                if ch4lvl7Unlocked == true {
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
                let scene = ch4lvl6Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 0.5)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            }
            if touchedNode.name == "nextBtn" {
                let scene = ch4lvl7Scene(size: CGSize(width: (view?.frame.width)!, height: (view?.frame.height)!))
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
        let brickParticleTexture = SKTexture(imageNamed: "brick3ExplosionParticle")
        
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
            
            if brickLives[0] == 9 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[0] == 8 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[0] == 7 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[0] == 6 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[0] == 5 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[0] == 4 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[0] == 3 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[0] == 2 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture1")
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
            
            if brickLives[1] == 9 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[1] == 8 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[1] == 7 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[1] == 6 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[1] == 5 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[1] == 4 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[1] == 3 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[1] == 2 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture1")
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
            
            if brickLives[2] == 9 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[2] == 8 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[2] == 7 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[2] == 6 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[2] == 5 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[2] == 4 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[2] == 3 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[2] == 2 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture1")
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
            
            if brickLives[3] == 9 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[3] == 8 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[3] == 7 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[3] == 6 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[3] == 5 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[3] == 4 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[3] == 3 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[3] == 2 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture1")
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
            
            if brickLives[4] == 9 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[4] == 8 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[4] == 7 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[4] == 6 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[4] == 5 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[4] == 4 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[4] == 3 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[4] == 2 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture1")
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
            
            if brickLives[5] == 9 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[5] == 8 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[5] == 7 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[5] == 6 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[5] == 5 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[5] == 4 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[5] == 3 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[5] == 2 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture1")
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
            
            if brickLives[6] == 9 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[6] == 8 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[6] == 7 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[6] == 6 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[6] == 5 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[6] == 4 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[6] == 3 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[6] == 2 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture1")
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
        
        if brickCount == 0 {
            print("ch4lvl6 completed")
            gameOver = true
            
            if ch4lvl7Unlocked == false {
                continueString = "ch4lvl7"
                UserDefaults.standard.set("ch4lvl7", forKey: "continueString")
            }
            ch4lvl7Unlocked = true
            UserDefaults.standard.set(true, forKey: "ch4lvl7Unlocked")
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
                    let scene = ch4lvl7Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
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
                    if ch4lvl7Unlocked == true {
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
                
                if ch4lvl7Unlocked == true {
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
        let brickParticleTexture = SKTexture(imageNamed: "brick3ExplosionParticle")
        
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
            
            if brickLives[0] == 9 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[0] == 8 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[0] == 7 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[0] == 6 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[0] == 5 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[0] == 4 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[0] == 3 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[0] == 2 {
                brickLives[0] -= 1
                brick1.texture = SKTexture(imageNamed: "brick3Texture1")
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
            
            if brickLives[1] == 9 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[1] == 8 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[1] == 7 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[1] == 6 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[1] == 5 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[1] == 4 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[1] == 3 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[1] == 2 {
                brickLives[1] -= 1
                brick2.texture = SKTexture(imageNamed: "brick3Texture1")
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
            
            if brickLives[2] == 9 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[2] == 8 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[2] == 7 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[2] == 6 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[2] == 5 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[2] == 4 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[2] == 3 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[2] == 2 {
                brickLives[2] -= 1
                brick3.texture = SKTexture(imageNamed: "brick3Texture1")
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
            
            if brickLives[3] == 9 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[3] == 8 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[3] == 7 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[3] == 6 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[3] == 5 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[3] == 4 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[3] == 3 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[3] == 2 {
                brickLives[3] -= 1
                brick4.texture = SKTexture(imageNamed: "brick3Texture1")
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
            
            if brickLives[4] == 9 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[4] == 8 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[4] == 7 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[4] == 6 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[4] == 5 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[4] == 4 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[4] == 3 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[4] == 2 {
                brickLives[4] -= 1
                brick5.texture = SKTexture(imageNamed: "brick3Texture1")
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
            
            if brickLives[5] == 9 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[5] == 8 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[5] == 7 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[5] == 6 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[5] == 5 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[5] == 4 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[5] == 3 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[5] == 2 {
                brickLives[5] -= 1
                brick6.texture = SKTexture(imageNamed: "brick3Texture1")
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
            
            if brickLives[6] == 9 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture8")
            } else if brickLives[6] == 8 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture7")
            } else if brickLives[6] == 7 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture6")
            } else if brickLives[6] == 6 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture5")
            } else if brickLives[6] == 5 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture4")
            } else if brickLives[6] == 4 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture3")
            } else if brickLives[6] == 3 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture2")
            } else if brickLives[6] == 2 {
                brickLives[6] -= 1
                brick7.texture = SKTexture(imageNamed: "brick3Texture1")
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
        
        if brickCount == 0 {
            print("ch4lvl6 completed")
            gameOver = true
            
            if ch4lvl7Unlocked == false {
                continueString = "ch4lvl7"
                UserDefaults.standard.set("ch3lvl7", forKey: "continueString")
            }
            ch4lvl7Unlocked = true
            UserDefaults.standard.set(true, forKey: "ch4lvl7Unlocked")
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
                
                let scene = ch4lvl2Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
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
        
        topBarrier.position = CGPoint(x: self.frame.width / 2, y: self.frame.height)
        rightBarrier.position = CGPoint(x: self.frame.width, y: self.frame.height / 2)
        leftBarrier.position = CGPoint(x: 0, y: self.frame.height / 2)
        bottomSensor.position = CGPoint(x: self.frame.width / 2, y: brick1.position.y - (brick1.size.height))
        topSensor.position = CGPoint(x: self.frame.width / 2, y: brick7.position.y + (brick7.size.height))
        
        if ballCount == 1 {
            triBallActive = false
        } else if ballCount > 1 {
            triBallActive = true
        }
    }
    
}
