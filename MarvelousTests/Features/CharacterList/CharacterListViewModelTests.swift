//
//  CharacterListViewModelTests.swift
//  MarvelousTests
//
//  Created by Victor Hideo Oka on 17/06/22.
//  Copyright © 2022 Victor Oka. All rights reserved.
//

import XCTest
@testable import Marvelous

class CharacterListViewModelTests: XCTestCase {
    
    let viewModel: CharacterListViewModel = .init()
    
    func testGetCharactersList_WithMockCharacters_ShouldReturnList() {
        // Arrange
        let serviceMock = ServiceLayerMock()
        let data: CharacterListResult = MockHelper.loadMock(from: "characters_response_mock")!
        serviceMock.data = data
        
        // Act
        viewModel.fetch(service: serviceMock)
        let numberOfCharacters = viewModel.getCharactersList().count
        
        // Assert
        XCTAssertEqual(numberOfCharacters, 3)
    }
    
    func testGetCharactersList_WithNoCharacters_ShouldReturnFailure() {
        // Arrange
        let serviceMock = ServiceLayerMock()
        let err: NSError = .init(domain: "", code: 500)
        serviceMock.error = err
        serviceMock.shouldReturnFailure = true
        
        // Act
        viewModel.fetch(service: serviceMock)
        let numberOfCharacters = viewModel.getCharactersList().count
        
        // Assert
        XCTAssertEqual(numberOfCharacters, 0)
    }
}
