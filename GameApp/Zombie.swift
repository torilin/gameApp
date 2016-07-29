//
//  Zombie.swift
//  GameApp
//
//  Created by torilin on 7/28/16.
//  Copyright © 2016 torilin. All rights reserved.
//

import Foundation

class Zombie: Enemy {
    
    let IMMUNE_MAX = 15
    
    override var type: String {
        return "Zombie"
    }
    
    override var loot: [String] {
        return ["Damascus Steel Sword", "Keys to Castle", "Jupiter's Trident"]
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if attackPwr >= IMMUNE_MAX {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
    
}
