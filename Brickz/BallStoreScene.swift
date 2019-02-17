//
//  BallStoreScene.swift
//  Brickz
//
//  Created by Julian Cearley on 6/9/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import SpriteKit
import UIKit

class BallStoreScene: SKScene {
    
    let scrollView: UIScrollView = {
        let sv = UIScrollView()
        
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.backgroundColor = UIColor.white
        sv.alpha = 0.85
        sv.layer.cornerRadius = 15
        sv.layer.masksToBounds  = true
        sv.bounces = true
        sv.alwaysBounceVertical = true
        
        return sv
    }()
    
    var ballInt = UserDefaults.standard.integer(forKey: "ballInt")
    
    var coinsInWallet = UserDefaults.standard.integer(forKey: "coinsInWallet")
    let coinWalletLbl = SKLabelNode()
    let coinImg = SKSpriteNode(imageNamed: "brickzCoin")
    
    let background = SKSpriteNode(imageNamed: "titleBackground")
    let storeTitle = SKSpriteNode(imageNamed: "")
    
    var ball2Unlocked = UserDefaults.standard.bool(forKey: "ball2Unlocked"), ball3Unlocked = UserDefaults.standard.bool(forKey: "ball3Unlocked"), ball4Unlocked = UserDefaults.standard.bool(forKey: "ball4Unlocked"), ball5Unlocked = UserDefaults.standard.bool(forKey: "ball5Unlocked"), ball6Unlocked = UserDefaults.standard.bool(forKey: "ball6Unlocked"), ball7Unlocked = UserDefaults.standard.bool(forKey: "ball7Unlocked"), ball8Unlocked = UserDefaults.standard.bool(forKey: "ball8Unlocked"), ball9Unlocked = UserDefaults.standard.bool(forKey: "ball9Unlocked"), ball10Unlocked = UserDefaults.standard.bool(forKey: "ball10Unlocked"), ball11Unlocked = UserDefaults.standard.bool(forKey: "ball11Unlocked"), ball12Unlocked = UserDefaults.standard.bool(forKey: "ball12Unlocked"), ball13Unlocked = UserDefaults.standard.bool(forKey: "ball13Unlocked"), ball14Unlocked = UserDefaults.standard.bool(forKey: "ball14Unlocked"), ball15Unlocked = UserDefaults.standard.bool(forKey: "ball15Unlocked"), ball16Unlocked = UserDefaults.standard.bool(forKey: "ball16Unlocked"), ball17Unlocked = UserDefaults.standard.bool(forKey: "ball17Unlocked"), ball18Unlocked = UserDefaults.standard.bool(forKey: "ball18Unlocked"), ball19Unlocked = UserDefaults.standard.bool(forKey: "ball19Unlocked"), ball20Unlocked = UserDefaults.standard.bool(forKey: "ball20Unlocked"), ball21Unlocked = UserDefaults.standard.bool(forKey: "ball21Unlocked"), ball22Unlocked = UserDefaults.standard.bool(forKey: "ball22Unlocked"), ball23Unlocked = UserDefaults.standard.bool(forKey: "ball23Unlocked"), ball24Unlocked = UserDefaults.standard.bool(forKey: "ball24Unlocked"), ball25Unlocked = UserDefaults.standard.bool(forKey: "ball25Unlocked"), ball26Unlocked = UserDefaults.standard.bool(forKey: "ball26Unlocked"), ball27Unlocked = UserDefaults.standard.bool(forKey: "ball27Unlocked"), ball28Unlocked = UserDefaults.standard.bool(forKey: "ball28Unlocked"), ball29Unlocked = UserDefaults.standard.bool(forKey: "ball29Unlocked"), ball30Unlocked = UserDefaults.standard.bool(forKey: "ball30Unlocked"), ball31Unlocked = UserDefaults.standard.bool(forKey: "ball31Unlocked"), ball32Unlocked = UserDefaults.standard.bool(forKey: "ball32Unlocked"), ball33Unlocked = UserDefaults.standard.bool(forKey: "ball33Unlocked"), ball34Unlocked = UserDefaults.standard.bool(forKey: "ball34Unlocked"), ball35Unlocked = UserDefaults.standard.bool(forKey: "ball35Unlocked"), ball36Unlocked = UserDefaults.standard.bool(forKey: "ball36Unlocked"), ball37Unlocked = UserDefaults.standard.bool(forKey: "ball37Unlocked"), ball38Unlocked = UserDefaults.standard.bool(forKey: "ball38Unlocked"), ball39Unlocked = UserDefaults.standard.bool(forKey: "ball39Unlocked"), ball40Unlocked = UserDefaults.standard.bool(forKey: "ball40Unlocked"), ball41Unlocked = UserDefaults.standard.bool(forKey: "ball41Unlocked"), ball42Unlocked = UserDefaults.standard.bool(forKey: "ball42Unlocked"), ball43Unlocked = UserDefaults.standard.bool(forKey: "ball43Unlocked"), ball44Unlocked = UserDefaults.standard.bool(forKey: "ball44Unlocked"), ball45Unlocked = UserDefaults.standard.bool(forKey: "ball45Unlocked"), ball46Unlocked = UserDefaults.standard.bool(forKey: "ball46Unlocked"), ball47Unlocked = UserDefaults.standard.bool(forKey: "ball47Unlocked"), ball48Unlocked = UserDefaults.standard.bool(forKey: "ball48Unlocked"), ball49Unlocked = UserDefaults.standard.bool(forKey: "ball49Unlocked"), ball50Unlocked = UserDefaults.standard.bool(forKey: "ball50Unlocked")
    
    override func sceneDidLoad() {
        if #available(iOS 10.0, *) {
            super.sceneDidLoad()
        } else {
            // Fallback on earlier versions
        }
    }
    
}
