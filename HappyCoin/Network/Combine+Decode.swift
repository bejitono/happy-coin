//
//  Combine+Decode.swift
//  HappyCoin
//
//  Created by Stefano on 24.02.21.
//

import Foundation
import Combine

func decode<T: Decodable>(_ data: Data) -> AnyPublisher<T, CoinError> {
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .secondsSince1970
    
    return Just(data)
        .decode(type: T.self, decoder: decoder)
        .mapError { error in
            .parsing(description: error.localizedDescription)
        }
        .eraseToAnyPublisher()
}
