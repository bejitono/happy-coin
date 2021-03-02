//
//  PortfolioListView.swift
//  Blaze
//
//  Created by De MicheliStefano on 24.10.20.
//

import SDWebImageSwiftUI
import SwiftUI

struct PortfolioListView: View {
    
    @EnvironmentObject private var updateCoinFlow: UpdateCoinFlow
    var viewModel: PortfolioListViewModel
    @State private var coins: PortfolioListItemViewModel?
    
    init(viewModel: PortfolioListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.items, id: \.id) { coin in
                Button(action: {
                    self.coins = coin
                    self.updateCoinFlow.updateCoinSheet.isPresented = true
                }) {
                    PortfolioListItemView(viewModel: coin)
                }
            }
            .onDelete(perform: viewModel.delete)
        }
        .sheet(isPresented: $updateCoinFlow.updateCoinSheet.isPresented,
               onDismiss: viewModel.update) {
            AddCoinBuilder.coinUpdateAmountInputView(
                id: coins?.id ?? "",
                name: coins?.name ?? "",
                amount: coins?.numberOfUnits ?? ""
            )
        }
    }
}

// MARK: - Constants

private extension CGFloat { }
