//
//  AddCoinBuilder.swift
//  HappyCoin
//
//  Created by Stefano on 06.02.21.
//

import SwiftUI

struct AddCoinBuilder {
    
    static func coinListView() -> some View {
        let viewModel = CoinListViewModel(service: CoinService())
        return CoinListView(viewModel: viewModel)
    }
    
    static func coinAmountInputView(symbol: String) -> some View {
        let viewModel = CoinAmountInputViewModel(
            symbol: symbol,
            service: CoinService()
        )
        return CoinAmountInputView(viewModel: viewModel)
    }
    
    static func priceInputView(symbol: String) -> some View {
        let viewModel = PriceInputViewModel(
            symbol: symbol,
            service: CoinService()
        )
        return PriceInputView(viewModel: viewModel)
    }
}
