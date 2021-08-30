//
//  Character.swift
//  Marvelous
//
//  Created by Victor Oka on 27/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import Foundation

struct Character: Codable {
    
    let id: Int
    let name: String
    let description: String
    let thumbnail: Thumbnail
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
    }
}
