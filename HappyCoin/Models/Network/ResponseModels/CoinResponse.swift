//
//  Coin.swift
//  HappyCoin
//
//  Created by Stefano on 07.02.21.
//

struct CoinResponse: Codable {
    let id: String
    let name: String
    var symbol: String = ""
    var numberOfUnits: Double? = nil
}

extension CoinResponse: UserCacheStringConvertible {
    static var key: String = "HappyCoin.Coin"
}
