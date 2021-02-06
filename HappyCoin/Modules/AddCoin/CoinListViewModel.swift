//
//  CoinListViewModel.swift
//  HappyCoin
//
//  Created by Stefano on 06.02.21.
//

import Combine

final class CoinListViewModel {
    
    var items: [CoinListItemViewModel] = []
        
    private let service: CoinService
    private var disposables = Set<AnyCancellable>()
    
    init(service: CoinService) {
        self.service = service
        getCoins()
    }
}

extension CoinListViewModel {
    
    func getCoins() {
        service.fetchCoins()
            .map { response in
                response.coins.map(CoinListItemViewModel.init)
            }
            .sink { [weak self] completion in
                switch completion {
                case .failure(let error):
                    print(error)
                    self?.items = []
                case .finished:
                    break
                }
            } receiveValue: { [weak self] value in
                self?.items = value
            }
            .store(in: &disposables)
    }
}
