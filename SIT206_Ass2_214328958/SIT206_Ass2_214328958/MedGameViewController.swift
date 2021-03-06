//
//  MedGameViewController.swift
//  SIT206_Ass2_214328958
//
//  Created by user126206 on 5/21/17.
//  Copyright © 2017 Deakin. All rights reserved.
//

import UIKit

class MedGameViewController: UIViewController {

    @IBOutlet var gameCards: [UIButton]!
    @IBOutlet weak var returnBtn: UIButton!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var prevTimeLbl: UILabel!
    @IBOutlet weak var bestTimeLbl: UILabel!
    
    var time = 0
    //Timer for the game
    var timer = Timer()
    
    //For randomly assigning the card tags
    var assigned = false
    var tag0 = 0
    var tag1 = 0
    var tag2 = 0
    var tag3 = 0
    var tag4 = 0
    var tag5 = 0
    
    //Main game variables
    var first = true
    var previousGuess = 0
    
    //Stores current card values
    var currentCards = [Int]()
    
    //Stores current found pairs
    var medPairs = [
        false,
        false,
        false,
        false,
        false,
        false
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Set initial scoreboard
        bestTimeLbl.text = "Best Time: (" + medBestName + ") " + String(medBestTime)
        prevTimeLbl.text = "Prev. Time: (" + medPreviousName + ") " + String(medPreviousTime)
        
        //Initial setup based on if it's a new game or ongoing one
        if (!ongoingGame) {
            startGame()
        }
        else {
            resumeGame()
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Initial setup of game
    func startGame() {
        
        //Randomly set the tags for each button
        for card in gameCards {
            
            assigned = false
            
            //Run until a tag is assigned
            while(!assigned) {
                
                let r = arc4random_uniform(6)
                
                //Ensures that there will only be a pair for each tag
                if(r == 0 && tag0 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag0 += 1
                    
                    //Stores the card's current tag value
                    currentCards.append(Int(r))
                }
                else if(r == 1 && tag1 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag1 += 1
                    
                    currentCards.append(Int(r))
                }
                else if(r == 2 && tag2 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag2 += 1
                    
                    currentCards.append(Int(r))
                }
                else if(r == 3 && tag3 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag3 += 1
                    
                    currentCards.append(Int(r))
                }
                else if(r == 4 && tag4 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag4 += 1
                    
                    currentCards.append(Int(r))
                }
                else if(r == 5 && tag5 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag5 += 1
                    
                    currentCards.append(Int(r))
                }
                
            }
            
        }
        
        //Set and start the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MedGameViewController.updateTimer), userInfo: nil, repeats: true)
        
    }
    
    //Resume the saved game
    func resumeGame() {
        
        //The game continues so reset saved game state
        ongoingGame = false
        difficulty = 0
        
        //Set the saved game values
        time = resumeTime
        timerLbl.text = "Time: " + String(time)
        currentCards = resumeCards
        medPairs = resumePairs
        
        var i = 0
        
        //Reassign the game cards
        for card in gameCards {
            card.tag = currentCards[i]
            i += 1
            
            //Set the correct states for each card
            if (card.tag == 0 && medPairs[0]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 1 && medPairs[1]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 2 && medPairs[2]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 3 && medPairs[3]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 4 && medPairs[4]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 5 && medPairs[5]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            
        }
        
        //Set and start the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(MedGameViewController.updateTimer), userInfo: nil, repeats: true)
        
    }
    
    //Updates the time while the game is ongoing
    func updateTimer() {
        time += 1
        timerLbl.text = "Time: " + String(time)
    }
    
    //Actions after the game finishes
    func finishGame() {
        
        //Stop the timer
        timer.invalidate()
        
        let alertController = UIAlertController(title: "Game Finished!", message: nil, preferredStyle: .alert)
        let results = String(time)
        
        alertController.message = "Your time was " + results + " seconds. Please enter your name."
        
        let yesAction = UIAlertAction(title: "OK", style: .default) { (ACTION) in
            
            //Reset current game state to default
            ongoingGame = false
            difficulty = 0
            
            //Get score from textfield score
            let textField = alertController.textFields![0]
            
            //Update previous scores for 'Medium'
            medPreviousTime = self.time
            medPreviousName = textField.text!
            
            //If this is after the first game for 'Medium'
            if (!medFirstGame) {
                //Check if the current score is similar or better then the best score for 'Medium'
                if (self.time <= medBestTime) {
                    //Update best scores for 'Medium'
                    medBestName = textField.text!
                    medBestTime = self.time
                }
            }
            else {
                //Update best scores for 'Medium'
                medBestName = textField.text!
                medBestTime = self.time
                medFirstGame = false
            }
            
            //Proceed to 'Difficulty Selection' Screen
            self.performSegue(withIdentifier: "medToMenu", sender: self)
        }
        
        //Add a text field to the alert
        alertController.addTextField { (textField: UITextField) in
            textField.keyboardAppearance = .dark
            textField.keyboardType = .default
            textField.autocorrectionType = .default
            textField.placeholder = "Type something here"
            textField.clearButtonMode = .whileEditing
        }
        
        //add the actions
        alertController.addAction(yesAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    //Main Game
    @IBAction func flipCard(_ sender: UIButton) {
        
        //First click
        if (first) {
            
            //Show the assigned image
            sender.setImage(imgs[sender.tag], for: .normal)
            sender.backgroundColor = nil
            //Ensure that the button cannot be currently be clicked
            sender.isUserInteractionEnabled = false
            
            //Set the current flipped card tag
            previousGuess = sender.tag
            first = false
            
        }
            //Second click
        else {
            
            //If the second card matches the first
            if (sender.tag == previousGuess) {
                
                //Show assigned image
                sender.setImage(imgs[sender.tag], for: .normal)
                sender.backgroundColor = nil
                //The button can not longer be currently clicked
                sender.isUserInteractionEnabled = false
                
                //Found the pair with the assigned tag
                medPairs[sender.tag] = true
                
                //If all pairs are found, end game
                if (!medPairs.contains(false)) {
                    finishGame()
                }
                
            }
            //If they don't match
            else {
                
                //First, disable any further user interactions
                for card in gameCards {
                    card.isUserInteractionEnabled = false
                }
                returnBtn.isUserInteractionEnabled = false
                
                //Then, show assigned image for the player to remember
                sender.setImage(imgs[sender.tag], for: .normal)
                sender.backgroundColor = nil
                
                //After a delay, continue the game
                DispatchQueue.main.asyncAfter(deadline: .now() + 1 , execute: {
                    
                    //The state of the cards that have not been paired will reset
                    for card in self.gameCards {
                        if (!self.medPairs[card.tag]) {
                            card.isUserInteractionEnabled = true
                            card.setImage(nil, for: .normal)
                            card.backgroundColor = #colorLiteral(red: 0.8213501573, green: 0.5678955913, blue: 0.4694665074, alpha: 1)
                        }
                    }
                    
                    self.returnBtn.isUserInteractionEnabled = true
                    
                })
                
            }
            
            first = true
            
        }
        
    }
    
    @IBAction func returnToMenu(_ sender: UIButton) {
        
        //Save the current game state
        ongoingGame = true
        difficulty = 2
        resumeTime = time
        resumeCards = currentCards
        resumePairs = medPairs
        
        //Return to Menu
        performSegue(withIdentifier: "medToMenu", sender: self)
        
    }
    
}
