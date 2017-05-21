//
//  ExpGameViewController.swift
//  SIT206_Ass2_214328958
//
//  Created by user126206 on 5/21/17.
//  Copyright © 2017 Deakin. All rights reserved.
//

import UIKit

class ExpGameViewController: UIViewController {

    @IBOutlet var gameCards: [UIButton]!
    @IBOutlet weak var returnBtn: UIButton!
    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet weak var bestTimeLbl: UILabel!
    @IBOutlet weak var prevTimeLbl: UILabel!
    
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
    var tag6 = 0
    var tag7 = 0
    var tag8 = 0
    var tag9 = 0
    var tag10 = 0
    var tag11 = 0
    var tag12 = 0
    var tag13 = 0
    var tag14 = 0
    
    //Main game variables
    var first = true
    var previousGuess = 0
    
    //Stores current card values
    var currentCards = [Int]()
    
    //Stores current found pairs
    var expPairs = [
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
        false,
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
        bestTimeLbl.text = "Best Time: (" + expBestName + ") " + String(expBestTime)
        prevTimeLbl.text = "Prev. Time: (" + expPreviousName + ") " + String(expPreviousTime)
        
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
                
                let r = arc4random_uniform(10)
                
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
                else if(r == 6 && tag6 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag6 += 1
                    
                    currentCards.append(Int(r))
                }
                else if(r == 7 && tag7 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag7 += 1
                    
                    currentCards.append(Int(r))
                }
                else if(r == 8 && tag8 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag8 += 1
                    
                    currentCards.append(Int(r))
                }
                else if(r == 9 && tag9 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag9 += 1
                    
                    currentCards.append(Int(r))
                }
                else if(r == 10 && tag10 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag10 += 1
                    
                    currentCards.append(Int(r))
                }
                else if(r == 11 && tag11 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag11 += 1
                    
                    currentCards.append(Int(r))
                }
                else if(r == 12 && tag12 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag12 += 1
                    
                    currentCards.append(Int(r))
                }
                else if(r == 13 && tag13 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag13 += 1
                    
                    currentCards.append(Int(r))
                }
                else if(r == 14 && tag14 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag14 += 1
                    
                    currentCards.append(Int(r))
                }
                
            }
            
        }
        
        //Set and start the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ExpGameViewController.updateTimer), userInfo: nil, repeats: true)
        
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
        hardPairs = resumePairs
        
        var i = 0
        
        //Reassign the game cards
        for card in gameCards {
            card.tag = currentCards[i]
            i += 1
            
            //Set the correct states for each card
            if (card.tag == 0 && expPairs[0]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 1 && expPairs[1]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 2 && expPairs[2]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 3 && expPairs[3]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 4 && expPairs[4]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 5 && expPairs[5]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 6 && expPairs[6]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 7 && expPairs[7]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 8 && expPairs[8]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 9 && expPairs[9]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 10 && expPairs[10]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 11 && expPairs[11]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 12 && expPairs[12]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 13 && expPairs[13]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            else if (card.tag == 14 && expPairs[14]) {
                card.setImage(imgs[card.tag], for: .normal)
                card.backgroundColor = nil
                card.isUserInteractionEnabled = false
            }
            
        }
        
        //Set and start the timer
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ExpGameViewController.updateTimer), userInfo: nil, repeats: true)
        
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
            
            //Update previous scores for 'Expert'
            expPreviousTime = self.time
            expPreviousName = textField.text!
            
            //If this is after the first game for 'Expert'
            if (!expFirstGame) {
                //Check if the current score is similar or better then the best score for 'Expert'
                if (self.time <= expBestTime) {
                    //Update best scores for 'Expert'
                    expBestName = textField.text!
                    expBestTime = self.time
                }
            }
            else {
                //Update best scores for 'Hard'
                expBestName = textField.text!
                expBestTime = self.time
                expFirstGame = false
            }
            
            //Proceed to 'Difficulty Selection' Screen
            self.performSegue(withIdentifier: "expToMenu", sender: self)
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
                expPairs[sender.tag] = true
                
                //If all pairs are found, end game
                if (!expPairs.contains(false)) {
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
                        if (!self.expPairs[card.tag]) {
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
    
    @IBAction func returnToMenu(_ sender: Any) {
        
        //Save the current game state
        ongoingGame = true
        difficulty = 4
        resumeTime = time
        resumeCards = currentCards
        resumePairs = expPairs
        
        //Return to Menu
        performSegue(withIdentifier: "expToMenu", sender: self)
        
    }
    
}
