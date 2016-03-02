//
//  Game.swift
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

class Game {
    
    
    init() {
        isGameAlive() 
    }
    
    func isGameAlive () -> Bool {
        return true
    }
}