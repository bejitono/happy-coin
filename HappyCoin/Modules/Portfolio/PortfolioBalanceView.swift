//
//  PortfolioBalanceView.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

import SwiftUI

struct PortfolioBalanceView: View {
    
    let viewModel: PortfolioBalanceViewModel
    
    init(viewModel: PortfolioBalanceViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: .spacing) {
            Text("Total")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.black)
                .lineLimit(.lineLimit)
            Text(viewModel.balance)
                .font(
                    .system(
                        size: .titleFontSize,
                        weight: .bold,
                        design: .default
                    )
                )
                .fontWeight(.bold)
                .foregroundColor(.black)
                .lineLimit(.lineLimit)
            Text(viewModel.valueIncrease)
                .font(.subheadline)
                .foregroundColor(.green)
        }
        .frame(
            maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/,
            maxHeight: .some(.height),
            alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
        )
        .background(Color.white)
        .cornerRadius(.cornerRadius)
        .padding(.padding)
        .shadow(
            color: .gray,
            radius: .cornerRadius,
            x: .shadowXOffset,
            y: .shadowYOffset
        )
    }
}

// MARK: - Constants

private extension CGFloat {
    static let cornerRadius: CGFloat = 20
    static let shadowYOffset: CGFloat = 15
    static let shadowXOffset: CGFloat = 0
    static let width: CGFloat = 320
    static let height: CGFloat = 250
    static let spacing: CGFloat = 20
    static let padding: CGFloat = 15
    static let titleFontSize: CGFloat = 50
}

private extension Int {
    static let lineLimit: Int = 1
}
