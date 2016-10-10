//
//  GamePickerViewController.swift
//  WhatBoardGame
//
//  Created by Luke Noble on 28/09/2016.
//  Copyright © 2016 Luke Noble. All rights reserved.
//

import Foundation
import UIKit

class GamePickerViewController : UIViewController {
    //MARK: How many people are playing? Stepper
    @IBOutlet weak var numberofPeopleLabel: UILabel!
    @IBOutlet weak var numberOfPeopleStepper: UIStepper!
    @IBAction func numberOfPeopleStepper(_ sender: AnyObject) {
        numberofPeopleLabel.text = "\(Int(numberOfPeopleStepper.value))"
    }
    //MARK: How much time do you have to play? Control
    var minTime = 0
    var maxTime = 30
    @IBOutlet weak var timeSegmentedControl: UISegmentedControl!
    @IBAction func timeControlChanged(_ sender: AnyObject) {
        switch timeSegmentedControl.selectedSegmentIndex
        {
        case 0:
            minTime = 0
            maxTime = 30
        case 1:
            minTime = 30
            maxTime = 60
        case 2:
            minTime = 60
            maxTime = 120
        case 3:
            minTime = 120
            maxTime = 999
        default:
            break; 
        }
    }
    
    //MARK: Pick my game button
    @IBAction func pickMyGameButton(_ sender: AnyObject) {
        self.performSegue(withIdentifier: "pickMyGameSegue", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "pickMyGameSegue") {
            if let dest = segue.destination as? ResultsViewController {
                dest.numberOfPlayersPicked = Int(numberOfPeopleStepper.value)
                dest.minTime = minTime
                dest.maxTime = maxTime
            }
        }
        if (segue.identifier == "addGameSegue") {
            if let dest = segue.destination as? AddGameViewController {
                dest.editMode = false
            }
        }
    }
}
