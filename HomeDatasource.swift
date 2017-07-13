//
//  HomeDatasource.swift
//  Project-1
//
//  Created by Riorden Weber on 7/6/17.
//  Copyright © 2017 Riorden Weber. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {
    
    let words = ["Rio Weber", "Santhosh Cherian", "Chris Tokodi"]
    
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
        return words[indexPath.item]
    }
    
    override func numberOfItems(_ section: Int) -> Int {
        return words.count
    }
}
