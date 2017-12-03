//
//  Tweet.swift
//  Project-1
//
//  Created by Riorden Weber on 9/29/17.
//  Copyright © 2017 Riorden Weber. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Tweet {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: json)
        
        self.message = json["message"].stringValue
    }
}
