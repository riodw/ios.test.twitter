//
//  HomeDatasource.swift
//  Project-1
//
//  Created by Riorden Weber on 7/6/17.
//  Copyright © 2017 Riorden Weber. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {
    
    let users: [User]
    
    
    required init(json: JSON) throws {
        guard let userJsonArray = json["users"].array else {
            throw NSError(domain: "com.rioweber", code: 1, userInfo: [NSLocalizedDescriptionKey: "'users' not valid in JSON."])
        }
        
        guard let tweetsJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.rioweber", code: 1, userInfo: [NSLocalizedDescriptionKey: "'tweets' not valid in JSON."])
        }
        
        self.users = userJsonArray.map({return User(json: $0)})
        self.tweets = tweetsJsonArray.map({return Tweet(json: $0)})
    }
    
    let tweets: [Tweet]
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.item]
        }
        return users[indexPath.item]
    }
    
    override func numberOfSections() -> Int {
        return 2
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }
        return users.count
    }
}
