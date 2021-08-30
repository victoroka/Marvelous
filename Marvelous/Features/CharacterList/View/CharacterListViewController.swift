//
//  CharacterListViewController.swift
//  Marvelous
//
//  Created by Victor Oka on 29/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import UIKit

// MARK: - Character List View Controller Class
final class CharacterListViewController: UIViewController {
    
    private let viewModel: CharacterListViewModel
    private var characters: [Character]?
    
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
    }
    
    private func fetchCharacters() {
        viewModel.fetch()
    }
    
}

// MARK: - Character List View Delegate Protocol
extension CharacterListViewController: CharacterListViewModelDelegate {
    
    func fetchCharactersSuccess(characters: [Character]) {
        self.characters = characters
        self.tableView.reloadData()
    }
    
    func fetchCharactersFailure(error: String) {
        print(error)
    }
}

// MARK: - UITableView Protocols
extension CharacterListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data = characters?[indexPath.row] else { return UITableViewCell() }
        let cell = tableView.dequeue(cell: CharacterTableViewCell.self, indexPath: indexPath)
        cell.setup(with: data)
        return cell
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
