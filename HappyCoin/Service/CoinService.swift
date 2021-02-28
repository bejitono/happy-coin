//
//  CoinService.swift
//  HappyCoin
//
//  Created by Stefano on 06.02.21.
//

import Combine
import Foundation

protocol CoinServiceable {
    func save(coin: CoinResponse)
    func fetchCoins() -> AnyPublisher<[CoinResponse], CoinError>
    func fetchMarketData(forIds ids: [String], currency: String) -> AnyPublisher<[CoinMarketResponse], CoinError>
}

final class CoinService {
    
    private let cache: UserCache
    private let networkClient: NetworkClient
    
    init(cache: UserCache,
         networkClient: NetworkClient) {
        self.cache = cache
        self.networkClient = networkClient
    }
}

extension CoinService: CoinServiceable {
    
    func save(coin: CoinResponse) {
        guard var user: User = cache.get() else {
            cache.set(User(coins: [Coin(response: coin)]))
            return
        }
        user.coins.append(Coin(response: coin))
        cache.set(user)
    }
    
    func fetchCoins() -> AnyPublisher<[CoinResponse], CoinError> {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coingecko.com"
        components.path = "/api/v3/coins/markets"
        components.queryItems = [
            URLQueryItem(name: "vs_currency", value: "usd"),
            URLQueryItem(name: "order", value: "market_cap_desc"),
            URLQueryItem(name: "per_page", value: "100"),
            URLQueryItem(name: "page", value: "1")
        ]
        return networkClient.request(with: components)
    }
    
    func fetchMarketData(forIds ids: [String], currency: String = "usd") -> AnyPublisher<[CoinMarketResponse], CoinError> {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coingecko.com"
        components.path = "/api/v3/coins/markets"
        components.queryItems = [
            URLQueryItem(name: "vs_currency", value: currency),
            URLQueryItem(name: "ids", value: ids.joined(separator: ",")),
            URLQueryItem(name: "order", value: "market_cap_desc")
        ]
        return networkClient.request(with: components)
    }
}

private let items = [
    CoinMarketResponse(id: "bitcoin", image: "", name: "bitcoin", symbol: "btc", currentPrice: 12345.99, priceChange24h: 1234, priceChangePercentage24h: 23.23)
]
