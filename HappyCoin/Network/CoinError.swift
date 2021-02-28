//
//  NetworkError.swift
//  HappyCoin
//
//  Created by Stefano on 24.02.21.
//

enum CoinError: Error {
    case failedToCreateURL
    case network(description: String)
    case parsing(description: String)
}
