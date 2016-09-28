//
//  AddGameViewController.swift
//  WhatBoardGame
//
//  Created by Luke Noble on 20/09/2016.
//  Copyright © 2016 Luke Noble. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class AddGameViewController : UIViewController {
    
    var game = [NSManagedObject]()
    
    //MARK: UI Elements
    @IBOutlet weak var gameTitleTextField: UITextField!
    @IBOutlet weak var minPlayersTextField: UITextField!
    @IBOutlet weak var maxPlayersTextField: UITextField!
    @IBOutlet weak var averagePlaytimeTextField: UITextField!
    @IBOutlet weak var barcodeTextField: UITextField!
    @IBAction func addToCollectionButton(_ sender: AnyObject) {
        savePerson(gameTitle: gameTitleTextField.text!, andMinPlayers: Int(minPlayersTextField.text!)!, andMaxPlayers: Int(maxPlayersTextField.text!)!, andAveragePlaytime: Int(averagePlaytimeTextField.text!)!, andBarcode: barcodeTextField.text!)
    }
    
    //MARK: Save Data
    func savePerson(gameTitle: String, andMinPlayers: Int, andMaxPlayers: Int, andAveragePlaytime: Int, andBarcode: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entity(forEntityName: "GameInCollection", in:managedContext)
        let gameToSave = NSManagedObject(entity: entity!, insertInto: managedContext)
        gameToSave.setValue(gameTitle, forKey: "gametitle")
        gameToSave.setValue(andMinPlayers, forKey: "minplayers")
        gameToSave.setValue(andMaxPlayers, forKey: "maxplayers")
        gameToSave.setValue(andAveragePlaytime, forKey: "averageplaytime")
        gameToSave.setValue(andBarcode, forKey: "barcode")
        do {
            try managedContext.save()
            game.append(gameToSave)
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
        print(game)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
    
        NotificationCenter.default.addObserver(self, selector: #selector(setLabels), name: Notification.Name(rawValue: "NameNotification"), object: nil)
    }

    func setLabels(notification: NSNotification){
        // Use the data from DataService.swift to initialize the Game.
        let gameInfo = Game(name: DataService.dataService.NAME_FROM_OUTPAN)
        gameTitleTextField.text = "\(gameInfo)"
    }
}
