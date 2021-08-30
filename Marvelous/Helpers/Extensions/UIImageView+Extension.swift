//
//  UIImageView+Extension.swift
//  Marvelous
//
//  Created by Victor Oka on 30/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    
    func download(image url: String) {
        guard let imageURL = URL(string:url) else { return }
        self.kf.setImage(with: imageURL)
    }
    
}
