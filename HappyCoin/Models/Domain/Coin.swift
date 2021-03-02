//
//  Coin.swift
//  HappyCoin
//
//  Created by Stefano on 28.02.21.
//

struct Coin {
    let id: String
    var image: String? = nil
    let name: String
    var symbol: String
    let numberOfUnits: Double
    var currentPrice: Double? = nil
    var totalValue: Double { numberOfUnits * (currentPrice ?? 0) }
    var valueIncrease: Double? = nil
}

extension Coin: UserCacheStringConvertible, Codable {
    static var key: String = "HappyCoin.Coin"
}

extension Coin {
    
    init(response: CoinResponse, symbol: String) {
        self.id = response.id
        self.name = response.name
        self.symbol = symbol
        self.numberOfUnits = response.numberOfUnits ?? 0
    }
    
    init(response: CoinMarketResponse, units: Double, symbol: String) {
        self.id = response.id
        self.image = response.image
        self.name = response.name
        self.symbol = symbol
        self.currentPrice = response.currentPrice
        self.numberOfUnits = units
        self.valueIncrease = response.priceChangePercentage24h
    }
}
