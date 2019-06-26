//
//  FontBook.swift
//  SwiftUIFootballTest
//
//  Created by nunzio giulio caggegi on 24/06/2019.
//  Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

enum FontBook: String {
    case Regular = "Nike Bureau"
    
    func of(size: CGFloat) -> Font {
        return Font.custom(self.rawValue, size: size)
    }
}
