//
//  AmountTitleView.swift
//  HappyCoin
//
//  Created by Stefano on 07.02.21.
//

import SwiftUI

struct AmountTitleView: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.gray)
            .lineLimit(.lineLimit)
    }
}

// MARK: - Constants

private extension CGFloat {
    static let titleFontSize: CGFloat = 100
}

private extension Int {
    static let lineLimit: Int = 1
}
