//
//  HomeDatasource.swift
//  Project-1
//
//  Created by Riorden Weber on 7/6/17.
//  Copyright © 2017 Riorden Weber. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let users: [User] = {
        let rioUser = User(name_first: "Rio", name_last: "Weber", email: "rio@medtricslab.com", type: "Resident", role: "PGY2", profileImage: #imageLiteral(resourceName: "rio"))
        
        let toshUser = User(name_first: "Santhosh", name_last: "Cherian", email: "santhosh@medtricslab.com", type: "Faculty", role: "Supervising Physician", profileImage: #imageLiteral(resourceName: "tosh"))
        
        let chrisUser = User(name_first: "Chris", name_last: "Tokodi", email: "chris@medtricslab.com", type: "Staff", role: "Nurse", profileImage: #imageLiteral(resourceName: "chris"))
        
        return [rioUser, toshUser, chrisUser]
    }()
    
    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
    
    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }
    
    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }
    
    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }
}
