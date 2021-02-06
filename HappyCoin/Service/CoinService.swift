//
//  CoinService.swift
//  HappyCoin
//
//  Created by Stefano on 06.02.21.
//

import Combine
import Foundation

protocol CoinServiceable {
    func fetchCoins() -> AnyPublisher<CoinListResponse, BlazeError>
}

final class CoinService {
    
    init() { }
}

extension CoinService: CoinServiceable {
    
    func fetchCoins() -> AnyPublisher<CoinListResponse, BlazeError> {
        return Just(data)
            .receive(on: DispatchQueue.main)
            .setFailureType(to: BlazeError.self)
            .eraseToAnyPublisher()
    }
}

private let data = CoinListResponse(
    coins: items
)

private let items = [
    CoinResponse(
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin",
        symbol: "BTC"
    ),
    CoinResponse(
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin",
        symbol: "BTC"
    ),
    CoinResponse(
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin",
        symbol: "BTC"
    ),
    CoinResponse(
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin",
        symbol: "BTC"
    ),
    CoinResponse(
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin",
        symbol: "BTC"
    ),
    CoinResponse(
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin",
        symbol: "BTC"
    ),
    CoinResponse(
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin",
        symbol: "BTC"
    ),
    CoinResponse(
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin",
        symbol: "BTC"
    ),
    CoinResponse(
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin",
        symbol: "BTC"
    )
]
