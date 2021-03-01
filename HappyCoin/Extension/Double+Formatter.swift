//
//  Double+Formatter.swift
//  HappyCoin
//
//  Created by Stefano on 28.02.21.
//

import Foundation

extension Double {
    
    func toCurrencyString() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "en_US") //.current
        formatter.numberStyle = .currency
        formatter.minimumFractionDigits = isWholeNumber ? 0 : 2
        return formatter.string(from: self as NSNumber) ?? ""
    }
    
    func toPercentageString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumIntegerDigits = 1
        formatter.maximumIntegerDigits = 1
        formatter.maximumFractionDigits = 3
        return formatter.string(from: self as NSNumber) ?? ""
    }
    
    private var isWholeNumber: Bool { isZero ? true : !isNormal ? false : self == rounded() }
}
