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
    var isPlayer1:  Bool  = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("TicTacToe Initialized")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.statusBarStyle = .lightContent
        
    }
    
    var combination = [ [0,3,6] , [1,4,7], [2,5,8] , [0,1,2], [3,4,5], [6,7,8], [0,4,8], [2,4,6] ]
    @IBAction func playerPressed(_ sender: AnyObject) {
        
        print("Button Pressed, success! " + " \(sender.tag!)")
      
        if isPlayer1 {
            if sender.image == #imageLiteral(resourceName: "Circle") {
                print("It's a circle!")
            }
            sender.setImage(#imageLiteral(resourceName: "Circle"), for: [])
            isPlayer1 = !isPlayer1
        }
        else {
            sender.setImage(#imageLiteral(resourceName: "Cross"), for: [])
            isPlayer1 = !isPlayer1
        }
    }
    

   
}

