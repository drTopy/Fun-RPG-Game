//
//  Player.swift
//  FunGame-OOP-Demonstration
//
//  Created by Thiago Costa on 3/1/16.
//  Copyright © 2016 Thiago Costa. All rights reserved.
//
/*

2 Characters: each with HP, AttackPower, Name
When one player attacks, the other player/button is disabled for 3 seconds before they can attack again
If a player dies, the screen shoould print who won
when a game ends, give an option to restart the game

Bonus:
Add sound fx for the attacks and death
Add background music
When the game first starts allow each player to choose which character they want to be, the orc or the soldier.
Create a Game class that manages the game state
*/

import Foundation

class Player {
    
    
    private var _hp: Int = 0
    private var _attackPwr: Int = 0
    private var _name: String = ""
    
    
      init() {
    
        self._hp = randomHP()
        self._attackPwr = randomAttackPwr()
        self._name = randomName()
    }

     required init?(coder aDecoder: NSCoder) {
         fatalError("init(coder:) has not been implemented")
     }
    
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
        } set (hp1) {
            _hp = hp1
        }
        
    }
    
    var name: String {
        get {
            return _name
        }
        
    }
    
    var isAlive: Bool {
        get {
            if hp <= 0 { return false }
            else { return true}
        }
    }
    
    
    
    func attemptAttack(attackingPlayerAttackPwr: Int, defendingPlayer: Player) -> Bool {
        
        if defendingPlayer._hp > attackingPlayerAttackPwr{
        defendingPlayer._hp -= attackingPlayerAttackPwr
        return true
        }else {
            return false
        }
    }


    
    //Player random values for HP, AttackPwr, Name
    
    func randomHP() -> Int {
        return ((Int(arc4random_uniform(5)) + 10) * 10) + 10
        
    }
    
    func randomAttackPwr() -> Int {
        return (Int(arc4random_uniform(5)) + 5) * 5
    }
    
    func randomName() -> String {
        var names = [
            "JimmyD", "Orcrous", "Plantro", "Jack Purr","Buster","Russel","Bradford","Cecil","Sal","Jody","Dannie","Brett","Gerry","Murray","Burl","Foste","Carter","Christian","Sid","Chr","Donovan","Marcelino","Jeffry","Marquis"]

        return names[Int(arc4random_uniform(UInt32(names.count - 1)))]
        
    }

}
    
    
    
    
    
    
