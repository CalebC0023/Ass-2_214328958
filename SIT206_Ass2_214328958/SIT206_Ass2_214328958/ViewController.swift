//
//  ViewController.swift
//  SIT206_Ass2_214328958
//
//  Created by user126206 on 5/20/17.
//  Copyright © 2017 Deakin. All rights reserved.
//

import UIKit

//Global variables
//Check if there is an ongoing game
var ongoingGame = false

//Saved ongoing game state values
var difficulty = 0
var resumeTime = 0.0
var resumeCards = [Int]()
var resumePairs = [Bool]()

class ViewController: UIViewController {
    
    @IBOutlet weak var resumeBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //Enable the 'Resume Game' button if there is an ongoing game
        if (ongoingGame) {
            resumeBtn.isUserInteractionEnabled = true
        }
        else {
            resumeBtn.isUserInteractionEnabled = false
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func newGame(_ sender: UIButton) {
        
        //If there isn't an ongoing game
        if (!ongoingGame) {
            //Proceed to 'Difficulty Selection' Screen
            performSegue(withIdentifier: "menuToDIffScreen", sender: self)
        }
        //If there is an ongoing game
        else {
            
        }
        
    }

    @IBAction func resumeGame(_ sender: UIButton) {
        
        //Resume 'Easy' game
        if (difficulty == 1) {
            performSegue(withIdentifier: "resumeEasy", sender: self)
        }
        else if (difficulty == 2) {
            
        }
        else if (difficulty == 3) {
            
        }
        else if (difficulty == 4) {
            
        }
        
    }
    
}

