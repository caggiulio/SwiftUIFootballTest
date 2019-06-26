//
//  Networking.swift
//  SwiftUIFootballTest
//
//  Created by nunzio giulio caggegi on 24/06/2019.
//  Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//

import Foundation
import Foundation
import Alamofire
import PromiseKit
import SwiftyJSON

// enum used for convenience purposes (optional)
public enum ServerURL: String {
    case base = "https://api.football-data.org/v2"
}

public class RestClient {
    var baseURL: String
    
    var defaultHeader: HTTPHeaders = [
        "Content-Type": "application/json",
        "X-Auth-Token": "801f1a302f6c4e2b9d992e326d6c99bd"
    ]
    
    public init(baseURL: ServerURL = .base) {
        self.baseURL = baseURL.rawValue
    }
    
    func request(_ method: HTTPMethod, URIString: String, parameters: [String:AnyObject]?, withQuery: Bool, withLoader: Bool,
                 headers: HTTPHeaders = [:]) -> Promise < JSON > {
        return Promise { prom in
            let query: String = baseURL+URIString
            let header = defaultHeader
            
            Alamofire.request(query, method: method,
                              parameters: method == .get ? nil : parameters,
                              encoding: JSONEncoding.default,
                              headers: header).responseJSON { (response) in
                                
                                switch response.result {
                                case .success( _):
                                    let js = JSON(response.data as Any)
                                    prom.fulfill(js)
                                case .failure(let error):
                                    prom.reject(error)
                                }
            }
        }
    }
}
