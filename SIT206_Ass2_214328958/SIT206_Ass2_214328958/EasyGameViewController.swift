//
//  EasyGameViewController.swift
//  SIT206_Ass2_214328958
//
//  Created by user126206 on 5/20/17.
//  Copyright © 2017 Deakin. All rights reserved.
//

import UIKit

class EasyGameViewController: UIViewController {

    @IBOutlet weak var timerLbl: UILabel!
    @IBOutlet var gameCards: [UIButton]!
    
    var time = 0.0
    //Timer for the game
    var timer = Timer()
    
    //For randomly assigning the card tags
    var assigned = false
    var tag0 = 0
    var tag1 = 0
    var tag2 = 0
    
    //Main game variables
    var first = true
    var imgs = [
        UIImage(named: "0"),
        UIImage(named: "1"),
        UIImage(named: "2")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Initial setup
        startGame()
        
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
                
                let r = arc4random_uniform(3)
                
                //Ensures that there will only be a pair for each tag
                if(r == 0 && tag0 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag0 += 1
                }
                else if(r == 1 && tag1 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag1 += 1
                }
                else if(r == 2 && tag2 < 2) {
                    card.tag = Int(r)
                    assigned = true
                    tag2 += 1
                }
                
            }
            
        }
        
        //Set and start the timer
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(EasyGameViewController.updateTimer), userInfo: nil, repeats: true)
        
    }
    
    //Updates the time while the game is ongoing
    func updateTimer() {
        time += 0.1
        timerLbl.text = "Time: " + String(time)
    }
    
    //Actions after the game finishes
    func finishGame() {
        
    }
    
    //Main game
    @IBAction func flipCard(_ sender: UIButton) {
        
        sender.setImage(imgs[sender.tag], for: .normal)
        
    }
    

}
