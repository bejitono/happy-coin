//
//  PortfolioListItemView.swift
//  HappyCoin
//
//  Created by Stefano on 01.03.21.
//

import SDWebImageSwiftUI
import SwiftUI

struct PortfolioListItemView: View {
    
    private let viewModel: PortfolioListItemViewModel
    
    init(viewModel: PortfolioListItemViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        HStack {
            WebImage(url: URL(string: viewModel.image))
                .resizable()
                .frame(width: .imageSize, height: .imageSize)
                .foregroundColor(.orange)
            VStack(alignment: .leading, spacing: .labelSpacing) {
                Text(viewModel.name)
                    .font(
                        .system(
                            size: .titleFontSize,
                            weight: .bold,
                            design: .default
                        )
                    )
                Text("\(viewModel.numberOfUnits) | \(viewModel.currentPrice)")
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
                Text(viewModel.totalValue)
                    .font(
                        .system(
                            size: .titleFontSize,
                            weight: .bold,
                            design: .default
                        )
                    )
                HStack(spacing: .subtitleSpacing) {
                    Text(viewModel.valueIncrease)
                        .font(
                            .system(
                                size: .subtitleFontSize,
                                weight: .light,
                                design: .default
                            )
                        )
                        .foregroundColor((Double(viewModel.valueIncrease.dropLast()) ?? 0).sign == .minus
                                            ? .red
                                            : .green
                        )
                }
            }
        }
        .padding(.vertical, .verticalPadding)
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
