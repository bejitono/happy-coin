//
//  PriceAmountViewModel.swift
//  HappyCoin
//
//  Created by Stefano on 07.02.21.
//

import Combine

final class PriceInputViewModel: ObservableObject {
    
    @Published var coinTitle: String = "Price per coin"
    @Published var amount: String = ""
    let inputPriceTitle: String = "Save"
    let setCurrentPriceTitle: String = "Set current price"
        
    private let currencySymbol = "$"
    private var digits: [String] = []
    private let decimal = "."
    private let symbol: String
    private let service: CoinService
    private var disposables = Set<AnyCancellable>()
    
    init(symbol: String,
         service: CoinService) {
        self.symbol = symbol
        self.service = service
        update()
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
    
    func savePrice() {
        print(amount)
    }
    
    func setCurrentPrice() {
        
    }
}

private extension PriceInputViewModel {
    
    func update() {
        if digits.isEmpty { return amount = currencySymbol + "0" }
        amount = currencySymbol + digits.joined()
    }
}
