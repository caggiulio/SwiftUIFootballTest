//
//  ModelHomeCell.swift
//  SwiftUIFootballTest
//
//  Created by nunzio giulio caggegi on 24/06/2019.
//  Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//

import Foundation

class HomeCell {
    var title: String!
    var iconString: String!
    var id: Int!
    
    init (title: String, iconString: String, id: Int) {
        self.title = title
        self.iconString = iconString
        self.id = id
    }
}
