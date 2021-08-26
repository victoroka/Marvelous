//
//  ViewController.swift
//  Marvelous
//
//  Created by Victor Oka on 25/08/21.
//

import UIKit

class ViewController: UIViewController {

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = StringKeys.welcome.localized
        label.font = UIFont.defaultBold(ofSize: 22)
        return label
    }()
    
    override func loadView() {
        let view = UIView(frame: UIScreen.main.bounds)
        view.backgroundColor = .red
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }


}

extension ViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(welcomeLabel)
    }
    
    func setupConstraints() {
        welcomeLabel.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurarion() {}
}
