//
//  ViewController.swift
//  FunGame-OOP-Demonstration
//
//  Created by Thiago Costa on 2/29/16.
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






import UIKit

class ViewController: UIViewController {
    
    
    let player1: Player = Player()
    let player2: Player = Player()
    let currentGame: Game = Game()
    
    @IBAction func player1AttackBtn(sender: AnyObject) {
      
        hideButtons(player2btn, label: player2attacklbl)
        
        
    }
    
    @IBAction func player2AttackBtn(sender: AnyObject) {
        
        hideButtons(player1btn, label: player1attackLbl)
    }
    
    func hideButtons(button: UIButton, label: UILabel) {
        button.hidden = true
        label.hidden = true
        
        
         NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "showButtons", userInfo: nil, repeats: false)
        
    }
    
    func showButtons(button: UIButton, label: UILabel) {
        
        button.hidden = false
        label.hidden = false
        
    }
    
    
    func showButtons() {
        mainMessageLbl.text = "iv"
    }
    
    @IBOutlet var mainMessageLbl: UILabel!
    @IBOutlet weak var player1btn: UIButton!
    @IBOutlet weak var player2btn: UIButton!
    @IBOutlet var player1attackLbl: UILabel!
    @IBOutlet var player2attacklbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainMessageLbl.text = "\(player1.name) vs \(player2.name)"
        
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "updateMainMessageLbl", userInfo: nil, repeats: false)
        
    }
    
    func updateMainMessageLbl(){
        if currentGame.isGameAlive() {
            mainMessageLbl.text = "Click attack to play!"
        }
        
        
        
    }
}























