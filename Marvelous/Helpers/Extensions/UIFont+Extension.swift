//
//  UIFont+Extension.swift
//  Marvelous
//
//  Created by Victor Oka on 25/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import UIKit

extension UIFont {
    
    static func customFont(type: FontType, size: CGFloat) -> UIFont {
        guard let font = UIFont(name: type.getName(), size: size) else {
            return UIFont.systemFont(ofSize: size, weight: type.getWeight())
        }
        return font
    }
    
}

enum FontType {
    
    case avenirLight
    case avenirMedium
    case avenirBlack
    
    func getName() -> String {
        switch self {
        case .avenirLight:
            return "Avenir-Light"
        case .avenirMedium:
            return "Avenir-Medium"
        case .avenirBlack:
            return "Avenir-Black"
        }
    }
    
    func getWeight() -> UIFont.Weight {
        switch self {
        case .avenirLight:
            return .light
        case .avenirMedium:
            return .medium
        case .avenirBlack:
            return .black
        }
    }
}
