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
            return Constants.Request.scheme
        }
    }
    
    var host: String {
        switch self {
        case .getCharacters, .getCharactersByName:
            return Constants.Request.host
        }
    }
    
    var path: String {
        switch self {
        case .getCharacters, .getCharactersByName:
            return Constants.Request.Path.getCharacters
        }
    }
    
    var method: String {
        switch self {
        case .getCharacters, .getCharactersByName:
            return Constants.Request.Method.GET
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getCharacters:
            return APIConfig.authenticationKeys()
        case .getCharactersByName(let query):
            return APIConfig.authenticationKeys() + [URLQueryItem(name: Constants.Request.Parameters.nameStartsWith, value: query)]
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
        return [URLQueryItem(name: Constants.Request.Parameters.apiKey, value: APIConfig.apiKey),
                URLQueryItem(name: Constants.Request.Parameters.timeStamp, value: APIConfig.ts),
                URLQueryItem(name: Constants.Request.Parameters.hash, value: APIConfig.hash)]
    }
}
