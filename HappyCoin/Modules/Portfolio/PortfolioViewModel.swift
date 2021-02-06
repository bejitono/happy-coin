//
//  PortfolioViewModel.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

import Combine

final class PortfolioViewModel: ObservableObject {
    
    @Published var balanceViewModel: PortfolioBalanceViewModel = .empty
    @Published var listViewModel: PortfolioListViewModel
    
    private let portfolioService: PortfolioService
    private var disposables = Set<AnyCancellable>()
    
    init(balanceViewModel: PortfolioBalanceViewModel = .empty,
         listViewModel: PortfolioListViewModel = .empty,
         portfolioService: PortfolioService) {
        self.balanceViewModel = balanceViewModel
        self.listViewModel = listViewModel
        self.portfolioService = portfolioService
        getPortfolio(forUserId: "1")
    }
    
    func getPortfolio(forUserId userId: String) {
        portfolioService.portfolio(forUserId: userId)
            .map { response in
                (
                    items: response.items.map(PortfolioListItemViewModel.init),
                    balance: PortfolioBalanceViewModel(response: response)
                )
            }
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    self?.listViewModel.items = []
                    self?.balanceViewModel = .empty
                case .finished:
                    break
                }
            } receiveValue: { [weak self] value in
                self?.listViewModel.items = value.items
                self?.balanceViewModel.balance = value.balance.balance
                self?.balanceViewModel.valueIncrease = value.balance.valueIncrease
            }
            .store(in: &disposables)
    }
}
