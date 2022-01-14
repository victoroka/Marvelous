//
//  UIStackView+Extension.swift
//  Marvelous
//
//  Created by Victor Hideo Oka on 29/12/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import UIKit

extension UIStackView {
    
    func add(views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
    
}
