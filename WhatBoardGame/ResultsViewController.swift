//
//  ResultsViewController.swift
//  WhatBoardGame
//
//  Created by Luke Noble on 28/09/2016.
//  Copyright © 2016 Luke Noble. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class ResultsViewController : UIViewController {
    var games = [NSManagedObject]()
    var numberOfPlayersPicked : Int = 1
    @IBOutlet weak var whatGameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let numberOfPlayers = numberOfPlayersPicked
        let minPlayers = "minplayers"
        let maxPlayers = "maxplayers"
        let idPredicate = NSPredicate(format: "%K <= %D && %K >= %D", minPlayers, numberOfPlayers, maxPlayers, numberOfPlayers)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameInCollection")
        fetchRequest.predicate = idPredicate
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            games = results as! [NSManagedObject]
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        let game = games[0]
        let name = game.value(forKey: "gametitle") as? String
        whatGameLabel.text = "\(name!)"
    }
    
}
