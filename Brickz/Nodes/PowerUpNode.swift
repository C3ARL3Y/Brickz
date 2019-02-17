//
//  PowerUpNode.swift
//  Brickz
//
//  Created by Julian Cearley on 1/23/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import UIKit
import GameplayKit
import SpriteKit

class PowerUpNode: SKSpriteNode {
    
    var randomInt = 0
    var powerUpInt = arc4random() % 275
    var powerUpExplosionTexture = SKTexture()
    
    init() {
        var texture: SKTexture = SKTexture()
        
        if powerUpInt == 0 {
            powerUpExplosionTexture = SKTexture(imageNamed: "coinExplosionParticleImg")
            texture = SKTexture(imageNamed: "coinPowerUpImg")
        } else if powerUpInt == 1 {
            
        }
        
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        
        if powerUpInt <= 15 {
            self.name = "coinPowerUp"
        } else if powerUpInt >= 16 && powerUpInt <= 20 {
            self.name = "paddleGrowPowerUp"
        } else if powerUpInt >= 21 && powerUpInt <= 25 {
            self.name = "paddleShrinkPowerUp"
        } else if powerUpInt >= 26 && powerUpInt <= 30 {
            self.name = "rocketShotPowerUp"
        } else if powerUpInt >= 31 && powerUpInt <= 33 {
            self.name = "deathPowerUp"
        } else if powerUpInt >= 34 && powerUpInt <= 40 {
            self.name = "invincibleBallPowerUp"
        } else if powerUpInt >= 41 && powerUpInt <= 45 {
            self.name = "triBallPowerUp"
        } else if powerUpInt >= 46 && powerUpInt <= 50 {
            self.name = "x2ScorePowerUp"
        } else if powerUpInt >= 51 && powerUpInt <= 55 {
            self.name = "plus100ScorePowerUp"
        } else if powerUpInt >= 56 && powerUpInt <= 60 {
            self.name = "miniBallPowerUp"
        } else if powerUpInt >= 61 && powerUpInt <= 65{
            self.name = "giantBallPowerUp"
        } else {
            print("No power up this time!")
        }
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
