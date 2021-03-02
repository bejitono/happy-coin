//
//  PortfolioItemViewModel.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

struct PortfolioListItemViewModel {
    let id: String
    let image: String
    let name: String
    let currentPrice: String
    let numberOfUnits: String
    let totalValue: String
    let valueIncrease: String
}

extension PortfolioListItemViewModel {
    
    init(response: Coin) {
        self.id = response.id
        self.image = response.image ?? ""
        self.name = response.name
        self.currentPrice = (response.currentPrice ?? 0).toCurrencyString(symbol: response.symbol)
        self.numberOfUnits = String(response.numberOfUnits)
        self.totalValue = response.totalValue.toCurrencyString(symbol: response.symbol)
        self.valueIncrease = (response.valueIncrease ?? 0).toPercentageString()
    }
}
