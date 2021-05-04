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
            let coin = Coin(response: coin, symbol: Settings().currencySymbol)
            cache.set(User(coins: [coin]))
            return
        }
        let coin = Coin(response: coin, symbol: user.settings.currencySymbol)
        if let index = user.coins.firstIndex(where: { $0.id == coin.id }) {
            user.coins[index] = coin
            cache.set(user)
            return
        }
        user.coins.append(coin)
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
            URLQueryItem(name: "per_page", value: "200"),
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
