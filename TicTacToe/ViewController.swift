//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sivcan Singh on 06/10/16.
//  Copyright © 2016 Sivcan Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    var activePlayer: Int = 2
    //1 is cross. 2 is noughts.
    @IBOutlet weak var playAgain: UIButton!
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0] //0 : Empty || 1 : Noughts || 2 : Cross - This will keep track of the button tag that has been pressed and thus win / lose.
    
    var winCombination = [ [0,3,6] , [1,4,7], [2,5,8] , [0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6] ]
    var activeGame : Bool = true

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
        playAgain.isHidden = true
        
    }
    
    var count: Int = 1
    
    @IBAction func playerPressed(_ sender: AnyObject) {
        
        let activePosition: Int = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            if activePlayer == 1 {
                sender.setImage(#imageLiteral(resourceName: "Circle"), for: []) //[] is the new syntax for iOS 10, sets to default :)
                activePlayer = 2
                
                gameState[activePosition] = 1
            }
            else {
                sender.setImage(#imageLiteral(resourceName: "Cross"), for: [])
                activePlayer = 1
                
                gameState[activePosition] = 2 //Works perfectly!
            }

        }
        
        for combination in winCombination {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                                winnerLabel.text = "Player \(activePlayer) Wins!"
                playAgain.isHidden = false
                activeGame = false
                count = 2
            }
        }
        
        if !gameState.contains(0) {
            playAgain.isHidden = false
        }
        if playAgain.isHidden == false && count  == 1{
            winnerLabel.text = "It's a draw!"
            print("It's a draw")
        }
        
    }

    @IBAction func playGameAgain(_ sender: AnyObject) {
        playAgain.isHidden = true
        
        for i in 1...9{
            let tmpButton = self.view.viewWithTag(i) as? UIButton
            tmpButton?.setImage(nil, for: [])
            gameState[i-1] = 0
        }
        
        activePlayer = 1
        activeGame = true
        winnerLabel.text = ""
        count = 1
        
    }
}
