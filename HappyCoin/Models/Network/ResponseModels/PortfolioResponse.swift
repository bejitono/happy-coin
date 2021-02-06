//
//  PortfolioResponse.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

struct PortfolioResponse {
    let balance: String
    let valueIncrease: String
    let items: [PortfolioItemResponse]
}

struct PortfolioItemResponse {
    let id: String
    let image: String
    let name: String
    let currentPrice: String
    let numberOfUnits: String
    let totalValue: String
    let valueIncrease: String
}
