//
//  AddCoinBuilder.swift
//  HappyCoin
//
//  Created by Stefano on 06.02.21.
//

import SwiftUI

struct AddCoinBuilder {
    
    static func coinListView() -> some View {
        let viewModel = CoinListViewModel(service: CoinService(cache: UserCache(), networkClient: NetworkClientImpl()))
        return CoinListView(viewModel: viewModel)
    }
    
    static func coinAmountInputView(id: String, name: String, symbol: String) -> some View {
        let viewModel = CoinAmountInputViewModel(
            coin: CoinResponse(id: id, name: name, symbol: symbol),
            service: CoinService(cache: UserCache(), networkClient: NetworkClientImpl())
        )
        return CoinAmountInputView(viewModel: viewModel)
    }
    
    static func priceInputView(symbol: String) -> some View {
        let viewModel = PriceInputViewModel(
            symbol: symbol,
            service: CoinService(cache: UserCache(), networkClient: NetworkClientImpl())
        )
        return PriceInputView(viewModel: viewModel)
    }
}
