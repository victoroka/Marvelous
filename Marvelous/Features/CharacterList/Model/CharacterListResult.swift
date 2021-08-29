//
//  CharacterListResult.swift
//  Marvelous
//
//  Created by Victor Oka on 28/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import Foundation

// MARK: - Character List Result Model
struct CharacterListResult: Codable {
    
    let code: Int
    let status: String
    let copyright: String
    let attributionText: String
    let attributionHTML: String
    let data: CharacterListData
    
    enum CodingKeys: String, CodingKey {
        case code
        case status
        case copyright
        case attributionText
        case attributionHTML
        case data
    }
}

// MARK: - Character List Data Model
struct CharacterListData: Codable {
    
    let offset: Int
    let limit: Int
    let total: Int
    let count: Int
    let results: [Character]
    
    enum CodingKeys: String, CodingKey {
        case offset
        case limit
        case total
        case count
        case results
    }
}
