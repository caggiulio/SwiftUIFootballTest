//
//  FontBook.swift
//  SwiftUIFootballTest
//
//  Created by nunzio giulio caggegi on 24/06/2019.
//  Copyright © 2019 nunzio giulio caggegi. All rights reserved.
//

import Foundation
import UIKit

enum FontBook: String {
    case Regular = "Gobold Regular"
    case Bold = "Gobold Bold"
    case RegularItalic = "Gobold Italic"
    case HighBold = "Gobold High Bold"
    
    func of(size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}
