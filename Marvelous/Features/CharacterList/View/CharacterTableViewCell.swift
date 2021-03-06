//
//  CharacterTableViewCell.swift
//  Marvelous
//
//  Created by Victor Oka on 29/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import UIKit
import SnapKit

final class CharacterTableViewCell: UITableViewCell {

    // MARK: Cell Components
    private lazy var containerView: UIView = .init()
    private lazy var characterImageView: UIImageView = .init()
    
    lazy var nameBackgroundView: UIView = .init()
    lazy var nameLabel: UILabel = .init()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.initFatalErrorDefaultMessage)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func setup(with viewModel: CharacterTableViewCellViewModel) {
        nameLabel.text = viewModel.getName()
        characterImageView.download(image: viewModel.getImageFullPath())
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

// MARK: - Character Table View Cell Code View Protocol
extension CharacterTableViewCell: CodeView {
    
    func buildViewHierarchy() {
        containerView.addSubview(characterImageView)
        nameBackgroundView.addSubview(nameLabel)
        characterImageView.addSubview(nameBackgroundView)
        addSubview(containerView)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
            make.height.equalToSuperview()
            make.centerX.centerY.equalToSuperview()
        }
        
        characterImageView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
            make.height.equalToSuperview()
            make.centerX.centerY.equalToSuperview()
        }
        
        nameBackgroundView.snp.makeConstraints { (make) in
            make.bottom.left.right.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.25)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.right.equalToSuperview().inset(16)
            make.centerY.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurarion() {
        nameBackgroundView.backgroundColor = .white.withAlphaComponent(0.5)
        characterImageView.contentMode = .scaleAspectFill
        characterImageView.clipsToBounds = true
        
        nameLabel.numberOfLines = 0
        nameLabel.font = .customFont(type: .avenirBlack, size: 16)
        nameLabel.textColor = .red
    }
}
