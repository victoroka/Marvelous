//
//  LoadingTableViewCell.swift
//  Marvelous
//
//  Created by Victor Oka on 30/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import UIKit

final class LoadingTableViewCell: UITableViewCell {
    
    // MARK: Cell Components
    private lazy var containerView: UIView = {
        let container = UIView(frame: .zero)
        return container
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(frame: .zero)
        return activityIndicator
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.initFatalErrorDefaultMessage)
    }
    
    func startAnimation() {
        activityIndicator.startAnimating()
    }
}

extension LoadingTableViewCell: CodeView {
    func buildViewHierarchy() {
        containerView.addSubview(activityIndicator)
        addSubview(containerView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(50)
            make.centerX.equalToSuperview()
        }
        
        activityIndicator.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
            make.height.width.equalTo(15)
        }
    }
    
    func setupAdditionalConfigurarion() {
        containerView.backgroundColor = .clear
        activityIndicator.color = .lightGray
    }
}
