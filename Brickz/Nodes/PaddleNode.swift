//
//  PaddleNode.swift
//  Brickz
//
//  Created by Julian Cearley on 1/13/18.
//  Copyright © 2018 Julian Cearley. All rights reserved.
//

import SpriteKit

class PaddleNode: SKSpriteNode {
    
    var paddleInt = UserDefaults.standard.integer(forKey: "paddleInt")
    var explosionParticle = SKTexture()
    
    init() {
        var texture: SKTexture = SKTexture()
        
        if paddleInt == 1 {
            texture = SKTexture(imageNamed: "paddle1")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle1")
        } else if paddleInt == 2 {
            texture = SKTexture(imageNamed: "paddle2")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle2")
        } else if paddleInt == 3 {
            texture = SKTexture(imageNamed: "paddle3")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle3")
        } else if paddleInt == 4 {
            texture = SKTexture(imageNamed: "paddle4")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle4")
        } else if paddleInt == 5 {
            texture = SKTexture(imageNamed: "paddle5")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle5")
        } else if paddleInt == 6 {
            texture = SKTexture(imageNamed: "paddle6")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle6")
        } else if paddleInt == 7 {
            texture = SKTexture(imageNamed: "paddle7")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle7")
        } else if paddleInt == 8 {
            texture = SKTexture(imageNamed: "paddle8")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle8")
        } else if paddleInt == 9 {
            texture = SKTexture(imageNamed: "paddle9")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle9")
        } else if paddleInt == 10 {
            texture = SKTexture(imageNamed: "paddle10")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle10")
        } else if paddleInt == 11 {
            texture = SKTexture(imageNamed: "paddle11")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle11")
        } else if paddleInt == 12 {
            texture = SKTexture(imageNamed: "paddle12")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle12")
        } else if paddleInt == 13 {
            texture = SKTexture(imageNamed: "paddle13")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle13")
        } else if paddleInt == 14 {
            texture = SKTexture(imageNamed: "paddle14")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle14")
        } else if paddleInt == 15 {
            texture = SKTexture(imageNamed: "paddle15")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle15")
        } else if paddleInt == 16 {
            texture = SKTexture(imageNamed: "paddle16")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle16")
        } else if paddleInt == 17 {
            texture = SKTexture(imageNamed: "paddle17")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle17")
        } else if paddleInt == 18 {
            texture = SKTexture(imageNamed: "paddle18")
            explosionParticle = SKTexture(imageNamed: "paddleExplosiionParticle18")
        } else if paddleInt == 19 {
            texture = SKTexture(imageNamed: "paddle19")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle19")
        } else if paddleInt == 20 {
            texture = SKTexture(imageNamed: "paddle20")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle20")
        } else if paddleInt == 21 {
            texture = SKTexture(imageNamed: "paddle21")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle21")
        } else if paddleInt == 22 {
            texture = SKTexture(imageNamed: "paddle22")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle22")
        } else if paddleInt == 23 {
            texture = SKTexture(imageNamed: "paddle23")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle23")
        } else if paddleInt == 24 {
            texture = SKTexture(imageNamed: "paddle24")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle24")
        } else if paddleInt == 25 {
            texture = SKTexture(imageNamed: "paddle25")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle25")
        } else if paddleInt == 26 {
            texture = SKTexture(imageNamed: "paddle26")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle26")
        } else if paddleInt == 27 {
            texture = SKTexture(imageNamed: "paddle27")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle27")
        } else if paddleInt == 28 {
            texture = SKTexture(imageNamed: "paddle28")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle28")
        } else if paddleInt == 29 {
            texture = SKTexture(imageNamed: "paddle29")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle29")
        } else if paddleInt == 30 {
            texture = SKTexture(imageNamed: "paddle30")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle30")
        } else if paddleInt == 31 {
            texture = SKTexture(imageNamed: "paddle31")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle31")
        } else if paddleInt == 32 {
            texture = SKTexture(imageNamed: "paddle32")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle32")
        } else if paddleInt == 33 {
            texture = SKTexture(imageNamed: "paddle33")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle33")
        } else if paddleInt == 34 {
            texture = SKTexture(imageNamed: "paddle34")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle34")
        } else if paddleInt == 35 {
            texture = SKTexture(imageNamed: "paddle35")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle35")
        } else if paddleInt == 36 {
            texture = SKTexture(imageNamed: "paddle36")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle36")
        } else if paddleInt == 37 {
            texture = SKTexture(imageNamed: "paddle37")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle37")
        } else if paddleInt == 38 {
            texture = SKTexture(imageNamed: "paddle38")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle38")
        } else if paddleInt == 39 {
            texture = SKTexture(imageNamed: "paddle39")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle39")
        } else if paddleInt == 40 {
            texture = SKTexture(imageNamed: "paddle40")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle40")
        } else if paddleInt == 41 {
            texture = SKTexture(imageNamed: "paddle41")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle41")
        } else if paddleInt == 42 {
            texture = SKTexture(imageNamed: "paddle42")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle42")
        } else if paddleInt == 43 {
            texture = SKTexture(imageNamed: "paddle43")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle43")
        } else if paddleInt == 44 {
            texture = SKTexture(imageNamed: "paddle44")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle44")
        } else if paddleInt == 45 {
            texture = SKTexture(imageNamed: "paddle45")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle45")
        } else if paddleInt == 46 {
            texture = SKTexture(imageNamed: "paddle46")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle46")
        } else if paddleInt == 47 {
            texture = SKTexture(imageNamed: "paddle47")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle47")
        } else if paddleInt == 48 {
            texture = SKTexture(imageNamed: "paddle48")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle48")
        } else if paddleInt == 49 {
            texture = SKTexture(imageNamed: "paddle49")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle49")
        } else if paddleInt == 50 {
            texture = SKTexture(imageNamed: "paddle50")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle50")
        } else if paddleInt == 51 {
            texture = SKTexture(imageNamed: "paddle51")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle51")
        } else if paddleInt == 52 {
            texture = SKTexture(imageNamed: "paddle52")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle52")
        } else if paddleInt == 53 {
            texture = SKTexture(imageNamed: "paddle53")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle53")
        } else if paddleInt == 54 {
            texture = SKTexture(imageNamed: "paddle54")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle54")
        } else if paddleInt == 55 {
            texture = SKTexture(imageNamed: "paddle55")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle55")
        } else if paddleInt == 56 {
            texture = SKTexture(imageNamed: "paddle56")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle56")
        } else if paddleInt == 57 {
            texture = SKTexture(imageNamed: "paddle57")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle57")
        } else if paddleInt == 58 {
            texture = SKTexture(imageNamed: "paddle58")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle58")
        } else if paddleInt == 59 {
            texture = SKTexture(imageNamed: "paddle59")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle59")
        } else if paddleInt == 60 {
            texture = SKTexture(imageNamed: "paddle60")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle60")
        } else if paddleInt == 61 {
            texture = SKTexture(imageNamed: "paddle61")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle61")
        } else if paddleInt == 62 {
            texture = SKTexture(imageNamed: "paddle62")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle62")
        } else if paddleInt == 63 {
            texture = SKTexture(imageNamed: "paddle63")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle63")
        } else if paddleInt == 64 {
            texture = SKTexture(imageNamed: "paddle64")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle64")
        } else if paddleInt == 65 {
            texture = SKTexture(imageNamed: "paddle65")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle65")
        } else if paddleInt == 66 {
            texture = SKTexture(imageNamed: "paddle66")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle66")
        } else if paddleInt == 67 {
            texture = SKTexture(imageNamed: "paddle67")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle67")
        } else if paddleInt == 68 {
            texture = SKTexture(imageNamed: "paddle68")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle68")
        } else if paddleInt == 69 {
            texture = SKTexture(imageNamed: "paddle69")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle69")
        } else if paddleInt == 70 {
            texture = SKTexture(imageNamed: "paddle70")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle70")
        } else if paddleInt == 71 {
            texture = SKTexture(imageNamed: "paddle71")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle71")
        } else if paddleInt == 72 {
            texture = SKTexture(imageNamed: "paddle72")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle72")
        } else if paddleInt == 73 {
            texture = SKTexture(imageNamed: "paddle73")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle73")
        } else if paddleInt == 74 {
            texture = SKTexture(imageNamed: "paddle74")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle74")
        } else if paddleInt == 75 {
            texture = SKTexture(imageNamed: "paddle75")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle75")
        } else if paddleInt == 76 {
            texture = SKTexture(imageNamed: "paddle76")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle76")
        } else if paddleInt == 77 {
            texture = SKTexture(imageNamed: "paddle77")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle77")
        } else if paddleInt == 78 {
            texture = SKTexture(imageNamed: "paddle78")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle78")
        } else if paddleInt == 79 {
            texture = SKTexture(imageNamed: "paddle79")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle79")
        } else if paddleInt == 80 {
            texture = SKTexture(imageNamed: "paddle80")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle80")
        } else if paddleInt == 81 {
            texture = SKTexture(imageNamed: "paddle81")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle81")
        } else if paddleInt == 82 {
            texture = SKTexture(imageNamed: "paddle82")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle82")
        } else if paddleInt == 83 {
            texture = SKTexture(imageNamed: "paddle83")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle83")
        } else if paddleInt == 84 {
            texture = SKTexture(imageNamed: "paddle84")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle84")
        } else if paddleInt == 85 {
            texture = SKTexture(imageNamed: "paddle85")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle85")
        } else if paddleInt == 86 {
            texture = SKTexture(imageNamed: "paddle86")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle86")
        } else if paddleInt == 87 {
            texture = SKTexture(imageNamed: "paddle87")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle87")
        } else if paddleInt == 88 {
            texture = SKTexture(imageNamed: "paddle88")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle88")
        } else if paddleInt == 89 {
            texture = SKTexture(imageNamed: "paddle89")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle89")
        } else if paddleInt == 90 {
            texture = SKTexture(imageNamed: "paddle90")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle90")
        } else if paddleInt == 91 {
            texture = SKTexture(imageNamed: "paddle91")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle91")
        } else if paddleInt == 92 {
            texture = SKTexture(imageNamed: "paddle92")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle92")
        } else if paddleInt == 93 {
            texture = SKTexture(imageNamed: "paddle93")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle93")
        } else if paddleInt == 94 {
            texture = SKTexture(imageNamed: "paddle94")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle94")
        } else if paddleInt == 95 {
            texture = SKTexture(imageNamed: "paddle95")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle95")
        } else if paddleInt == 96 {
            texture = SKTexture(imageNamed: "paddle96")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle96")
        } else if paddleInt == 97 {
            texture = SKTexture(imageNamed: "paddle97")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle97")
        } else if paddleInt == 98 {
            texture = SKTexture(imageNamed: "paddle98")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle98")
        } else if paddleInt == 99 {
            texture = SKTexture(imageNamed: "paddle99")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle99")
        } else if paddleInt == 100 {
            texture = SKTexture(imageNamed: "paddle100")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle100")
        } else {
            texture = SKTexture(imageNamed: "paddle1")
            explosionParticle = SKTexture(imageNamed: "paddleExplosionParticle1")
        }
        
        super.init(texture: texture, color: SKColor.clear, size: texture.size())
        
        self.name = "paddle"
        
    }
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
