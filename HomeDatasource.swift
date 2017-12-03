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
    
    required init(json: JSON) throws {var users = [User]()
        
        let array = json["users"].array
        for userJson in array! {
            let name = userJson["name"].stringValue
            let username = userJson["username"].stringValue
            let bio = userJson["bio"].stringValue
            
            let user = User(name: name, username: username, bioText: bio, profileImage: UIImage())
            // Append User
            users.append(user)
            users.append(user)
        }
        
        self.users = users
    }
    
    let tweets: [Tweet] = {
        let rioUser = User(name: "Rio Weber", username: "@rioweber", bioText: "This is my bio, I'm building an App that is for a thing but don't know what yet.", profileImage: #imageLiteral(resourceName: "rio"))
        
        let tweet = Tweet(user: rioUser, message: "This will be twitter let tweet = Tweet(user: rioUser, message: This will be twitter let tweet = Tweet(user: rioUser, message: This will be twitter ")
        
         let tweet2 = Tweet(user: rioUser, message: "This is the second tweet message for our sample project. Very very exciting message....")
        
        return[tweet, tweet2]
    }()
    
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
