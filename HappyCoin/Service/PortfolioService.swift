//
//  PortfolioService.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

import Combine
import Foundation

protocol PortfolioFetchable {
    func portfolio(forUserId userId: String) -> AnyPublisher<PortfolioResponse, BlazeError>
}

final class PortfolioService {
    
    init() { }
}

extension PortfolioService: PortfolioFetchable {
    
    func portfolio(forUserId userId: String) -> AnyPublisher<PortfolioResponse, BlazeError> {
        return Just(data)
            .receive(on: DispatchQueue.main)
            .setFailureType(to: BlazeError.self)
            .eraseToAnyPublisher()
    }
}

private let data = PortfolioResponse(
    balance: "$1423",
    valueIncrease: "+$1000000 (+3000%)",
    items: items
)

private let items = [
    PortfolioItemResponse(
        id: "1",
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin BTC",
        currentPrice: "$130000",
        numberOfUnits: "100",
        totalValue: "$13000000",
        valueIncrease: "+$1000000 (+3000%)"
    ),
    PortfolioItemResponse(
        id: "2",
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin BTC",
        currentPrice: "$130000",
        numberOfUnits: "100",
        totalValue: "$13000000",
        valueIncrease: "+$1000000 (+3000%)"
    ),
    PortfolioItemResponse(
        id: "3",
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin BTC",
        currentPrice: "$130000",
        numberOfUnits: "100",
        totalValue: "$13000000",
        valueIncrease: "+$1000000 (+3000%)"
    ),
    PortfolioItemResponse(
        id: "4",
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin BTC",
        currentPrice: "$130000",
        numberOfUnits: "100",
        totalValue: "$13000000",
        valueIncrease: "+$1000000 (+3000%)"
    ),
    PortfolioItemResponse(
        id: "5",
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin BTC",
        currentPrice: "$130000",
        numberOfUnits: "100",
        totalValue: "$13000000",
        valueIncrease: "+$1000000 (+3000%)"
    ),
    PortfolioItemResponse(
        id: "6",
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin BTC",
        currentPrice: "$130000",
        numberOfUnits: "100",
        totalValue: "$13000000",
        valueIncrease: "+$1000000 (+3000%)"
    ),
    PortfolioItemResponse(
        id: "7",
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin BTC",
        currentPrice: "$130000",
        numberOfUnits: "100",
        totalValue: "$13000000",
        valueIncrease: "+$1000000 (+3000%)"
    ),
    PortfolioItemResponse(
        id: "8",
        image: "bitcoinsign.circle.fill",
        name: "Bitcoin BTC",
        currentPrice: "$130000",
        numberOfUnits: "100",
        totalValue: "$13000000",
        valueIncrease: "+$1000000 (+3000%)"
    )
]
