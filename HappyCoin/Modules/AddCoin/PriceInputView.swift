//
//  PriceInputView.swift
//  HappyCoin
//
//  Created by Stefano on 07.02.21.
//

import SwiftUI

struct PriceInputView: View {
    
    @EnvironmentObject private var navigation: AddCoinFlow
    @ObservedObject private var viewModel: PriceInputViewModel
    
    init(viewModel: PriceInputViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: .spacing) {
            AmountTitleView(title: viewModel.coinTitle)
            AmountView(
                amount: viewModel.amount
            )
                .frame(
                    height: .amountViewHeight,
                    alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
                )
            KeyboardView(
                digitHandler: viewModel.update(digit:),
                decimalHandler: viewModel.addDecimal,
                deleteHandler: viewModel.deleteDigit
            )
            VStack(spacing: .spacing) {
                CoinButton(
                    title: viewModel.inputPriceTitle,
                    action: {
                        viewModel.savePrice()
                        navigation.addCoinSheet.isPresented = false
                    }
                )
                Button(action: viewModel.setCurrentPrice, label: {
                    Text(viewModel.setCurrentPriceTitle)
                        .foregroundColor(.gray)
                })
            }
        }
        .padding(.padding)
    }
}

// MARK: - Constants

private extension CGFloat {
    static let padding: CGFloat = 30
    static let spacing: CGFloat = 20
    static let buttonSpacing: CGFloat = 15
    static let amountViewHeight: CGFloat = 100
}

// MARK: - Preview

#if DEBUG
struct PriceInputView_Previews: PreviewProvider {
    static var previews: some View {
        PriceInputView(
            viewModel: PriceInputViewModel(
                service: CoinService(cache: UserCache(), networkClient: NetworkClientImpl())
            )
        )
    }
}
#endif
