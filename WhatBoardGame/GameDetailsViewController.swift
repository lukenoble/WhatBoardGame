//
//  GameDetailsViewController.swift
//  WhatBoardGame
//
//  Created by Luke Noble on 20/09/2016.
//  Copyright © 2016 Luke Noble. All rights reserved.
//

import Foundation
import UIKit
class GameDetailsViewController : UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!

    
deinit {
    NotificationCenter.default.removeObserver(self)
}

override func viewDidLoad() {
    super.viewDidLoad()
    
    nameLabel.text = "Let's scan a game!"
    
    NotificationCenter.default.addObserver(self, selector: #selector(setLabels), name: Notification.Name(rawValue: "NameNotification"), object: nil)
}

    func setLabels(notification: NSNotification){
        // Use the data from DataService.swift to initialize the Album.
        let gameInfo = Game(name: DataService.dataService.NAME_FROM_OUTPAN)
        nameLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        nameLabel.numberOfLines = 0
        nameLabel.text = "\(gameInfo.name!)"
    }
}
