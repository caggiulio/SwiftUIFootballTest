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
            }.catch { (error) in
                print(error)
        }
    }
}
