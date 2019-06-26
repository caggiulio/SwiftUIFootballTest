//
//  SharedMock.swift
//  SwiftUIFootballTest
//
//  Created by nunzio giulio caggegi on 24/06/2019.
//  Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//

import Foundation
import SwiftyJSON
import PromiseKit

public class SharedMock: NSObject {
    
    private override init() { }
    
    static let shared = SharedMock()
    
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
    
    func mockHomeCell() -> HomeCell {
        let homeCell = HomeCell(title: "Competitions", iconString: "competitions", id: 0)
        return homeCell
    }
    
    func mockHomeList() -> HomeList {
        var homeList = [HomeCell]()
        let competition = HomeCell(title: "Competitions", iconString: "competitions", id: 0)
        let teams = HomeCell(title: "Teams", iconString: "teams", id: 1)
        let players = HomeCell(title: "Players", iconString: "players", id: 2)
        
        homeList.append(competition)
        homeList.append(teams)
        homeList.append(players)
        
        let finalList = HomeList(list: homeList)
        return finalList
    }
    
    func getCompetitions() -> Promise<[Competition]> {
        firstly {
            API().getAllCompetitions()
            }.then { json in
                return Promise { prom in
                    let finalJson = json["competitions"].arrayValue
                    var list = [Competition]()
                    for sub in finalJson {
                        let client = Competition.init(fromJson: sub)
                        list.append(client)
                    }
                    prom.fulfill(list)
                }
            }
    }
}
