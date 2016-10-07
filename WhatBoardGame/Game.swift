//
//  game.swift
//  WhatBoardGame
//
//  Created by Luke Noble on 20/09/2016.
//  Copyright © 2016 Luke Noble. All rights reserved.
//

import Foundation

class Game {
    
    private(set) var name: String!
    
    init(name: String) {
        
        // Add a little extra text to the album information
        self.name = "\(name)"
    }
    
}
