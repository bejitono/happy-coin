//
//  CoinListItemViewModel.swift
//  HappyCoin
//
//  Created by Stefano on 06.02.21.
//

struct CoinListItemViewModel {
    let image: String
    let name: String
    let symbol: String
}

extension CoinListItemViewModel {
    
    init(response: CoinResponse) {
        self.image = response.image
        self.name = response.name
        self.symbol = response.symbol
    }
}
