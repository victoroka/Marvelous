//
//  MockHelper.swift
//  MarvelousTests
//
//  Created by Victor Hideo Oka on 17/06/22.
//  Copyright © 2022 Victor Oka. All rights reserved.
//

import Foundation

final class MockHelper {
    
    class func loadMock<T: Codable> (from jsonName: String) -> T? {
        let path = Bundle(for: Self.self).path(forResource: jsonName, ofType: "json")
        let urlFromPath = URL(fileURLWithPath: path!)
        let data = try? Data(contentsOf: urlFromPath, options: .mappedIfSafe)
        return try? JSONDecoder().decode(T.self, from: data!)
    }
}
