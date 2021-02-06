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
    
    init(response: PortfolioItemResponse) {
        self.id = response.id
        self.image = response.image
        self.name = response.name
        self.currentPrice = response.currentPrice
        self.numberOfUnits = response.numberOfUnits
        self.totalValue = response.totalValue
        self.valueIncrease = response.valueIncrease
    }
}
