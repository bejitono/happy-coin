//
//  CoinUpdateAmountInputView.swift
//  HappyCoin
//
//  Created by Stefano on 01.03.21.
//

import SwiftUI

struct CoinUpdateAmountInputView: View {
    
    @EnvironmentObject private var navigation: UpdateCoinFlow
    @ObservedObject private var viewModel: CoinAmountInputViewModel
    
    init(viewModel: CoinAmountInputViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack(spacing: .spacing) {
            AmountTitleView(title: viewModel.coinTitle)
            AmountView(amount: viewModel.amount)
                .frame(
                    height: .amountViewHeight,
                    alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/
                )
            KeyboardView(
                digitHandler: { digit in
                    viewModel.update(digit: digit)
                },
                decimalHandler: viewModel.addDecimal,
                deleteHandler: viewModel.deleteDigit
            )
            CoinButton(
                title: viewModel.inputPriceTitle,
                action: {
                    viewModel.saveAmount()
                    navigation.updateCoinSheet.isPresented = false
                }
            )
        }
        .padding(.padding)
    }
}

// MARK: - Constants

private extension CGFloat {
    static let padding: CGFloat = 30
    static let spacing: CGFloat = 30
    static let amountViewHeight: CGFloat = 100
}
