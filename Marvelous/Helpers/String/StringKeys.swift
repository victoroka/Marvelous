//
//  StringKeys.swift
//  Marvelous
//
//  Created by Victor Oka on 25/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import Foundation

enum StringKeys: String {
    
    // MARK: - Strings
    case welcome
    
}

extension StringKeys {
    var localized: String {
        return NSLocalizedString(self.rawValue, comment: "")
    }
}
