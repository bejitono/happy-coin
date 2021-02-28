//
//  CoinListItemViewModel.swift
//  HappyCoin
//
//  Created by Stefano on 06.02.21.
//

struct CoinListItemViewModel {
    let id: String
    let name: String
    let symbol: String
}

extension CoinListItemViewModel {
    
    init(response: CoinResponse) {
        self.id = response.id
        self.name = response.name
        self.symbol = response.symbol
    }
}
