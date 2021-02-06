//
//  CoinListView.swift
//  HappyCoin
//
//  Created by Stefano on 06.02.21.
//

import SwiftUI

struct CoinListView: View {
    
    var viewModel: CoinListViewModel
    
    init(viewModel: CoinListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            List(viewModel.items, id: \.symbol) { coin in
                NavigationLink(destination: Text("sdf")) {
                    CoinRowView(image: coin.image, name: coin.name)
                }
            }
            .padding(.horizontal, .padding)
            .navigationBarTitle("Select a coin")
        }
    }
}

struct CoinRowView: View {
    
    let image: String
    let name: String
    
    var body: some View {
        HStack(spacing: .spacing) {
            Image(systemName: image)
                .resizable()
                .frame(width: .imageSize, height: .imageSize)
                .foregroundColor(.orange)
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

// MARK: - Previews

#if DEBUG
struct CoinListView_Previews: PreviewProvider {
    static var previews: some View {
        let service = CoinService()
        let listViewModel = CoinListViewModel(service: service)
        CoinListView(viewModel: listViewModel)
    }
}
#endif
