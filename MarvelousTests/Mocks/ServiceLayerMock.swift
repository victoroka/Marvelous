//
//  ServiceLayerMock.swift
//  MarvelousTests
//
//  Created by Victor Hideo Oka on 17/06/22.
//  Copyright © 2022 Victor Oka. All rights reserved.
//

import Foundation
@testable import Marvelous

final class ServiceLayerMock: MarvelRequestServiceProtocol {
    
    var data: Codable?
    var error: Error?
    var shouldReturnFailure: Bool = false
    
    func request<T>(router: Router, completion: @escaping (Result<T, Error>) -> ()) where T : Decodable, T : Encodable {
        if shouldReturnFailure {
            completion(.failure(error!))
        } else {
            completion(.success(data as! T))
        }
    }
}
