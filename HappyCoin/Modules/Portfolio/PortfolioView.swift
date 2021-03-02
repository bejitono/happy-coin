//
//  PortfolioView.swift
//  Blaze
//
//  Created by De MicheliStefano on 25.10.20.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject private var addCoinFlow: AddCoinFlow
    @EnvironmentObject private var settingsFlow: SettingsFlow
    @ObservedObject private var viewModel: PortfolioViewModel
    
    init(viewModel: PortfolioViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: .topSpacing) {
                HStack {
                    Spacer()
                    Button(action: {
                        self.settingsFlow.settingsSheet.isPresented = true
                    }) {
                        Image(systemName: "ellipsis.circle")
                            .resizable()
                            .frame(width: .settingsButtonSize, height: .settingsButtonSize)
                            .foregroundColor(.gray)
                    }
                    .sheet(isPresented: $settingsFlow.settingsSheet.isPresented,
                           onDismiss: viewModel.getPortfolio) {
                        SettingsBuilder.settingsView()
                    }
                }
                VStack(alignment: .center, spacing: .spacing) {
                    PortfolioBalanceView(viewModel: viewModel.balanceViewModel)
                    PortfolioListView(viewModel: viewModel.listViewModel).environmentObject(UpdateCoinFlow())
                }
            }
            .padding(.horizontal)
            .padding(.top, .topPadding)
            VStack {
                Spacer()
                Button(action: {
                    self.addCoinFlow.addCoinSheet.isPresented = true
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
                .sheet(isPresented: $addCoinFlow.addCoinSheet.isPresented,
                       onDismiss: viewModel.getPortfolio) {
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
    static let spacing: CGFloat = 55
    static let addButtonSize: CGFloat = 60
    static let settingsButtonSize: CGFloat = 25
    static let buttonLine: CGFloat = 4
    static let topPadding: CGFloat = 20
    static let topSpacing: CGFloat = 15
}

// MARK: - Previews

#if DEBUG
struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        let listViewModel = PortfolioListViewModel()
        let service = PortfolioService(cache: UserCache(), networkClient: NetworkClientImpl())
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
