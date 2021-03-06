//
//  PortfolioViewModel.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

import Combine
import Foundation

final class PortfolioViewModel: ObservableObject {
    
    @Published var happy: Bool?
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
        self.listViewModel.output = self
        getPortfolio()
    }
    
    func getPortfolio() {
        portfolioService.portfolio()
            .map { response in
                (
                    items: response.map(PortfolioListItemViewModel.init),
                    balance: PortfolioBalanceViewModel(
                        balance: response
                            .map { ($0.currentPrice ?? 0) * $0.numberOfUnits }
                            .reduce(0, +)
                            .toCurrencyString(symbol: response.first?.symbol),
                        valueIncrease: ""
                    ),
                    happy: response
                        .compactMap { $0.valueIncrease }
                        .reduce(0, +)
                        .sign != .minus
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
                self?.happy = value.happy
            }
            .store(in: &disposables)
    }
}

extension PortfolioViewModel: PortfolioListViewModelOutput {
    
    func didDelete(at offsets: IndexSet) {
        guard let index = offsets.first else { return }
        let coin = listViewModel.items[index]
        listViewModel.items.remove(atOffsets: offsets)
        portfolioService.remove(coinId: coin.id)
            .map { response in
                (
                    items: response.map(PortfolioListItemViewModel.init),
                    balance: PortfolioBalanceViewModel(
                        balance: response
                            .map { ($0.currentPrice ?? 0) * $0.numberOfUnits }
                            .reduce(0, +)
                            .toCurrencyString(symbol: response.first?.symbol),
                        valueIncrease: ""
                    )
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
    
    func didUpdate() {
        getPortfolio()
    }
}
