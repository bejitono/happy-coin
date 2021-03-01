//
//  PortfolioBuilder.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

import SwiftUI

struct PortfolioBuilder {
    
    static func makeMainView() -> some View {
        let viewModel = PortfolioViewModel(portfolioService: PortfolioService(cache: UserCache(), networkClient: NetworkClientImpl()))
        return PortfolioView(viewModel: viewModel)
            .environmentObject(AddCoinFlow())
            .environmentObject(SettingsFlow())
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
        return PortfolioListView(viewModel: viewModel).environmentObject(UpdateCoinFlow())
    }
}
