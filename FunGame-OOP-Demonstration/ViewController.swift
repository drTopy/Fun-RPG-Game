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
    
    
    //Outlets
    @IBOutlet var mainMessageLbl: UILabel!
    @IBOutlet weak var player1btn: UIButton!
    @IBOutlet weak var player2btn: UIButton!
    @IBOutlet var playAgainBtn: UIButton!
    @IBOutlet var player1attackLbl: UILabel!
    @IBOutlet var player2attacklbl: UILabel!
    @IBOutlet var updateLabel: UILabel!
    @IBOutlet var playAgainLbl: UILabel!
    
    //Initialize players and game
    
    var player1: Player = Player()
    var player2: Player = Player()
    var currentGame: Game = Game()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLabels()
        updateMainMessageLbl("\(player1.name) vs \(player2.name)")
        updateLabel.hidden = false
    }
    
    
    @IBAction func player1AttackBtn(sender: AnyObject) {
        
        attack(player2btn, lblDefending: player2attacklbl, attackingPlayer: player1, defendingPlayer: player2)
    }
    
    
    @IBAction func player2AttackBtn(sender: AnyObject) {
        
        attack(player1btn, lblDefending: player1attackLbl, attackingPlayer: player2, defendingPlayer: player1)
    }
    
    
    func attack(buttonDefending: UIButton, lblDefending: UILabel, attackingPlayer: Player, defendingPlayer: Player) {
        
        
        if !attackingPlayer.attemptAttack(attackingPlayer.attackPwr, defendingPlayer: defendingPlayer){
            gameOverSequence(attackingPlayer, loser: defendingPlayer)
          
        }else{
            hideButtons(buttonDefending)
            updateLabels()
            currentGame.isGameAlive(attackingPlayer, defendingPlayer: defendingPlayer)
        }
    }
    
    
    func hideButtons(button: UIButton) {
        button.enabled = false
        
        NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "enableButtons", userInfo: nil, repeats: false)
        
    }
    
    
    func showButtons() {
        
        player1btn.hidden = false
        player1attackLbl.hidden = false
        player2btn.hidden = false
        player2attacklbl.hidden = false
        
    }
    
    func enableButtons(){
        player1btn.enabled = true
        player2btn.enabled = true
    }
    
    
    
    func updateMainMessageLbl(message: String){
        mainMessageLbl.text = message
        
        
    }
    
    func hideAllButtons(){
        
        player1attackLbl.hidden = true
        player1btn.hidden = true
        player2attacklbl.hidden = true
        player2btn.hidden = true
        updateLabel.hidden = true
    }
    
    func updateLabels() {
        updateLabel.text = "Player1 Name: \(player1.name)\nPlayer1 HP: \(player1.hp)\nPlayer1 AttPwr: \(player1.attackPwr)\n\nPlayer2 Name: \(player2.name)\nPlayer2 HP: \(player2.hp)\nPlayer2 AttPwr: \(player2.attackPwr)\n"
        
    }
    
    func gameOverSequence(winner: Player, loser: Player) {
        
        hideAllButtons()
        playAgainBtn.hidden = false
        playAgainLbl.hidden = false
        updateMainMessageLbl("Winner: \(winner.name)")
        
        
    }
    
    @IBAction func playAgainBtn(sender: AnyObject) {
        
        playAgainBtn.hidden = true
        playAgainLbl.hidden = true
        player1 = Player()
        player2 = Player()
        currentGame = Game()
        showButtons()
        viewDidLoad()
    }
}























