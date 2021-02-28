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
    
    static var empty = PortfolioBalanceViewModel(
        balance: "-",
        valueIncrease: "-"
    )
}
