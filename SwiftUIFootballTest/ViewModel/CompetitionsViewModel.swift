//
//  CompetitionsViewModel.swift
//  SwiftUIFootballTest
//
//  Created by nunzio giulio caggegi on 25/06/2019.
//  Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import PromiseKit

public class CompetitionsViewModel: BindableObject {
    
    init() {
        DispatchQueue.main.async {
            self.getCompetitions()
        }
    }
    
    public let didChange = PassthroughSubject<CompetitionsViewModel, Never>()
    
    var competitions = [Competition]() {
        didSet {
            didChange.send(self)
        }
    }
    
    var competitionsWithTeams = [Competition]() {
        didSet {
            didChange.send(self)
        }
    }
    
    var changeList: Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    
    func getCompetitions(){
        firstly {
                API().getAllCompetitions()
            }.done { json in
                let finalJson = json["competitions"].arrayValue
                var finalList = [Competition]()
                for sub in finalJson {
                    let client = Competition.init(fromJson: sub)
                    finalList.append(client)
                }
                self.competitions = finalList
                self.competitionsWithTeams = finalList.filter({ (competion) -> Bool in
                    return competion.hasTeam
                })
            }.catch { (error) in
                print(error)
        }
    }
}
