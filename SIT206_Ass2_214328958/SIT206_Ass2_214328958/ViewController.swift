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
var resumeTime = 0
var resumeCards = [Int]()
var resumePairs = [Bool]()

//The images for the cards
var imgs = [
    UIImage(named: "0"),
    UIImage(named: "1"),
    UIImage(named: "2"),
    UIImage(named: "3"),
    UIImage(named: "4"),
    UIImage(named: "5"),
    UIImage(named: "6"),
    UIImage(named: "7"),
    UIImage(named: "8"),
    UIImage(named: "9"),
    UIImage(named: "10"),
    UIImage(named: "11"),
    UIImage(named: "12"),
    UIImage(named: "13"),
    UIImage(named: "14")
]

//Saved scores

//Easy
var easyFirstGame = true
var easyBestTime = 0
var easyBestName = ""
var easyPreviousTime = 0
var easyPreviousName = ""

//Medium
var medFirstGame = true
var medBestTime = 0
var medBestName = ""
var medPreviousTime = 0
var medPreviousName = ""

//Hard
var hardFirstGame = true
var hardBestTime = 0
var hardBestName = ""
var hardPreviousTime = 0
var hardPreviousName = ""

//Expert
var expFirstGame = true
var expBestTime = 0
var expBestName = ""
var expPreviousTime = 0
var expPreviousName = ""

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
            performSegue(withIdentifier: "menuToDiffScreen", sender: self)
        }
        //If there is an ongoing game
        else {
            
            let alertController = UIAlertController(title: "New game", message: nil, preferredStyle: .alert)
            
            alertController.message = "There is an ongoing game. Start a new game anyway?"
            
            let yesAction = UIAlertAction(title: "Yes", style: .default) { (ACTION) in
                
                //Reset current game state to default
                ongoingGame = false
                difficulty = 0
                
                //Proceed to 'Difficulty Selection' Screen
                self.performSegue(withIdentifier: "menuToDiffScreen", sender: self)
            }
            let noAction = UIAlertAction(title: "No", style: .default)
            
            alertController.addAction(yesAction)
            alertController.addAction(noAction)
            self.present(alertController, animated: true, completion: nil)
        }
        
    }

    @IBAction func resumeGame(_ sender: UIButton) {
        
        //Resume 'Easy' game
        if (difficulty == 1) {
            performSegue(withIdentifier: "resumeEasy", sender: self)
        }
        else if (difficulty == 2) {
            performSegue(withIdentifier: "resumeMed", sender: self)
        }
        else if (difficulty == 3) {
            performSegue(withIdentifier: "resumeHard", sender: self)
        }
        else if (difficulty == 4) {
            performSegue(withIdentifier: "resumeExpert", sender: self)
        }
        
    }
    
}

