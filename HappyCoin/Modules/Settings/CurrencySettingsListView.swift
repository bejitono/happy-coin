//
//  CurrencySettingsListView.swift
//  HappyCoin
//
//  Created by Stefano on 01.03.21.
//

import SwiftUI

struct CurrencySettingsListView: View {
    
    @ObservedObject private var viewModel: CurrencySettingsListViewModel
        
    init(viewModel: CurrencySettingsListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        List(viewModel.items, id: \.name) { currency in
            CurrencySettingsRowView(name: currency.name, selected: currency.selected)
                .contentShape(Rectangle())
                .onTapGesture {
                    viewModel.save(currencyId: currency.id)
                }
        }
        .padding(.horizontal, .padding)
        .navigationBarTitle(viewModel.title)
    }
}

struct CurrencySettingsRowView: View {
    
    let name: String
    let selected: Bool
    
    var body: some View {
        HStack(spacing: .spacing) {
            Text(name)
                .font(
                    .system(
                        size: .titleFontSize,
                        weight: .bold,
                        design: .default
                    )
                )
            Spacer()
            Image(systemName: selected ? "checkmark" : "")
        }
        .padding(.vertical, .itemPadding)
    }
}

// MARK: - Constants

private extension CGFloat {
    static let titleFontSize: CGFloat = 18
    static let imageSize: CGFloat = 38
    static let spacing: CGFloat = 30
    static let itemPadding: CGFloat = 7
    static let padding: CGFloat = 7
}
