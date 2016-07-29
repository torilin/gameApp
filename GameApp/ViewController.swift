//
//  ViewController.swift
//  GameApp
//
//  Created by torilin on 7/28/16.
//  Copyright © 2016 torilin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameBannerLabel: UILabel!
    
    @IBOutlet weak var playerHPLabel: UILabel!
    
    @IBOutlet weak var enemyHPLabel: UILabel!
    
    @IBOutlet weak var enemy1Img: UIImageView!
    
    @IBOutlet weak var enemy2Img: UIImageView!
    
    @IBOutlet weak var treasureChestButton: UIButton!
    
    
    var player: Player!
    
    var enemy: Enemy!
    
    var chestContents: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player(name: "Lancelot", hp: 110, attackPwr: 20)
        
        generateRandomEnemy()
        
        playerHPLabel.text = "\(player.hp) HP"
        
    }
    
    func generateRandomEnemy() {
        let rand = Int(arc4random_uniform(2))
        
        if rand == 0 {
            enemy = Zombie(startingHp: 80, attackPwr: 10)
        } else {
            enemy = Warlock(startingHp: 90, attackPwr: 12)
        }
        
        enemy1Img.hidden = false
    }
    
    @IBAction func clickTreasure(sender: AnyObject) {
        treasureChestButton.hidden = true
        gameBannerLabel.text = chestContents
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: #selector(ViewController.generateRandomEnemy), userInfo: nil, repeats: false)
        
    }
    
    @IBAction func attackButton(sender: AnyObject) {
        
        if enemy.attemptAttack(player.attackPwr) {
            gameBannerLabel.text = "Attacked \(enemy.type) for \(player.attackPwr) HP"
            enemyHPLabel.text = "\(enemy.hp) HP"
        } else {
            gameBannerLabel.text = "Attacked failed"
        }
        
        if let loot = enemy.dropLoot() {
            player.addItemToInventory(loot)
            chestContents = "\(player.name) found \(loot)"
            treasureChestButton.hidden = false
        }
        
        if !enemy.isAlive {
            enemyHPLabel.text = ""
            gameBannerLabel.text = "Killed \(enemy.type)"
            enemy1Img.hidden = true
            enemy2Img.hidden = true
        }
        
        
    }
}


