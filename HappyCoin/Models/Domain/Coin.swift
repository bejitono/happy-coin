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
    let symbol: String
    let numberOfUnits: Double
    var currentPrice: Double? = nil
    var totalValue: Double { numberOfUnits * (currentPrice ?? 0) }
    var valueIncrease: Double? = nil
}

extension Coin: UserCacheStringConvertible, Codable {
    static var key: String = "HappyCoin.Coin"
}

extension Coin {
    
    init(response: CoinResponse) {
        self.id = response.id
        self.name = response.name
        self.symbol = response.symbol
        self.numberOfUnits = response.numberOfUnits ?? 0
    }
    
    init(response: CoinMarketResponse, units: Double) {
        self.id = response.id
        self.image = response.image
        self.name = response.name
        self.symbol = response.symbol
        self.currentPrice = response.currentPrice
        self.numberOfUnits = units
        self.valueIncrease = response.priceChangePercentage24h
    }
}
