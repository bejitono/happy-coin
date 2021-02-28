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
}

final class PortfolioService {
    
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
        guard let user: User = cache.get() else { return Just([]).setFailureType(to: CoinError.self).eraseToAnyPublisher() }
        
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.coingecko.com"
        components.path = "/api/v3/coins/markets"
        components.queryItems = [
            URLQueryItem(name: "vs_currency", value: "usd"),
            URLQueryItem(name: "ids", value: user.coins.compactMap { $0.id }.joined(separator: ",")),
            URLQueryItem(name: "order", value: "market_cap_desc")
        ]
        let publisher: AnyPublisher<[CoinMarketResponse], CoinError> = networkClient.request(with: components)
        return publisher
            .map( { [weak self] response -> [Coin] in
                let user: User? = self?.cache.get()
                return response.map { coin in
                    let savedCoin = user?.coins.first(where: { $0.id == coin.id })
                    return Coin.init(response: coin, units: savedCoin?.numberOfUnits ?? 0.0)
                }
            })
            .eraseToAnyPublisher()
    }
}
