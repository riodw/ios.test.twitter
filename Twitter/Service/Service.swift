//
//  Service.swift
//  Project-1
//
//  Created by Riorden Weber on 12/3/17.
//  Copyright © 2017 Riorden Weber. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

struct Service {
    
    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")
    let data_right = "/twitter/home"
    let data_null = ""
    let data_wrong = "/twitter/home1"
    
    static let sharedInstance = Service()
    
    func fetchHomeFeed(completion: @escaping (HomeDatasource?, Error?) -> ()) {
        
        let request: APIRequest<HomeDatasource, JSONError> = tron.request(data_right)
        
        request.perform(withSuccess: { (homeDatasource) in
            print("Successfully fetched json")
            
            // Call back
            completion(homeDatasource, nil)
            
        }) { (err) in
            print("Failed to fetch json...", err)
            
            completion(nil, err)
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("JSON EROR")
        }
    }
    
}
