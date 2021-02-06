//
//  PortfolioListViewModel.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

struct PortfolioListViewModel {
    
    var items: [PortfolioListItemViewModel] = []
}

extension PortfolioListViewModel {
    
    static var empty = PortfolioListViewModel(items: [])
}
