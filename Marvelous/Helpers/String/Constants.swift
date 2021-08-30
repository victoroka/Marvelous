//
//  Constants.swift
//  Marvelous
//
//  Created by Victor Oka on 30/08/21.
//  Copyright © 2021 Victor Oka. All rights reserved.
//

import Foundation

struct Constants {
    
    static let initFatalErrorDefaultMessage = "init(coder:) has not been implemented"
    
    struct Request {
        static let scheme = "https"
        static let host = "gateway.marvel.com"
        
        struct Path {
            static let getCharacters = "/v1/public/characters"
        }
        
        struct Method {
            static let POST = "POST"
            static let GET = "GET"
            static let PATCH = "PATCH"
            static let PUT = "PUT"
            static let DELETE = "DELETE"
        }
        
        struct Parameters {
            static let apiKey = "apikey"
            static let timeStamp = "ts"
            static let hash = "hash"
            static let nameStartsWith = "nameStartsWith"
            static let offset = "offset"
        }
    }
}
