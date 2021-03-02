//
//  PortfolioService.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

import Combine
import Foundation

protocol PortfolioFetchable {
    func portfolio() -> AnyPublisher<[Coin], CoinError>
    func remove(coinId: String) -> AnyPublisher<[Coin], CoinError>
}

final class PortfolioService {
    
    private var coins: [Coin] = []
    private let cache: UserCache
    private let networkClient: NetworkClient
    private var disposables = Set<AnyCancellable>()
    
    init(cache: UserCache,
         networkClient: NetworkClient) {
        self.cache = cache
        self.networkClient = networkClient
    }
}

extension PortfolioService: PortfolioFetchable {
    
    func portfolio() -> AnyPublisher<[Coin], CoinError> {
        guard let user: User = cache.get(), !user.coins.isEmpty else {
            return Just([]).setFailureType(to: CoinError.self).eraseToAnyPublisher()
        }
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coingecko.com"
        components.path = "/api/v3/coins/markets"
        components.queryItems = [
            URLQueryItem(name: "vs_currency", value: user.settings.currencyId),
            URLQueryItem(name: "ids", value: user.coins.compactMap { $0.id }.joined(separator: ",")),
            URLQueryItem(name: "order", value: "market_cap_desc")
        ]
        let publisher: AnyPublisher<[CoinMarketResponse], CoinError> = networkClient.request(with: components)
        return publisher
            .map( { [weak self] response -> [Coin] in
                guard let self = self else { return [] }
                self.coins = response.map { coin in
                    let savedCoin = user.coins.first(where: { $0.id == coin.id })
                    return Coin(
                        response: coin,
                        units: savedCoin?.numberOfUnits ?? 0.0,
                        symbol: user.settings.currencySymbol
                    )
                }
                return self.coins
            })
            .eraseToAnyPublisher()
    }
    
    func remove(coinId: String) -> AnyPublisher<[Coin], CoinError> {
        guard var user: User = cache.get(),
              let userCoinIndex = user.coins.firstIndex(where: { $0.id == coinId }),
              let coinIndex = coins.firstIndex(where: { $0.id == coinId })
        else {
            return Just([]).setFailureType(to: CoinError.self).eraseToAnyPublisher()
        }
        user.coins.remove(at: userCoinIndex)
        coins.remove(at: coinIndex)
        cache.set(user)
        return Just(coins).setFailureType(to: CoinError.self).eraseToAnyPublisher()
    }
}
