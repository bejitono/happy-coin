//
//  PortfolioListViewModel.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

import Foundation

protocol PortfolioListViewModelOutput: AnyObject {
    func didDelete(at offsets: IndexSet)
}

struct PortfolioListViewModel {
    
    weak var output: PortfolioListViewModelOutput?
    
    var items: [PortfolioListItemViewModel] = []
    
    func delete(at offsets: IndexSet) {
        output?.didDelete(at: offsets)
    }
}

extension PortfolioListViewModel {
    
    static var empty = PortfolioListViewModel(items: [])
}
