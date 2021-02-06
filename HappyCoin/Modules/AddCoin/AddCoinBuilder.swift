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
}
