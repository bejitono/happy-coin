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
        List(viewModel.items, id: \.id) { item in
            HStack {
                WebImage(url: URL(string: item.image))
                    .resizable()
                    .frame(width: .imageSize, height: .imageSize)
                    .foregroundColor(.orange)
                VStack(alignment: .leading, spacing: .labelSpacing) {
                    Text(item.name)
                        .font(
                            .system(
                                size: .titleFontSize,
                                weight: .bold,
                                design: .default
                            )
                        )
                    Text("\(item.numberOfUnits) | \(item.currentPrice)")
                        .font(
                            .system(
                                size: .subtitleFontSize,
                                weight: .light,
                                design: .default
                            )
                        )
                }
                .padding()
                Spacer()
                VStack(alignment: .trailing, spacing: .labelSpacing) {
                    Text(item.totalValue)
                        .font(
                            .system(
                                size: .titleFontSize,
                                weight: .bold,
                                design: .default
                            )
                        )
                    HStack(spacing: .subtitleSpacing) {
                        Text(item.valueIncrease)
                            .font(
                                .system(
                                    size: .subtitleFontSize,
                                    weight: .light,
                                    design: .default
                                )
                            )
                            .foregroundColor((Double(item.valueIncrease) ?? 0).sign == .minus
                                                ? .green
                                                : .red
                            )
                    }
                }
            }
            .padding(.vertical, .verticalPadding)
        }
    }
}

// MARK: - Constants

private extension CGFloat {
    static let titleFontSize: CGFloat = 18
    static let subtitleFontSize: CGFloat = 13
    static let imageSize: CGFloat = 38
    static let subtitleSpacing: CGFloat = 8
    static let labelSpacing: CGFloat = 6
    static let verticalPadding: CGFloat = 7
}
