//
//  Tweet.swift
//  Project-1
//
//  Created by Riorden Weber on 9/29/17.
//  Copyright © 2017 Riorden Weber. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Tweet: JSONDecodable {
    let user: User
    let message: String
    
    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        
        self.message = json["message"].stringValue
    }
}
