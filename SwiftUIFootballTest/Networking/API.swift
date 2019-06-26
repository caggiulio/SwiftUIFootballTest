//
//  API.swift
//  SwiftUIFootballTest
//
//  Created by nunzio giulio caggegi on 24/06/2019.
//  Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//

import Foundation
import PromiseKit
import  SwiftyJSON
import Combine

public class API: RestClient {
    
    init() {
        super.init(baseURL: .base)
    }
    
    func getAllCompetitions() -> Promise<JSON> {
        let uriString = "/competitions/"
        return request(.get, URIString: uriString, parameters: nil, withQuery: false, withLoader: false)
    }
}
