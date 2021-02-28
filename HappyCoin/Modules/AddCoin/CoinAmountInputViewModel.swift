//
//  CoinAmountInputViewModel.swift
//  HappyCoin
//
//  Created by Stefano on 07.02.21.
//

import Combine

struct NavigationState {
    static let viewing = 0
    static let navigate = 1
}

final class CoinAmountInputViewModel: ObservableObject {
    
    @Published var amount: String = "0"
    @Published var navigationState: Int? = NavigationState.viewing
    var coinTitle: String { coin.name }
    var symbol: String { coin.symbol }
    let inputPriceTitle: String = "Save"
        
    private var digits: [String] = []
    private let decimal = "."
    
    private var coin: CoinResponse
    private let service: CoinService
    private var disposables = Set<AnyCancellable>()
    
    init(coin: CoinResponse,
         service: CoinService) {
        self.coin = coin
        self.service = service
    }
    
    func update(digit: Int) {
        digits.append(String(digit))
        update()
    }
    
    func addDecimal() {
        guard !digits.contains(decimal) else { return }
        digits.append(decimal)
        update()
    }
    
    func deleteDigit() {
        _ = digits.popLast()
        if digits.last == decimal { _ = digits.popLast() }
        update()
    }
    
    func saveAmount() {
        guard let amount = Double(amount) else { return }
        coin.numberOfUnits = amount
        service.save(coin: coin)
    }
    
//    func inputPrice() {
//        navigationState = NavigationState.navigate
//    }
}

private extension CoinAmountInputViewModel {
    
    func update() {
        if digits.isEmpty { return amount = "0" }
        amount = digits.joined()
    }
}
