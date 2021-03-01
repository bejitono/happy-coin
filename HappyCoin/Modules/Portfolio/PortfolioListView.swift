//
//  PortfolioListView.swift
//  Blaze
//
//  Created by De MicheliStefano on 24.10.20.
//

import SDWebImageSwiftUI
import SwiftUI

struct PortfolioListView: View {
    
    var viewModel: PortfolioListViewModel
    
    init(viewModel: PortfolioListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List {
            ForEach(viewModel.items, id: \.id) { item in
                PortfolioListItemView(viewModel: item)
            }
            .onDelete(perform: viewModel.delete)
        }
    }
}

// MARK: - Constants

private extension CGFloat { }
