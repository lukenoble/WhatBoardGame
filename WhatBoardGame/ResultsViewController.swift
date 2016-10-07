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
    var minTime : Int = 0
    var maxTime : Int = 30
    @IBOutlet weak var whatGameLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let numberOfPlayers = numberOfPlayersPicked
        let minTimeForPredicate = minTime
        let maxTimeForPredicate = maxTime
        let gameTime = "averageplaytime"
        let minPlayers = "minplayers"
        let maxPlayers = "maxplayers"
        let minPlayersPredicate = NSPredicate(format: "%K <= %D", minPlayers, numberOfPlayers)
        let maxPlayersPredicate = NSPredicate(format: "%K >= %D", maxPlayers, numberOfPlayers)
        let minTimePredicate = NSPredicate(format: "%K >= %D", gameTime, minTimeForPredicate)
        let maxTimePredicate = NSPredicate(format: "%K <= %D", gameTime, maxTimeForPredicate)
        let andPredicate = NSCompoundPredicate.init(andPredicateWithSubpredicates: [minPlayersPredicate, maxPlayersPredicate, minTimePredicate, maxTimePredicate])
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameInCollection")
        fetchRequest.predicate = andPredicate
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            games = results as! [NSManagedObject]
            youShouldPlayDecider()
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    func youShouldPlayDecider() {
        let randomNumber = Int(arc4random_uniform(UInt32(games.count)))
        if games.count > 0 {
            let game = games[randomNumber]
            let name = game.value(forKey: "gametitle") as? String
            whatGameLabel.text = "\(name!)"
        } else {
            whatGameLabel.text = "You own no suitable games"
        }
    }
    
}
