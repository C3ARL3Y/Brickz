//
//  TitleScene.swift
//  Brickz
//
//  Created by Julian Cearley on 1/16/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit
import GoogleMobileAds
import AVFoundation

struct PhysicsCategory {
    static let Barrier : UInt32 = 0x1 << 0
    static let Ball : UInt32 = 0x1 << 1
    static let Paddle : UInt32 = 0x1 << 2
    static let Brick: UInt32 = 0x1 << 3
    static let PowerUp: UInt32 = 0x1 << 4
    static let scrollBarriers: UInt32 = 0x1 << 5
    static let scrollButtons: UInt32 = 0x1 << 6
    static let Obstacle: UInt32 = 0x1 << 7
    static let Sensor: UInt32 = 0x1 << 8
    static let ExplosionParticles: UInt32 = 0x1 << 9
    static let Rocket: UInt32 = 0x1 << 10
    static let RocketExplosion: UInt32 = 0x1 << 11
}

class TitleScene: SKScene, SKPhysicsContactDelegate, GADBannerViewDelegate {
    
    var adBanner:GADBannerView = GADBannerView()
    var GVC = GameViewController()
    
    var continueString = UserDefaults.standard.string(forKey: "continueString")
    
    let background = SKSpriteNode(imageNamed: "titleBackground")
    
    let logo = SKSpriteNode(imageNamed: "logoImg")
    
    let continueBtn = SKSpriteNode(imageNamed: "continueBtn")
    let lvlSelectBtn = SKSpriteNode(imageNamed: "lvlSelectBtn")
    let storeBtn = SKSpriteNode(imageNamed: "storeBtn")
    
    let ch1Btn = SKSpriteNode(imageNamed: "ch1BtnImg")
    let ch2Btn = SKSpriteNode(imageNamed: "ch2BtnImg")
    let ch3Btn = SKSpriteNode(imageNamed: "ch3BtnImg")
    let ch4Btn = SKSpriteNode(imageNamed: "ch4BtnImg")
    
    var musicBool = UserDefaults.standard.bool(forKey: "musicBool")
    var soundBool = UserDefaults.standard.bool(forKey: "soundBool")
    
    let soundBtn = SKSpriteNode()
    let musicBtn = SKSpriteNode()
    
    let buttonSnd = SKAction.playSoundFileNamed("ButtonSound", waitForCompletion: true)
    
    let openingIntro = SKAction.playSoundFileNamed("OpeningIntro.wav", waitForCompletion: false)
    
    override func didMove(to view: SKView) {
        self.anchorPoint = CGPoint(x: 0, y: 0)
        self.physicsWorld.contactDelegate = self
        
        if soundBool == true {
            self.run(openingIntro, completion:{
                if self.musicBool == true {
                    SKTAudio.sharedInstance().playBackgroundMusic("BrickzThemeMusic.wav")
                } else if self.musicBool == false {
                    SKTAudio.sharedInstance().playBackgroundMusic("BrickzThemeMusic.wav")
                    SKTAudio.sharedInstance().pauseBackgroundMusic()
                    do {
                        if #available(iOS 10.0, *) {
                            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category(rawValue: convertFromAVAudioSessionCategory(AVAudioSession.Category.ambient)), mode: .default)
                        } else {
                            // Fallback on earlier versions
                        }
                        try AVAudioSession.sharedInstance().setActive(true)
                    }
                    catch let error as NSError {
                        print(error)
                    }
                }
            })
        } else {
            
        }
        
        adBanner.translatesAutoresizingMaskIntoConstraints = false
        adBanner.frame = CGRect(origin: CGPoint(x: 50, y: 50), size: CGSize(width: 320, height: 50))
        adBanner.backgroundColor = nil
        self.view?.addSubview(adBanner)
        NSLayoutConstraint(item: adBanner, attribute: NSLayoutConstraint.Attribute.centerX, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerXWithinMargins, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: adBanner, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: 0).isActive = true
        
        let request = GADRequest()
        request.testDevices = [kGADSimulatorID]
        adBanner.delegate = self
        adBanner.adUnitID = "ca-app-pub-7869974004265463/3318877262"
        adBanner.rootViewController = GVC
        adBanner.load(request)
        
        logo.size = CGSize(width: self.frame.width / 2.5, height: self.frame.height / 6)
        logo.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.16)
        logo.zPosition = 1
        self.addChild(logo)
        
        background.size = CGSize(width: self.frame.width, height: self.frame.height)
        background.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 2)
        background.zPosition = 0
        self.addChild(background)
        
        continueBtn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        continueBtn.position = CGPoint(x: self.frame.width / 2, y: self.frame.height / 1.4)
        continueBtn.zPosition = 1
        continueBtn.name = "continueBtn"
        self.addChild(continueBtn)
        
        lvlSelectBtn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        lvlSelectBtn.position = CGPoint(x: self.frame.width / 2, y: continueBtn.position.y - (continueBtn.size.height * 1.45))
        lvlSelectBtn.zPosition = 1
        lvlSelectBtn.name = "lvlSelectBtn"
        self.addChild(lvlSelectBtn)
        
        storeBtn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        storeBtn.position = CGPoint(x: self.frame.width / 2, y: lvlSelectBtn.position.y - (lvlSelectBtn.size.height * 1.45))
        storeBtn.zPosition = 1
        storeBtn.name = "storeBtn"
        self.addChild(storeBtn)
        
        if musicBool == true {
            musicBtn.texture = SKTexture(imageNamed: "musicOnImg")
        } else if musicBool == false {
            musicBtn.texture = SKTexture(imageNamed: "musicOffImg")
        }
        musicBtn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        musicBtn.position = CGPoint(x: storeBtn.position.x - (storeBtn.size.width * 0.8), y: storeBtn.position.y - (storeBtn.size.height * 1.6))
        musicBtn.zPosition = 1
        musicBtn.name = "musicBtn"
        self.addChild(musicBtn)
        
        if soundBool == true {
            soundBtn.texture = SKTexture(imageNamed: "soundOnImg")
        } else if soundBool == false {
            soundBtn.texture = SKTexture(imageNamed: "soundOffImg")
        }
        soundBtn.size = CGSize(width: self.frame.width / 4.5, height: self.frame.width / 4.5)
        soundBtn.position = CGPoint(x: storeBtn.position.x + (storeBtn.size.width * 0.8), y: storeBtn.position.y - (storeBtn.size.height * 1.6))
        soundBtn.zPosition = 1
        soundBtn.name = "soundBtn"
        self.addChild(soundBtn)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch:UITouch = touches.first! as UITouch
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if touchedNode.name == "continueBtn" {
            continueBtnAction()
            adBanner.removeFromSuperview()
            
            if soundBool == true {
                self.run(buttonSnd)
            } else if soundBool == false {
                
            }
        }
        if touchedNode.name == "lvlSelectBtn" {
            if soundBool == true {
                self.run(buttonSnd)
            } else if soundBool == false {
                
            }
            
            let scene = ChapterSelectScene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
            adBanner.removeFromSuperview()
            
        }
        if touchedNode.name == "storeBtn" {
            if soundBool == true {
                self.run(buttonSnd)
            } else if soundBool == false {
                
            }
            
            let scene = StoreScene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
            adBanner.removeFromSuperview()
        }
        if touchedNode.name == "musicBtn" {
            if soundBool == true {
                self.run(buttonSnd)
            } else if soundBool == false {
                
            }
            
            if musicBool == true {
                musicBtn.texture = SKTexture(imageNamed: "musicOffImg")
                musicBool = false
                UserDefaults.standard.set(false, forKey: "musicBool")
                UserDefaults.standard.synchronize()
                
                SKTAudio.sharedInstance().playBackgroundMusic("BrickzThemeMusic.wav")
                SKTAudio.sharedInstance().pauseBackgroundMusic()
            } else if musicBool == false {
                musicBtn.texture = SKTexture(imageNamed: "musicOnImg")
                musicBool = true
                UserDefaults.standard.set(true, forKey: "musicBool")
                UserDefaults.standard.synchronize()
                
                SKTAudio.sharedInstance().playBackgroundMusic("BrickzThemeMusic.wav")
            }
        }
        if touchedNode.name == "soundBtn" {
            if soundBool == true {
                soundBtn.texture = SKTexture(imageNamed: "soundOffImg")
                soundBool = false
                UserDefaults.standard.set(false, forKey: "soundBool")
                UserDefaults.standard.synchronize()
                
                
            } else if soundBool == false {
                soundBtn.texture = SKTexture(imageNamed: "soundOnImg")
                soundBool = true
                UserDefaults.standard.set(true, forKey: "soundBool")
                UserDefaults.standard.synchronize()
                
                self.run(buttonSnd)
                
            }
        }
    }
    
    func continueBtnAction() {
        if continueString == "ch1lvl2" {
            let scene = ch1lvl2Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch1lvl3" {
            let scene = ch1lvl3Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch1lvl4" {
            let scene = ch1lvl4Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch1lvl5" {
            let scene = ch1lvl5Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch1lvl6" {
            let scene = ch1lvl6Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch1lvl7" {
            let scene = ch1lvl7Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch1lvl8" {
            let scene = ch1lvl8Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch1lvl9" {
            let scene = ch1lvl9Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch1lvl10" {
            let scene = ch1lvl10Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl1" {
            let scene = ch2lvl1Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl2" {
            let scene = ch2lvl2Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl3" {
            let scene = ch2lvl3Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl4" {
            let scene = ch2lvl4Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl5" {
            let scene = ch2lvl5Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl6" {
            let scene = ch2lvl6Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl7" {
            let scene = ch2lvl7Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl8" {
            let scene = ch2lvl8Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl9" {
            let scene = ch2lvl9Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl10" {
            let scene = ch2lvl10Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl11" {
            let scene = ch2lvl11Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl12" {
            let scene = ch2lvl12Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl13" {
            let scene = ch2lvl13Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl14" {
            let scene = ch2lvl14Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch2lvl15" {
            let scene = ch2lvl15Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl1" {
            let scene = ch3lvl1Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl2" {
            let scene = ch3lvl2Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl3" {
            let scene = ch3lvl3Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl4" {
            let scene = ch3lvl4Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl5" {
            let scene = ch3lvl5Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl6" {
            let scene = ch3lvl6Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl7" {
            let scene = ch3lvl7Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl8" {
            let scene = ch3lvl8Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl9" {
            let scene = ch3lvl9Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl10" {
            let scene = ch3lvl10Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl11" {
            let scene = ch3lvl11Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl12" {
            let scene = ch3lvl12Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl13" {
            let scene = ch3lvl13Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl14" {
            let scene = ch3lvl14Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl15" {
            let scene = ch3lvl15Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl16" {
            let scene = ch3lvl16Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl17" {
            let scene = ch3lvl17Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl18" {
            let scene = ch3lvl18Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl19" {
            let scene = ch3lvl19Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl20" {
            let scene = ch3lvl20Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl21" {
            let scene = ch3lvl21Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl22" {
            let scene = ch3lvl22Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl23" {
            let scene = ch3lvl23Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl24" {
            let scene = ch3lvl24Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch3lvl25" {
            let scene = ch3lvl25Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl1" {
            let scene = ch4lvl1Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl2" {
            let scene = ch4lvl2Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl3" {
            let scene = ch4lvl3Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl4" {
            let scene = ch4lvl4Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl5" {
            let scene = ch4lvl5Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl6" {
            let scene = ch4lvl6Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl7" {
            let scene = ch4lvl7Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl8" {
            let scene = ch4lvl8Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl9" {
            let scene = ch4lvl9Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl10" {
            let scene = ch4lvl10Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl11" {
            let scene = ch4lvl11Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl12" {
            let scene = ch4lvl12Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl13" {
            let scene = ch4lvl13Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl14" {
            let scene = ch4lvl14Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl15" {
            let scene = ch4lvl15Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl16" {
            let scene = ch4lvl16Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl17" {
            let scene = ch4lvl17Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl18" {
            let scene = ch4lvl18Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl19" {
            let scene = ch4lvl19Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl20" {
            let scene = ch4lvl20Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl21" {
            let scene = ch4lvl21Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl22" {
            let scene = ch4lvl22Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl23" {
            let scene = ch4lvl23Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl24" {
            let scene = ch4lvl24Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else if continueString == "ch4lvl25" {
            let scene = ch4lvl25Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        } else {
            let scene = ch1lvl1Scene(size: CGSize(width: (self.view?.frame.width)!, height: (self.view?.frame.height)!))
            let transition = SKTransition.fade(withDuration: 1)
            scene.scaleMode = .aspectFill
            self.view?.presentScene(scene, transition: transition)
        }
    }
    
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromAVAudioSessionCategory(_ input: AVAudioSession.Category) -> String {
	return input.rawValue
}
