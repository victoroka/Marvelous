//
//  CharacterListViewModel.swift
//  Marvelous
//
//  Created by Victor Oka on 28/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import Foundation

protocol CharacterListViewModelDelegate: AnyObject {
    func fetchCharactersSuccess()
    func fetchCharactersFailure(error: String)
}

final class CharacterListViewModel {
    
    private var characters: [Character] = [Character]()
    private var totalCharacters: Int = 0
    private var offset: Int = 0
    private let limit: Int = 20
    
    weak var delegate: CharacterListViewModelDelegate?
    
    func fetch(service: MarvelRequestServiceProtocol = ServiceLayer.shared) {
        service.request(router: .getCharacters(String(offset))) { (result: Result<CharacterListResult, Error>)  in
            switch result {
            case .success(let characterListResult):
                self.characters += characterListResult.data.results
                self.offset += characterListResult.data.limit
                self.totalCharacters = characterListResult.data.total
                self.delegate?.fetchCharactersSuccess()
            case .failure(let error):
                self.delegate?.fetchCharactersFailure(error: error.localizedDescription)
            }
        }
    }
    
    func getCharactersList() -> [Character] {
        return characters
    }
}
