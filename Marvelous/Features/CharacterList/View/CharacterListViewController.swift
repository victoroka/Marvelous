//
//  CharacterListViewController.swift
//  Marvelous
//
//  Created by Victor Oka on 29/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import UIKit
import SnapKit

// MARK: - Character List View Controller Class
final class CharacterListViewController: UIViewController {
    
    private let viewModel: CharacterListViewModel
    
    // MARK: Screen Components
    private let tableView = UITableView()
    
    init(viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError(Constants.initFatalErrorDefaultMessage)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupView()
        setupTableView()
        fetchCharacters()
    }
    
    private func setupViewModel() {
        viewModel.delegate = self
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.register(cellType: CharacterTableViewCell.self)
        tableView.register(cellType: LoadingTableViewCell.self)
    }
    
    private func fetchCharacters() {
        viewModel.fetch()
    }
}

// MARK: - Character List View Delegate Protocol
extension CharacterListViewController: CharacterListViewModelDelegate {
    
    func fetchCharactersSuccess() {
        self.tableView.reloadData()
    }
    
    func fetchCharactersFailure(error: String) {
        print(error)
    }
}

// MARK: - UITableView Protocols
extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 175
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCharactersList().count
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.getCharactersList().count - 1 {
            fetchCharacters()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == viewModel.getCharactersList().count - 1 {
            let cell = tableView.dequeue(cell: LoadingTableViewCell.self, indexPath: indexPath)
            cell.startAnimation()
            return cell
        } else {
            let charactersList = viewModel.getCharactersList()
            let data = charactersList[indexPath.row]
            let viewModel: CharacterTableViewCellViewModel = .init(character: data)
            let cell = tableView.dequeue(cell: CharacterTableViewCell.self, indexPath: indexPath)
            cell.setup(with: viewModel)
            return cell
        }
    }
}

// MARK: - Character List View Controller Code View Protocol
extension CharacterListViewController: CodeView {
    
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    func setupAdditionalConfigurarion() {
        view.backgroundColor = .white
    }
}
