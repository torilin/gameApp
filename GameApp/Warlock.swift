//
//  Warlock.swift
//  GameApp
//
//  Created by torilin on 7/28/16.
//  Copyright © 2016 torilin. All rights reserved.
//

import Foundation

class Warlock: Enemy {
    
    
    override var type: String {
        return "Warlock"
    }

    override var loot: [String] {
        return ["Miracle Potion", "Magic Case", "Disappearing Cloak"]
    
    }
    
    
}
