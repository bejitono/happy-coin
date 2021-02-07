//
//  AmountView.swift
//  HappyCoin
//
//  Created by Stefano on 07.02.21.
//

import SwiftUI

struct AmountView: View {
    
    let amount: String
    
    var body: some View {
        VStack {
            Text(amount)
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
                .minimumScaleFactor(.minTextScaleFactor)
        }
    }
}

// MARK: - Constants

private extension CGFloat {
    static let titleFontSize: CGFloat = 100
    static let minTextScaleFactor: CGFloat = 0.3
}

private extension Int {
    static let lineLimit: Int = 1
}
