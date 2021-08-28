//
//  Router.swift
//  Marvelous
//
//  Created by Victor Oka on 27/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import Foundation
import Keys
import CommonCrypto

enum Router {
    
    case getCharacters
    case getCharactersByName(String?)
    
    var scheme: String {
        switch self {
        case .getCharacters, .getCharactersByName:
            return "https"
        }
    }
    
    var host: String {
        switch self {
        case .getCharacters, .getCharactersByName:
            return "gateway.marvel.com"
        }
    }
    
    var path: String {
        switch self {
        case .getCharacters, .getCharactersByName:
            return "/v1/public/characters"
        }
    }
    
    var method: String {
        switch self {
        case .getCharacters, .getCharactersByName:
            return "GET"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getCharacters:
            return APIConfig.authenticationKeys()
        case .getCharactersByName(let query):
            return APIConfig.authenticationKeys() + [URLQueryItem(name: "nameStartsWith", value: query)]
        }
    }
}

fileprivate struct APIConfig {
    
    fileprivate static let keys = MarvelousKeys()
    static let privateKey = keys.marvelPrivateKey
    static let apiKey = keys.marvelApiKey
    static let ts = Date().timeIntervalSince1970.description
    static let hash = "\(ts)\(privateKey)\(apiKey)".md5()
    
    static func authenticationKeys() -> [URLQueryItem] {
        return [URLQueryItem(name: "apikey", value: APIConfig.apiKey),
                URLQueryItem(name: "ts", value: APIConfig.ts),
                URLQueryItem(name: "hash", value: APIConfig.hash)]
    }
}
