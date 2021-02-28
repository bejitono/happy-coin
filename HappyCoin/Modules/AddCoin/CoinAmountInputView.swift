//
//  CoinAmountInputView.swift
//  HappyCoin
//
//  Created by Stefano on 07.02.21.
//

import SwiftUI

struct CoinAmountInputView: View {
    
    @EnvironmentObject private var navigation: AppNavigation
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
                    navigation.addCoinSheet.isPresented = false
                }
            )
//            NavigationLink(
//                destination: AddCoinBuilder.priceInputView(symbol: viewModel.symbol),
//                tag: NavigationState.navigate,
//                selection: $viewModel.navigationState,
//                label: {
//                    CoinButton(
//                        title: viewModel.inputPriceTitle,
//                        action: viewModel.inputPrice
//                    )
//                }
//            )
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

// MARK: - Preview

#if DEBUG
struct CoinAmountInputView_Previews: PreviewProvider {
    static var previews: some View {
        CoinAmountInputView(
            viewModel: CoinAmountInputViewModel(
                coin: CoinResponse(id: "1", name: "bitcoin", symbol: "btc"),
                service: CoinService(cache: UserCache(), networkClient: NetworkClientImpl())
            )
        )
    }
}
#endif
