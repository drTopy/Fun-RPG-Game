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
    
    
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    private var _name: String = "No name?"
    
    
    init() {
        
        self._hp = randomHP()
        self._attackPwr = randomAttackPwr()
        self._name = randomName()
    }
    
    
    var attackPwr: Int {
        get {
            return _attackPwr
        }
    }
    
    var hp: Int {
        get {
            return _hp
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
    
 
    
    func attemptAttack(attackPwr: Int) -> Bool {
        let test: ViewController = ViewController()
        test.updateMainMessageLbl()
        self._hp -= attackPwr
        test.player1attackLbl.text = String(attackPwr)
        return true
    }
    
    
    
    
    //Player random setters for HP, AttackPwr, Name
    
    func randomHP() -> Int {
        return ((Int(arc4random_uniform(5)) + 10) * 10) + 10
        
    }
    
    func randomAttackPwr() -> Int {
        return (Int(arc4random_uniform(5)) + 5) * 5
    }
    
    func randomName() -> String {
        var names = ["JimmyD", "Orcrous", "Plantro", "Jack Purr"]
        return names[Int(arc4random_uniform(UInt32(names.count - 1)))]
        
    }

}
    
    
    
    
    
    
