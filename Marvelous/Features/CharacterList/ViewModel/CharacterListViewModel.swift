//
//  CharacterListViewModel.swift
//  Marvelous
//
//  Created by Victor Oka on 28/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import Foundation

protocol CharacterListViewModelDelegate {
    func fetchCharactersSuccess(characters: [Character])
    func fetchCharactersFailure(error: String)
}

final class CharacterListViewModel {
    
    var delegate: CharacterListViewModelDelegate
    
    init(delegate: CharacterListViewModelDelegate) {
        self.delegate = delegate
    }
    
    func fetch() {
        ServiceLayer.request(router: .getCharacters) { (result: Result<CharacterListResult, Error>)  in
            switch result {
            case .success(let characters):
                print(characters.data.results)
            case .failure(let error):
                self.delegate.fetchCharactersFailure(error: error.localizedDescription)
            }
        }
    }
}
