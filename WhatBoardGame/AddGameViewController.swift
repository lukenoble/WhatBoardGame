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
    
    //MARK: UI Elements
    @IBOutlet weak var gameTitleTextField: UITextField!
    @IBOutlet weak var minPlayersTextField: UITextField!
    @IBOutlet weak var maxPlayersTextField: UITextField!
    @IBOutlet weak var averagePlaytimeTextField: UITextField!
    @IBOutlet weak var barcodeTextField: UITextField!
    @IBAction func addToCollectionButton(_ sender: AnyObject) {
        let saveArray = prepareForSave(title: gameTitleTextField.text!, minPlayers: minPlayersTextField.text!, maxPlayers: maxPlayersTextField.text!, averagePlaytime: averagePlaytimeTextField.text!, barcode: barcodeTextField.text!)
        saveGame(gameArray: saveArray)
        self.performSegue(withIdentifier: "addToCollectionSegue", sender: self)
    }
    
    func prepareForSave (title: String, minPlayers: String, maxPlayers: String, averagePlaytime: String, barcode: String) -> Array<String> {
        var saveArray : [String] = Array()
        saveArray.append(title)
        saveArray.append(minPlayers)
        saveArray.append(maxPlayers)
        saveArray.append(averagePlaytime)
        saveArray.append(barcode)
        return saveArray
    }
    
    //MARK: Save Data
    func saveGame(gameArray: Array<String>) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entity(forEntityName: "GameInCollection", in:managedContext)
        let gameToSave = NSManagedObject(entity: entity!, insertInto: managedContext)
        gameToSave.setValue(gameArray[0], forKey: "gametitle")
        gameToSave.setValue(gameArray[1], forKey: "minplayers")
        gameToSave.setValue(gameArray[2], forKey: "maxplayers")
        gameToSave.setValue(gameArray[3], forKey: "averageplaytime")
        gameToSave.setValue(gameArray[4], forKey: "barcode")
        do {
            try managedContext.save()
        } catch let error as NSError  {
            print("Could not save \(error), \(error.userInfo)")
        }
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
