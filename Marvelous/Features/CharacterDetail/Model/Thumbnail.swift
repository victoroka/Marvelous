//
//  Thumbnail.swift
//  Marvelous
//
//  Created by Victor Oka on 30/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import Foundation

struct Thumbnail: Codable {
    
    let path: String
    let `extension`: String
    
    var fullPath: String {
        return "\(path).\(`extension`)"
    }
    
    enum Codingkeys: String, CodingKey {
        case path
        case `extension`
    }
}
