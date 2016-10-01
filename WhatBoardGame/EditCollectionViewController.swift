//
//  EditCollectionViewController.swift
//  WhatBoardGame
//
//  Created by Luke Noble on 28/09/2016.
//  Copyright © 2016 Luke Noble. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class EditCollectionViewController : UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var games = [NSManagedObject]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        let game = games[(indexPath as NSIndexPath).row]
        let name = game.value(forKey: "gametitle") as? String
        
        cell!.textLabel!.text = "\(name!)"
        
        return cell!
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "GameInCollection")
        
        //3
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            games = results as! [NSManagedObject]
            print(games.count)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
}
