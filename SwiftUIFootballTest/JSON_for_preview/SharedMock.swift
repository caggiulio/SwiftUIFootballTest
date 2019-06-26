//
//  SharedMock.swift
//  SwiftUIFootballTest
//
//  Created by nunzio giulio caggegi on 24/06/2019.
//  Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//

import Foundation
import SwiftyJSON

public class MockShared: NSObject {
    
    private override init() { }
    
    static let shared = MockShared()
    
    func mockCompetions() -> [Competition] {
        let path = Bundle.main.path(forResource: "competitions", ofType: "json")!
        let jsonString = try? String(contentsOfFile: path, encoding: String.Encoding.utf8)
        let json = JSON(parseJSON: jsonString!)
        let finalJson = json["competitions"].arrayValue
        var list = [Competition]()
        for sub in finalJson {
            let client = Competition.init(fromJson: sub)
            list.append(client)
        }
        return list
    }
}
