//
//  CoinResponse.swift
//  HappyCoin
//
//  Created by Stefano on 06.02.21.
//

struct CoinMarketResponse: Codable {
    let id: String
    let image: String
    let name: String
    let symbol: String
    let currentPrice: Double
    let priceChange24h: Double
    let priceChangePercentage24h: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case image
        case name
        case symbol
        case currentPrice = "current_price"
        case priceChange24h = "price_change_24h"
        case priceChangePercentage24h = "price_change_percentage_24h"
    }
}
//{
//    "id": "bitcoin",
//    "symbol": "btc",
//    "name": "Bitcoin",
//    "image": "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1547033579",
//    "current_price": 50919,
//    "market_cap": 950597086539,
//    "market_cap_rank": 1,
//    "fully_diluted_valuation": 1071103239681,
//    "total_volume": 87863642794,
//    "high_24h": 51741,
//    "low_24h": 45671,
//    "price_change_24h": 1735.99,
//    "price_change_percentage_24h": 3.52965,
//    "market_cap_change_24h": 50149608307,
//    "market_cap_change_percentage_24h": 5.56941,
//    "circulating_supply": 18637362,
//    "total_supply": 21000000,
//    "max_supply": 21000000,
//    "ath": 58641,
//    "ath_change_percentage": -13.16763,
//    "ath_date": "2021-02-21T19:07:32.042Z",
//    "atl": 67.81,
//    "atl_change_percentage": 74992.05073,
//    "atl_date": "2013-07-06T00:00:00.000Z",
//    "roi": null,
//    "last_updated": "2021-02-24T13:02:12.354Z"
//  }
