//
//  DataService.swift
//  WhatBoardGame
//
//  Created by Luke Noble on 20/09/2016.
//  Copyright © 2016 Luke Noble. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DataService {
    
    static let dataService = DataService()
    
    fileprivate(set) var NAME_FROM_OUTPAN = ""
    
    static func searchAPI(_ codeNumber: String) {
        
        // The URL we will use to get out album data from Outpan
        let outpanurl = "\(OUTPAN_AUTH_URL)\(codeNumber)?apikey=\(OUTPAN_KEY)"
        
        Alamofire.request(.GET, outpanurl)
            .responseJSON { response in
                
                var json = JSON(response.result.value!)
                
                let gameName = "\(json["results"][0]["name"])"
                
                self.dataService.NAME_FROM_OUTPAN = gameName
                
                // Post a notification to let AlbumDetailsViewController know we have some data.
                NotificationCenter.default.post(name: Notification.Name(rawValue: "NameNotification"), object: nil)
        }
    }
    
}
