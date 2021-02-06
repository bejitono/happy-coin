//
//  PortfolioBuilder.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

import SwiftUI

struct PortfolioBuilder {
    
    static func makeMainView() -> some View {
        let viewModel = PortfolioViewModel(portfolioService: PortfolioService())
        return PortfolioView(viewModel: viewModel)
    }
    
    static func makeBalanceView(
        balance: String,
        valueIncrease: String
    ) -> some View {
        let viewModel = PortfolioBalanceViewModel(balance: balance, valueIncrease: valueIncrease)
        return PortfolioBalanceView(viewModel: viewModel)
    }
    
    static func makeListView() -> some View {
        let viewModel = PortfolioListViewModel()
        return PortfolioListView(viewModel: viewModel)
    }
}
