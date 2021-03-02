//
//  CoinButton.swift
//  HappyCoin
//
//  Created by Stefano on 07.02.21.
//

import SwiftUI

struct CoinButton: View {
        
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Text(title)
                .foregroundColor(.black)
                .font(.title2)
                .bold()
                .minimumScaleFactor(.scaleFactor)
                .lineLimit(1)
                .padding(.padding)
                .frame(maxWidth: .infinity, maxHeight: .height)
                .contentShape(Rectangle())
        })
        .frame(maxWidth: .infinity, maxHeight: .height)
        .background(Color.gray)
        .cornerRadius(.greatestFiniteMagnitude)
    }
}

// MARK: - Constants

private extension CGFloat {
    static let lineLimit: CGFloat = 1
    static let padding: CGFloat = 10
    static let height: CGFloat = 50
    static let scaleFactor: CGFloat = 0.5
}
