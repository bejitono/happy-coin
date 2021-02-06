//
//  PortfolioView.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

import SwiftUI

struct PortfolioView: View {
    
    @ObservedObject private var viewModel: PortfolioViewModel
    @State private var presentingModal = false
    
    init(viewModel: PortfolioViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: .spacing) {
                PortfolioBalanceView(viewModel: viewModel.balanceViewModel)
                PortfolioListView(viewModel: viewModel.listViewModel)
            }
            VStack {
                Spacer()
                Button(action: {
                    self.presentingModal = true
                }) {
                    Image(systemName: "plus.circle.fill")
                        .resizable()
                        .frame(width: .addButtonSize, height: .addButtonSize)
                        .foregroundColor(.primary)
                        .background(Color.white)
                        .clipShape(Circle())
                        .overlay(
                            RoundedRectangle(cornerRadius: .addButtonSize / 2)
                                .stroke(Color.white, lineWidth: .buttonLine)
                        )
                        .shadow(
                            color: .gray,
                            radius: .cornerRadius,
                            x: .shadowXOffset,
                            y: .shadowYOffset
                        )
                }
                .sheet(isPresented: $presentingModal) {
                    AddCoinBuilder.coinListView()
                }
            }
        }
    }
}

// MARK: - Constants

private extension CGFloat {
    static let cornerRadius: CGFloat = addButtonSize / 2
    static let shadowYOffset: CGFloat = 10
    static let shadowXOffset: CGFloat = 0
    static let spacing: CGFloat = 45
    static let addButtonSize: CGFloat = 60
    static let buttonLine: CGFloat = 4
}

// MARK: - Previews

#if DEBUG
struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        let listViewModel = PortfolioListViewModel()
        let service = PortfolioService()
        PortfolioView(
            viewModel: PortfolioViewModel(
                balanceViewModel: .empty,
                listViewModel: listViewModel,
                portfolioService: service
            )
        )
    }
}
#endif
