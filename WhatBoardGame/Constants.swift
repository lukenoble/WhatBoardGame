//
//  Constants.swift
//  WhatBoardGame
//
//  Created by Luke Noble on 20/09/2016.
//  Copyright © 2016 Luke Noble. All rights reserved.
//

import Foundation
import UIKit

let OUTPAN_KEY = "7753483aebace45b6543a19634de5ca3"
let OUTPAN_AUTH_URL = "https://api.outpan.com/v2/products/"

// Universal code for dismissing keyboard when elsewhere is pressed
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
