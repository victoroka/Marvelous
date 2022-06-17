//
//  CharacterTableViewCellViewModel.swift
//  Marvelous
//
//  Created by Victor Hideo Oka on 17/06/22.
//  Copyright © 2022 Victor Oka. All rights reserved.
//

import Foundation

final class CharacterTableViewCellViewModel {
    
    private let character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    func getName() -> String {
        return character.name
    }
    
    func getImageFullPath() -> String {
        return character.thumbnail.fullPath
    }
}
