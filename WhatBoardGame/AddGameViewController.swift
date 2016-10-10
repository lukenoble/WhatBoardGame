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
    
    var gameToEdit = [NSManagedObject]()
    var editMode = false
    
    //MARK: UI Elements
    @IBOutlet weak var gameTitleTextField: UITextField!
    @IBOutlet weak var minPlayersTextField: UITextField!
    @IBOutlet weak var maxPlayersTextField: UITextField!
    @IBOutlet weak var averagePlaytimeTextField: UITextField!
    @IBOutlet weak var barcodeTextField: UITextField!
    @IBAction func addToCollectionButton(_ sender: AnyObject) {
        saveGame()
        self.performSegue(withIdentifier: "addToCollectionSegue", sender: self)
    }
    
    //MARK: Save Data
    func saveGame() {
        var gameToSave : NSManagedObject
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let entity =  NSEntityDescription.entity(forEntityName: "GameInCollection", in:managedContext)
        if editMode == false {
            gameToSave = NSManagedObject(entity: entity!, insertInto: managedContext)
        } else {
            gameToSave = gameToEdit[0]
        }
        gameToSave.setValue(gameTitleTextField.text!, forKey: "gametitle")
        gameToSave.setValue(Int(minPlayersTextField.text!), forKey: "minplayers")
        gameToSave.setValue(Int(maxPlayersTextField.text!), forKey: "maxplayers")
        gameToSave.setValue(Int(averagePlaytimeTextField.text!), forKey: "averageplaytime")
        gameToSave.setValue(barcodeTextField.text!, forKey: "barcode")
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
        if gameToEdit.count > 0 {
            gameTitleTextField.text = "\(gameToEdit[0].value(forKey: "gametitle")!)"
            minPlayersTextField.text = "\(gameToEdit[0].value(forKey: "minplayers")!)"
            maxPlayersTextField.text = "\(gameToEdit[0].value(forKey: "maxplayers")!)"
            averagePlaytimeTextField.text = "\(gameToEdit[0].value(forKey: "averageplaytime")!)"
            barcodeTextField.text = "\(gameToEdit[0].value(forKey: "barcode")!)"
        }
        NotificationCenter.default.addObserver(self, selector: #selector(setLabels), name: Notification.Name(rawValue: "NameNotification"), object: nil)
    }

    func setLabels(notification: NSNotification){
        // Use the data from DataService.swift to initialize the Game.
        let gameInfo = Game(name: DataService.dataService.NAME_FROM_OUTPAN)
        gameTitleTextField.text = "\(gameInfo.name!)"
    }
}
