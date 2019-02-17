//
//  BallNode.swift
//  Brickz
//
//  Created by Julian Cearley on 1/13/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import SpriteKit

class BallNode: SKSpriteNode {
    
    var ballInt = UserDefaults.standard.integer(forKey: "ballInt")
    var explosionParticle = SKTexture()
    
    init() {
        var texture: SKTexture = SKTexture()
        
        if ballInt == 1 {
            texture = SKTexture(imageNamed: "ball1")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle1")
        } else if ballInt == 2 {
            texture = SKTexture(imageNamed: "ball2")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle2")
        } else if ballInt == 3 {
            texture = SKTexture(imageNamed: "ball3")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle3")
        } else if ballInt == 4 {
            texture = SKTexture(imageNamed: "ball4")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle4")
        } else if ballInt == 5 {
            texture = SKTexture(imageNamed: "ball5")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle5")
        } else if ballInt == 6 {
            texture = SKTexture(imageNamed: "ball6")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle6")
        } else if ballInt == 7 {
            texture = SKTexture(imageNamed: "ball7")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle7")
        } else if ballInt == 8 {
            texture = SKTexture(imageNamed: "ball8")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle8")
        } else if ballInt == 9 {
            texture = SKTexture(imageNamed: "ball9")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle9")
        } else if ballInt == 10 {
            texture = SKTexture(imageNamed: "ball10")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle10")
        } else if ballInt == 11 {
            texture = SKTexture(imageNamed: "ball11")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle11")
        } else if ballInt == 12 {
            texture = SKTexture(imageNamed: "ball12")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle12")
        } else if ballInt == 13 {
            texture = SKTexture(imageNamed: "ball13")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle13")
        } else if ballInt == 14 {
            texture = SKTexture(imageNamed: "ball14")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle14")
        } else if ballInt == 15 {
            texture = SKTexture(imageNamed: "ball15")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle15")
        } else if ballInt == 16 {
            texture = SKTexture(imageNamed: "ball16")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle16")
        } else if ballInt == 17 {
            texture = SKTexture(imageNamed: "ball17")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle17")
        } else if ballInt == 18 {
            texture = SKTexture(imageNamed: "ball18")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle18")
        } else if ballInt == 19 {
            texture = SKTexture(imageNamed: "ball19")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle19")
        } else if ballInt == 20 {
            texture = SKTexture(imageNamed: "ball20")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle20")
        } else if ballInt == 21 {
            texture = SKTexture(imageNamed: "ball21")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle21")
        } else if ballInt == 22 {
            texture = SKTexture(imageNamed: "ball22")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle22")
        } else if ballInt == 23 {
            texture = SKTexture(imageNamed: "ball23")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle23")
        } else if ballInt == 24 {
            texture = SKTexture(imageNamed: "ball24")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle24")
        } else if ballInt == 25 {
            texture = SKTexture(imageNamed: "ball25")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle25")
        } else if ballInt == 26 {
            texture = SKTexture(imageNamed: "ball26")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle26")
        } else if ballInt == 27 {
            texture = SKTexture(imageNamed: "ball27")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle27")
        } else if ballInt == 28 {
            texture = SKTexture(imageNamed: "ball28")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle28")
        } else if ballInt == 29 {
            texture = SKTexture(imageNamed: "ball29")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle29")
        } else if ballInt == 30 {
            texture = SKTexture(imageNamed: "ball30")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle30")
        } else if ballInt == 31 {
            texture = SKTexture(imageNamed: "ball31")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle31")
        } else if ballInt == 32 {
            texture = SKTexture(imageNamed: "ball32")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle32")
        } else if ballInt == 33 {
            texture = SKTexture(imageNamed: "ball33")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle33")
        } else if ballInt == 34 {
            texture = SKTexture(imageNamed: "ball34")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle34")
        } else if ballInt == 35 {
            texture = SKTexture(imageNamed: "ball35")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle35")
        } else if ballInt == 36 {
            texture = SKTexture(imageNamed: "ball36")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle36")
        } else if ballInt == 37 {
            texture = SKTexture(imageNamed: "ball37")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle37")
        } else if ballInt == 38 {
            texture = SKTexture(imageNamed: "ball38")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle38")
        } else if ballInt == 39 {
            texture = SKTexture(imageNamed: "ball39")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle39")
        } else if ballInt == 40 {
            texture = SKTexture(imageNamed: "ball40")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle40")
        } else if ballInt == 41 {
            texture = SKTexture(imageNamed: "ball41")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle41")
        } else if ballInt == 42 {
            texture = SKTexture(imageNamed: "ball42")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle42")
        } else if ballInt == 43 {
            texture = SKTexture(imageNamed: "ball43")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle43")
        } else if ballInt == 44 {
            texture = SKTexture(imageNamed: "ball44")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle44")
        } else if ballInt == 45 {
            texture = SKTexture(imageNamed: "ball45")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle45")
        } else if ballInt == 46 {
            texture = SKTexture(imageNamed: "ball46")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle46")
        } else if ballInt == 47 {
            texture = SKTexture(imageNamed: "ball47")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle47")
        } else if ballInt == 48 {
            texture = SKTexture(imageNamed: "ball48")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle48")
        } else if ballInt == 49 {
            texture = SKTexture(imageNamed: "ball49")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle49")
        } else if ballInt == 50 {
            texture = SKTexture(imageNamed: "ball50")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle50")
        } else {
            texture = SKTexture(imageNamed: "ball1")
            explosionParticle = SKTexture(imageNamed: "ballExplosionParticle1")
        }
        
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        self.name = "ball"
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
