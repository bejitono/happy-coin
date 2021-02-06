//
//  CoinResponse.swift
//  HappyCoin
//
//  Created by Stefano on 06.02.21.
//

struct CoinListResponse {
    let coins: [CoinResponse]
}

struct CoinResponse {
    let image: String
    let name: String
    let symbol: String
}
