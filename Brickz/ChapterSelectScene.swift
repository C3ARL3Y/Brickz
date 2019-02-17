//
//  ChapterSelectScene.swift
//  Brickz
//
//  Created by Julian Cearley on 1/19/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import SpriteKit

class ChapterSelectScene: SKScene, SKPhysicsContactDelegate {
    
    var scrollView: SwiftySKScrollView?
    let moveableNode = SKNode()
    
    let fadeOut = SKAction.fadeOut(withDuration: 0.5)
    
    let chaptersTitle = SKSpriteNode(imageNamed: "ChaptersImg")
    
    let bg = SKSpriteNode(imageNamed: "titleBackground")
    
    var ch2lvl1Unlocked = UserDefaults.standard.bool(forKey: "ch2lvl1Unlocked")
    var ch3lvl1Unlocked = UserDefaults.standard.bool(forKey: "ch3lvl1Unlocked")
    var ch4lvl1Unlocked = UserDefaults.standard.bool(forKey: "ch4lvl1Unlocked")
    
    let chapter1Btn = SKSpriteNode()
    let chapter2Btn = SKSpriteNode()
    let chapter3Btn = SKSpriteNode()
    let chapter4Btn = SKSpriteNode()
    let chapter5Btn = SKSpriteNode()
    let chapter6Btn = SKSpriteNode()
    let chapter7Btn = SKSpriteNode()
    let chapter8Btn = SKSpriteNode()
    let chapter9Btn = SKSpriteNode()
    let chapter10Btn = SKSpriteNode()
    
    let scrollViewTop = SKSpriteNode()
    let scrollViewBottom = SKSpriteNode()
    
    let menuBtn = SKSpriteNode()
    
    var page1ScrollView = SKSpriteNode()
    var page2ScrollView = SKSpriteNode()
    var page3ScrollView = SKSpriteNode()
    var page4ScrollView = SKSpriteNode()
    var page5ScrollView = SKSpriteNode()
    var page6ScrollView = SKSpriteNode()
    var page7ScrollView = SKSpriteNode()
    var page8ScrollView = SKSpriteNode()
    var page9ScrollView = SKSpriteNode()
    var page10ScrollView = SKSpriteNode()
    var page11ScrollView = SKSpriteNode()
    let page12ScrollView = SKSpriteNode()
    let page13ScrollView = SKSpriteNode()
    let page14ScrollView = SKSpriteNode()
    let page15ScrollView = SKSpriteNode()
    let page16ScrollView = SKSpriteNode()
    let page17ScrollView = SKSpriteNode()
    let page18ScrollView = SKSpriteNode()
    let page19ScrollView = SKSpriteNode()
    let page20ScrollView = SKSpriteNode()
    let page21ScrollView = SKSpriteNode()
    let page22ScrollView = SKSpriteNode()
    let page23ScrollView = SKSpriteNode()
    let page24ScrollView = SKSpriteNode()
    let page25ScrollView = SKSpriteNode()
    let page26ScrollView = SKSpriteNode()
    let page27ScrollView = SKSpriteNode()
    let page28ScrollView = SKSpriteNode()
    let page29ScrollView = SKSpriteNode()
    let page30ScrollView = SKSpriteNode()
    let page31ScrollView = SKSpriteNode()
    let page32ScrollView = SKSpriteNode()
    let page33ScrollView = SKSpriteNode()
    let page34ScrollView = SKSpriteNode()
    
    let buttonScrollFadeOut = SKAction.fadeOut(withDuration: 0.2)
    let buttonScrollFadeIn = SKAction.fadeIn(withDuration: 0.2)
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.physicsWorld.contactDelegate = self
        
        addChild(moveableNode)
        createScrollView()
        
        bg.size = CGSize(width: self.frame.width, height: self.frame.height)
        bg.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        bg.zPosition = -1
        self.addChild(bg)
        
        scrollViewTop.size = CGSize(width: 50, height: 50)
        scrollViewTop.position = CGPoint(x: self.frame.width / 2, y: page1ScrollView.position.y + (page1ScrollView.size.height * 1.7))
        scrollViewTop.color = SKColor.clear
        scrollViewTop.name = "scrollViewTop"
        self.addChild(scrollViewTop)
        scrollViewTop.physicsBody = SKPhysicsBody(rectangleOf: scrollViewTop.size)
        scrollViewTop.physicsBody?.affectedByGravity = false
        scrollViewTop.physicsBody?.isDynamic = true
        scrollViewTop.physicsBody?.categoryBitMask = PhysicsCategory.scrollBarriers
        scrollViewTop.physicsBody?.collisionBitMask = 0
        scrollViewTop.physicsBody?.contactTestBitMask = PhysicsCategory.scrollButtons
        
        scrollViewBottom.size = CGSize(width: 50, height: 50)
        scrollViewBottom.position = CGPoint(x: self.frame.width / 2, y: page3ScrollView.position.y - (page3ScrollView.size.height * 1.7))
        scrollViewBottom.color = SKColor.clear
        scrollViewBottom.name = "scrollViewBottom"
        self.addChild(scrollViewBottom)
        scrollViewBottom.physicsBody = SKPhysicsBody(rectangleOf: scrollViewBottom.size)
        scrollViewBottom.physicsBody?.affectedByGravity = false
        scrollViewBottom.physicsBody?.isDynamic = true
        scrollViewBottom.physicsBody?.categoryBitMask = PhysicsCategory.scrollBarriers
        scrollViewBottom.physicsBody?.collisionBitMask = 0
        scrollViewBottom.physicsBody?.contactTestBitMask = PhysicsCategory.scrollButtons
        
        chaptersTitle.size = CGSize(width: self.frame.width / 1.4, height: self.frame.height / 10)
        chaptersTitle.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.1)
        chaptersTitle.zPosition = 0
        self.addChild(chaptersTitle)
        
        chapter1Btn.texture = SKTexture(imageNamed: "ch1BtnImg")
        chapter1Btn.size = CGSize(width: self.frame.height / 8, height: self.frame.height / 8)
        chapter1Btn.zPosition = 1
        chapter1Btn.name = "chapter1Btn"
        chapter1Btn.physicsBody = SKPhysicsBody(rectangleOf: chapter1Btn.size)
        chapter1Btn.physicsBody?.affectedByGravity = false
        chapter1Btn.physicsBody?.isDynamic = true
        chapter1Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        chapter1Btn.physicsBody?.collisionBitMask = 0
        chapter1Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch2lvl1Unlocked == false {
            chapter2Btn.color = SKColor.black
            chapter2Btn.colorBlendFactor = 0.8
        } else {
            chapter2Btn.colorBlendFactor = 0
        }
        chapter2Btn.texture = SKTexture(imageNamed: "ch2BtnImg")
        chapter2Btn.size = CGSize(width: self.frame.height / 8, height: self.frame.height / 8)
        chapter2Btn.zPosition = 1
        chapter2Btn.name = "chapter2Btn"
        chapter2Btn.physicsBody = SKPhysicsBody(rectangleOf: chapter2Btn.size)
        chapter2Btn.physicsBody?.affectedByGravity = false
        chapter2Btn.physicsBody?.isDynamic = true
        chapter2Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        chapter2Btn.physicsBody?.collisionBitMask = 0
        chapter2Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch3lvl1Unlocked == false {
            chapter3Btn.color = SKColor.black
            chapter3Btn.colorBlendFactor = 0.8
        } else {
            chapter3Btn.colorBlendFactor = 0
        }
        chapter3Btn.texture = SKTexture(imageNamed: "ch3BtnImg")
        chapter3Btn.size = CGSize(width: self.frame.height / 8, height: self.frame.height / 8)
        chapter3Btn.zPosition = 1
        chapter3Btn.name = "chapter3Btn"
        chapter3Btn.physicsBody = SKPhysicsBody(rectangleOf: chapter3Btn.size)
        chapter3Btn.physicsBody?.affectedByGravity = false
        chapter3Btn.physicsBody?.isDynamic = true
        chapter3Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        chapter3Btn.physicsBody?.collisionBitMask = 0
        chapter3Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        if ch4lvl1Unlocked == false {
            chapter4Btn.color = SKColor.black
            chapter4Btn.colorBlendFactor = 0.8
        } else {
            chapter4Btn.colorBlendFactor = 0
        }
        chapter4Btn.texture = SKTexture(imageNamed: "ch4BtnImg")
        chapter4Btn.size = CGSize(width: self.frame.height / 8, height: self.frame.height / 8)
        chapter4Btn.zPosition = 1
        chapter4Btn.name = "chapter4Btn"
        chapter4Btn.alpha = 0
        chapter4Btn.physicsBody = SKPhysicsBody(rectangleOf: chapter4Btn.size)
        chapter4Btn.physicsBody?.affectedByGravity = false
        chapter4Btn.physicsBody?.isDynamic = true
        chapter4Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        chapter4Btn.physicsBody?.collisionBitMask = 0
        chapter4Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        chapter5Btn.texture = SKTexture(imageNamed: "ComingSoonImg")
        chapter5Btn.size = CGSize(width: self.frame.height / 8, height: self.frame.height / 8)
        chapter5Btn.zPosition = 1
        chapter5Btn.name = "chapter5Btn"
        chapter5Btn.alpha = 0
        chapter5Btn.physicsBody = SKPhysicsBody(rectangleOf: chapter5Btn.size)
        chapter5Btn.physicsBody?.affectedByGravity = false
        chapter5Btn.physicsBody?.isDynamic = true
        chapter5Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        chapter5Btn.physicsBody?.collisionBitMask = 0
        chapter5Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        chapter6Btn.texture = SKTexture(imageNamed: "ComingSoonImg")
        chapter6Btn.size = CGSize(width: self.frame.height / 8, height: self.frame.height / 8)
        chapter6Btn.zPosition = 1
        chapter6Btn.name = "chapter6Btn"
        chapter6Btn.alpha = 0
        chapter6Btn.physicsBody = SKPhysicsBody(rectangleOf: chapter6Btn.size)
        chapter6Btn.physicsBody?.affectedByGravity = false
        chapter6Btn.physicsBody?.isDynamic = true
        chapter6Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        chapter6Btn.physicsBody?.collisionBitMask = 0
        chapter6Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        chapter7Btn.texture = SKTexture(imageNamed: "ComingSoonImg")
        chapter7Btn.size = CGSize(width: self.frame.height / 8, height: self.frame.height / 8)
        chapter7Btn.zPosition = 1
        chapter7Btn.name = "chapter7Btn"
        chapter7Btn.alpha = 0
        chapter7Btn.physicsBody = SKPhysicsBody(rectangleOf: chapter7Btn.size)
        chapter7Btn.physicsBody?.affectedByGravity = false
        chapter7Btn.physicsBody?.isDynamic = true
        chapter7Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        chapter7Btn.physicsBody?.collisionBitMask = 0
        chapter7Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        chapter8Btn.texture = SKTexture(imageNamed: "ComingSoonImg")
        chapter8Btn.size = CGSize(width: self.frame.height / 8, height: self.frame.height / 8)
        chapter8Btn.zPosition = 1
        chapter8Btn.name = "chapter8Btn"
        chapter8Btn.alpha = 0
        chapter8Btn.physicsBody = SKPhysicsBody(rectangleOf: chapter8Btn.size)
        chapter8Btn.physicsBody?.affectedByGravity = false
        chapter8Btn.physicsBody?.isDynamic = true
        chapter8Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        chapter8Btn.physicsBody?.collisionBitMask = 0
        chapter8Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        chapter9Btn.texture = SKTexture(imageNamed: "ComingSoonImg")
        chapter9Btn.size = CGSize(width: self.frame.height / 8, height: self.frame.height / 8)
        chapter9Btn.zPosition = 1
        chapter9Btn.name = "chapter9Btn"
        chapter9Btn.alpha = 0
        chapter9Btn.physicsBody = SKPhysicsBody(rectangleOf: chapter9Btn.size)
        chapter9Btn.physicsBody?.affectedByGravity = false
        chapter9Btn.physicsBody?.isDynamic = true
        chapter9Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        chapter9Btn.physicsBody?.collisionBitMask = 0
        chapter9Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        chapter10Btn.texture = SKTexture(imageNamed: "ComingSoonImg")
        chapter10Btn.size = CGSize(width: self.frame.height / 8, height: self.frame.height / 8)
        chapter10Btn.zPosition = 1
        chapter10Btn.name = "chapter10Btn"
        chapter10Btn.alpha = 0
        chapter10Btn.physicsBody = SKPhysicsBody(rectangleOf: chapter10Btn.size)
        chapter10Btn.physicsBody?.affectedByGravity = false
        chapter10Btn.physicsBody?.isDynamic = true
        chapter10Btn.physicsBody?.categoryBitMask = PhysicsCategory.scrollButtons
        chapter10Btn.physicsBody?.collisionBitMask = 0
        chapter10Btn.physicsBody?.contactTestBitMask = PhysicsCategory.scrollBarriers
        
        menuBtn.texture = SKTexture(imageNamed: "backBtn")
        menuBtn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        menuBtn.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 10)
        menuBtn.zPosition = 1
        menuBtn.name = "menuBtn"
        self.addChild(menuBtn)
        
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        if(contact.bodyA.node != nil && contact.bodyB.node != nil) {
            let firstBody = contact.bodyA.node as! SKSpriteNode
            let secondBody = contact.bodyB.node as! SKSpriteNode
            
            if (firstBody.name == "chapter1Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(button: firstBody, top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "chapter1Btn") {
                buttonHitTopScrollView(button: secondBody, top: firstBody)
            }
            if (firstBody.name == "chapter2Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(button: firstBody, top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "chapter2Btn") {
                buttonHitTopScrollView(button: secondBody, top: firstBody)
            }
            if (firstBody.name == "chapter3Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(button: firstBody, top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "chapter3Btn") {
                buttonHitTopScrollView(button: secondBody, top: firstBody)
            }
            if (firstBody.name == "chapter4Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(button: firstBody, top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "chapter4Btn") {
                buttonHitTopScrollView(button: secondBody, top: firstBody)
            }
            if (firstBody.name == "chapter5Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(button: firstBody, top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "chapter5Btn") {
                buttonHitTopScrollView(button: secondBody, top: firstBody)
            }
            if (firstBody.name == "chapter6Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(button: firstBody, top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "chapter6Btn") {
                buttonHitTopScrollView(button: secondBody, top: firstBody)
            }
            if (firstBody.name == "chapter7Btn") && (secondBody.name == "scrollViewTop") {
                buttonHitTopScrollView(button: firstBody, top: secondBody)
            } else if (firstBody.name == "scrollViewTop") && (secondBody.name == "chapter7Btn") {
                buttonHitTopScrollView(button: secondBody, top: firstBody)
            }
            if (firstBody.name == "chapter4Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(button: firstBody, bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "chapter4Btn") {
                buttonHitBottomScrollView(button: secondBody, bottom: firstBody)
            }
            if (firstBody.name == "chapter5Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(button: firstBody, bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "chapter5Btn") {
                buttonHitBottomScrollView(button: secondBody, bottom: firstBody)
            }
            if (firstBody.name == "chapter6Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(button: firstBody, bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "chapter6Btn") {
                buttonHitBottomScrollView(button: secondBody, bottom: firstBody)
            }
            if (firstBody.name == "chapter7Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(button: firstBody, bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "chapter7Btn") {
                buttonHitBottomScrollView(button: secondBody, bottom: firstBody)
            }
            if (firstBody.name == "chapter8Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(button: firstBody, bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "chapter8Btn") {
                buttonHitBottomScrollView(button: secondBody, bottom: firstBody)
            }
            if (firstBody.name == "chapter9Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(button: firstBody, bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "chapter9Btn") {
                buttonHitBottomScrollView(button: secondBody, bottom: firstBody)
            }
            if (firstBody.name == "chapter10Btn") && (secondBody.name == "scrollViewBottom") {
                buttonHitBottomScrollView(button: firstBody, bottom: secondBody)
            } else if (firstBody.name == "scrollViewBottom") && (secondBody.name == "chapter10Btn") {
                buttonHitBottomScrollView(button: secondBody, bottom: firstBody)
            }
            
        }
    }
    
    func buttonHitTopScrollView(button: SKSpriteNode, top: SKSpriteNode) {
        if button.name == "chapter1Btn" {
            chapter1Btn.run(buttonScrollFadeOut)
            chapter4Btn.run(buttonScrollFadeIn)
        }
        if button.name == "chapter2Btn" {
            chapter2Btn.run(buttonScrollFadeOut)
            chapter5Btn.run(buttonScrollFadeIn)
        }
        if button.name == "chapter3Btn" {
            chapter3Btn.run(buttonScrollFadeOut)
            chapter6Btn.run(buttonScrollFadeIn)
        }
        if button.name == "chapter4Btn" {
            chapter4Btn.run(buttonScrollFadeOut)
            chapter7Btn.run(buttonScrollFadeIn)
        }
        if button.name == "chapter5Btn" {
            chapter5Btn.run(buttonScrollFadeOut)
            chapter8Btn.run(buttonScrollFadeIn)
        }
        if button.name == "chapter6Btn" {
            chapter6Btn.run(buttonScrollFadeOut)
            chapter9Btn.run(buttonScrollFadeIn)
        }
        if button.name == "chapter7Btn" {
            chapter7Btn.run(buttonScrollFadeOut)
            chapter10Btn.run(buttonScrollFadeIn)
        }
    }
    
    func buttonHitBottomScrollView(button: SKSpriteNode, bottom: SKSpriteNode) {
        if button.name == "chapter10Btn" {
            chapter10Btn.run(buttonScrollFadeOut)
            chapter7Btn.run(buttonScrollFadeIn)
        }
        if button.name == "chapter9Btn" {
            chapter9Btn.run(buttonScrollFadeOut)
            chapter6Btn.run(buttonScrollFadeIn)
        }
        if button.name == "chapter8Btn" {
            chapter8Btn.run(buttonScrollFadeOut)
            chapter5Btn.run(buttonScrollFadeIn)
        }
        if button.name == "chapter7Btn" {
            chapter7Btn.run(buttonScrollFadeOut)
            chapter4Btn.run(buttonScrollFadeIn)
        }
        if button.name == "chapter6Btn" {
            chapter6Btn.run(buttonScrollFadeOut)
            chapter3Btn.run(buttonScrollFadeIn)
        }
        if button.name == "chapter5Btn" {
            chapter5Btn.run(buttonScrollFadeOut)
            chapter2Btn.run(buttonScrollFadeIn)
        }
        if button.name == "chapter4Btn" {
            chapter4Btn.run(buttonScrollFadeOut)
            chapter1Btn.run(buttonScrollFadeIn)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if touchedNode.name == "chapter1Btn" {
            self.scrollView?.removeFromSuperview()
            let scene = Chapter1lvlSelectScene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        }
        if touchedNode.name == "chapter2Btn" {
            if ch2lvl1Unlocked == true {
                chaptersTitle.run(fadeOut)
                chapter1Btn.run(fadeOut)
                chapter2Btn.run(fadeOut)
                chapter3Btn.run(fadeOut)
                chapter4Btn.run(fadeOut)
                chapter5Btn.run(fadeOut)
                chapter6Btn.run(fadeOut)
                chapter7Btn.run(fadeOut)
                chapter8Btn.run(fadeOut)
                chapter9Btn.run(fadeOut)
                chapter10Btn.run(fadeOut)
                menuBtn.run(fadeOut, completion: {
                    self.scrollView?.removeFromSuperview()
                    let scene = Chapter2lvlSelectScene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
                    let transition = SKTransition.fade(withDuration: 1)
                    scene.scaleMode = .aspectFill
                    self.view?.presentScene(scene, transition: transition)
                })
            }
        }
        if touchedNode.name == "chapter3Btn" {
            if ch3lvl1Unlocked == true {
                chaptersTitle.run(fadeOut)
                chapter1Btn.run(fadeOut)
                chapter2Btn.run(fadeOut)
                chapter3Btn.run(fadeOut)
                chapter4Btn.run(fadeOut)
                chapter5Btn.run(fadeOut)
                chapter6Btn.run(fadeOut)
                chapter7Btn.run(fadeOut)
                chapter8Btn.run(fadeOut)
                chapter9Btn.run(fadeOut)
                chapter10Btn.run(fadeOut)
                menuBtn.run(fadeOut, completion: {
                    self.scrollView?.removeFromSuperview()
                    let scene = Chapter3lvlSelectScene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
                    let transition = SKTransition.fade(withDuration: 1)
                    scene.scaleMode = .aspectFill
                    self.view?.presentScene(scene, transition: transition)
                })
            }
        }
        if touchedNode.name == "chapter4Btn" {
            if ch4lvl1Unlocked == true {
                chaptersTitle.run(fadeOut)
                chapter1Btn.run(fadeOut)
                chapter2Btn.run(fadeOut)
                chapter3Btn.run(fadeOut)
                chapter4Btn.run(fadeOut)
                chapter5Btn.run(fadeOut)
                chapter6Btn.run(fadeOut)
                chapter7Btn.run(fadeOut)
                chapter8Btn.run(fadeOut)
                chapter9Btn.run(fadeOut)
                chapter10Btn.run(fadeOut)
                menuBtn.run(fadeOut, completion: {
                    self.scrollView?.removeFromSuperview()
                    let scene = Chapter4lvlSelectScene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
                    let transition = SKTransition.fade(withDuration: 1)
                    scene.scaleMode = .aspectFill
                    self.view?.presentScene(scene, transition: transition)
                })
            }
        }
        if touchedNode.name == "chapter5Btn" {
           
        }
        if touchedNode.name == "chapter6Btn" {
            
        }
        if touchedNode.name == "chapter7Btn" {
            
        }
        if touchedNode.name == "chapter8Btn" {
            
        }
        if touchedNode.name == "chapter9Btn" {
            
        }
        if touchedNode.name == "chapter10Btn" {
            
        }
        if touchedNode.name == "menuBtn" {
            chaptersTitle.run(fadeOut)
            chapter1Btn.run(fadeOut)
            chapter2Btn.run(fadeOut)
            chapter3Btn.run(fadeOut)
            chapter4Btn.run(fadeOut)
            chapter5Btn.run(fadeOut)
            chapter6Btn.run(fadeOut)
            chapter7Btn.run(fadeOut)
            chapter8Btn.run(fadeOut)
            chapter9Btn.run(fadeOut)
            chapter10Btn.run(fadeOut)
            menuBtn.run(fadeOut, completion: {
                self.scrollView?.removeFromSuperview()
                let scene = TitleScene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
                let transition = SKTransition.fade(withDuration: 1)
                scene.scaleMode = .aspectFill
                self.view?.presentScene(scene, transition: transition)
            })
        }
        
    }
    
    func createScrollView() {
        
        scrollView = SwiftySKScrollView(frame: CGRect(x: 0, y: 0, width: size.width, height: size.height), moveableNode: moveableNode, direction: .vertical)
        
        guard let scrollView = scrollView else { return }
        
        scrollView.center = CGPoint(x: frame.midX, y: frame.midY)
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: scrollView.frame.height * 2.17) // * 3 makes it 3times as long as screen
        view?.addSubview(scrollView)
        
        page2ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 2, height: self.frame.height / 12))
        page2ScrollView.position = CGPoint(x: frame.midX, y: frame.midY)
        moveableNode.addChild(page2ScrollView)
        
        page1ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 2, height: self.frame.height / 12))
        page1ScrollView.position = CGPoint(x: page2ScrollView.position.x, y: page2ScrollView.position.y + (page2ScrollView.size.height * 2))
        moveableNode.addChild(page1ScrollView)
        
        page3ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 2, height: self.frame.height / 12))
        page3ScrollView.position = CGPoint(x: page2ScrollView.position.x, y: page2ScrollView.position.y - (page2ScrollView.size.height * 2))
        moveableNode.addChild(page3ScrollView)
        
        page4ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 2, height: self.frame.height / 12))
        page4ScrollView.position = CGPoint(x: page3ScrollView.position.x, y: page3ScrollView.position.y - (page3ScrollView.size.height * 2))
        moveableNode.addChild(page4ScrollView)
        
        page5ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 2, height: self.frame.height / 12))
        page5ScrollView.position = CGPoint(x: page4ScrollView.position.x, y: page4ScrollView.position.y - (page4ScrollView.size.height * 2))
        moveableNode.addChild(page5ScrollView)
        
        page6ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 2, height: self.frame.height / 12))
        page6ScrollView.position = CGPoint(x: page5ScrollView.position.x, y: page5ScrollView.position.y - (page5ScrollView.size.height * 2))
        moveableNode.addChild(page6ScrollView)
        
        page7ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 2, height: self.frame.height / 12))
        page7ScrollView.position = CGPoint(x: page6ScrollView.position.x, y: page6ScrollView.position.y - (page6ScrollView.size.height * 2))
        moveableNode.addChild(page7ScrollView)
        
        page8ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 2, height: self.frame.height / 12))
        page8ScrollView.position = CGPoint(x: page7ScrollView.position.x, y: page7ScrollView.position.y - (page7ScrollView.size.height * 2))
        moveableNode.addChild(page8ScrollView)
        
        page9ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 2, height: self.frame.height / 12))
        page9ScrollView.position = CGPoint(x: page8ScrollView.position.x, y: page8ScrollView.position.y - (page8ScrollView.size.height * 2))
        moveableNode.addChild(page9ScrollView)
        
        page10ScrollView = SKSpriteNode(color: .clear, size: CGSize(width: self.frame.width / 2, height: self.frame.height / 12))
        page10ScrollView.position = CGPoint(x: page9ScrollView.position.x, y: page9ScrollView.position.y - (page9ScrollView.size.height * 2))
        moveableNode.addChild(page10ScrollView)
        
        // Test sprites page 1
        chapter1Btn.position = CGPoint(x: 0, y: 0)
        page1ScrollView.addChild(chapter1Btn)
        
        chapter2Btn.position = CGPoint(x: 0, y: 0)
        page2ScrollView.addChild(chapter2Btn)
        
        chapter3Btn.position = CGPoint(x: 0, y: 0)
        page3ScrollView.addChild(chapter3Btn)
        
        chapter4Btn.position = CGPoint(x: 0, y: 0)
        page4ScrollView.addChild(chapter4Btn)
        
        chapter5Btn.position = CGPoint(x: 0, y: 0)
        page5ScrollView.addChild(chapter5Btn)
        
        chapter6Btn.position = CGPoint(x: 0, y: 0)
        page6ScrollView.addChild(chapter6Btn)
        
        chapter7Btn.position = CGPoint(x: 0, y: 0)
        page7ScrollView.addChild(chapter7Btn)
        
        chapter8Btn.position = CGPoint(x: 0, y: 0)
        page8ScrollView.addChild(chapter8Btn)
        
        chapter9Btn.position = CGPoint(x: 0, y: 0)
        page9ScrollView.addChild(chapter9Btn)
        
        chapter10Btn.position = CGPoint(x: 0, y: 0)
        page10ScrollView.addChild(chapter10Btn)
        
    }
    
}
