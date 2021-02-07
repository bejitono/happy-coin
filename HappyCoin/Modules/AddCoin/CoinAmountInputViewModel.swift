//
//  CoinAmountInputViewModel.swift
//  HappyCoin
//
//  Created by Stefano on 07.02.21.
//

import Combine

enum NavigationState: Int {
    case viewing
    case navigate
}

final class CoinAmountInputViewModel: ObservableObject {
    
    @Published var coinTitle: String
    @Published var amount: String = "0"
    @Published var navigationState: Int? = NavigationState.viewing.rawValue
    let inputPriceTitle: String = "Input Price"
        
    private var digits: [String] = []
    private let decimal = "."
    private let symbol: String
    private let service: CoinService
    private var disposables = Set<AnyCancellable>()
    
    init(symbol: String,
         service: CoinService) {
        self.symbol = symbol
        self.service = service
        
        coinTitle = service.getCoinFor(symbol: symbol).name
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
    
    func inputPrice() {
        navigationState = NavigationState.navigate.rawValue
    }
}

private extension CoinAmountInputViewModel {
    
    func update() {
        if digits.isEmpty { return amount = "0" }
        amount = digits.joined()
    }
}