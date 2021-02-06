//
//  PortfolioBalanceViewModel.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

import Combine
import Foundation

struct PortfolioBalanceViewModel {
    
    var balance: String
    var valueIncrease: String
}

extension PortfolioBalanceViewModel {
    
    init(response: PortfolioResponse) {
        self.balance = response.balance
        self.valueIncrease = response.valueIncrease
    }
    
    static var empty = PortfolioBalanceViewModel(
        balance: "-",
        valueIncrease: "-"
    )
}
