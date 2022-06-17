//
//  CharacterTableViewCellViewModelTests.swift
//  MarvelousTests
//
//  Created by Victor Hideo Oka on 17/06/22.
//  Copyright © 2022 Victor Oka. All rights reserved.
//

import XCTest
@testable import Marvelous

class CharacterTableViewCellViewModelTests: XCTestCase {
    
    var viewModel: CharacterTableViewCellViewModel?

    func testGetName_WithMockCharacter_ShouldReturnName() {
        // Arrange
        let data: Character = MockHelper.loadMock(from: "character_mock")!
        
        // Act
        viewModel = .init(character: data)
        let name = viewModel?.getName()
        
        // Assert
        XCTAssertEqual(name, "3-D Man")
    }
    
    func testGetImageFullPath_WithMockCharacter_ShouldReturnPath() {
        // Arrange
        let data: Character = MockHelper.loadMock(from: "character_mock")!
        
        // Act
        viewModel = .init(character: data)
        let path = viewModel?.getImageFullPath()
        
        // Assert
        XCTAssertEqual(path, "http://i.annihil.us/u/prod/marvel/i/mg/c/e0/535fecbbb9784.jpg")
    }

}
