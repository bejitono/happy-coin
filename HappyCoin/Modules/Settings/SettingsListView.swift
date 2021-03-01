//
//  SettingsListView.swift
//  HappyCoin
//
//  Created by Stefano on 01.03.21.
//

import SwiftUI

struct SettingsListView: View {
    
    @ObservedObject private var viewModel: SettingsListViewModel
        
    init(viewModel: SettingsListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.items, id: \.name) { coin in
                NavigationLink(
                    destination: Text("Hi")
                ) {
                    CoinRowView(name: coin.name)
                }
            }
            .padding(.horizontal, .padding)
            .navigationBarTitle(viewModel.title)
        }
    }
}

struct SettingsRowView: View {
    
    let name: String
    
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
