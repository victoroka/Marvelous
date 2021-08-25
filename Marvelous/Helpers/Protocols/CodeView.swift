//
//  CodeView.swift
//  Marvelous
//
//  Created by Victor Oka on 25/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import Foundation
import SnapKit

protocol CodeView {
    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfigurarion()
    func setupView()
}

extension CodeView {
    func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfigurarion()
    }
}
