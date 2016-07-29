//
//  Enemy.swift
//  GameApp
//
//  Created by torilin on 7/28/16.
//  Copyright © 2016 torilin. All rights reserved.
//

import Foundation

class Enemy: Character {
    
    var loot: [String] {
        return ["Shiny Dagger", "Poison Flask"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        } else {
            return nil
        }
    }
}