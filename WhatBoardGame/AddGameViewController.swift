//
//  AddGameViewController.swift
//  WhatBoardGame
//
//  Created by Luke Noble on 20/09/2016.
//  Copyright © 2016 Luke Noble. All rights reserved.
//

import Foundation
import UIKit
class AddGameViewController : UIViewController {
    
    //MARK: UI Elements
    @IBOutlet weak var gameTitleTextField: UITextField!
    @IBOutlet weak var minPlayersTextField: UITextField!
    @IBOutlet weak var maxPlayersTextField: UITextField!
    @IBOutlet weak var averagePlaytimeTextField: UITextField!
    @IBOutlet weak var barcodeTextField: UITextField!
    @IBAction func addToCollectionButton(_ sender: AnyObject) {
    }
    
    
deinit {
    NotificationCenter.default.removeObserver(self)
}

override func viewDidLoad() {
    super.viewDidLoad()
    
    NotificationCenter.default.addObserver(self, selector: #selector(setLabels), name: Notification.Name(rawValue: "NameNotification"), object: nil)
}

    func setLabels(notification: NSNotification){
        // Use the data from DataService.swift to initialize the Album.
        let gameInfo = Game(name: DataService.dataService.NAME_FROM_OUTPAN)
//        nameLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
//        nameLabel.numberOfLines = 0
//        nameLabel.text = "\(gameInfo.name!)"
    }
}
