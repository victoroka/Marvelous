//
//  CharacterTableViewCell.swift
//  Marvelous
//
//  Created by Victor Oka on 29/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import UIKit

final class CharacterTableViewCell: UITableViewCell {

    // MARK: Cell Components
    private lazy var containerView: UIView = {
        let container = UIView(frame: .zero)
        return container
    }()
    
    private lazy var characterImageView: UIImageView = {
        let characterImageView = UIImageView()
        return characterImageView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont.defaultBold(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    
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

    func setup(with character: Character) {
        nameLabel.text = character.name
        characterImageView.download(image: character.thumbnail.fullPath)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

// MARK: - Character Table View Cell Code View Protocol
extension CharacterTableViewCell: CodeView {
    
    func buildViewHierarchy() {
        containerView.addSubview(characterImageView)
        characterImageView.addSubview(nameLabel)
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
        
        characterImageView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalToSuperview()
            make.centerX.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurarion() {
        characterImageView.contentMode = .scaleAspectFit
    }
}
