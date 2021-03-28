//
//  Settings.swift
//  HappyCoin
//
//  Created by Stefano on 02.03.21.
//

struct Settings {
    var currencyId: String = "usd"
}

extension Settings: Codable {
    
    static var defaultSettings: Settings {
        .init(currencyId: "usd")
    }
}

extension Settings {
    
    var currencyName: String {
        switch currencyId {
        case "usd": return "US Dollar"
        case "btc": return "Bitcoin"
        case "cny": return "Chinese Yuan"
        case "inr": return "Indian Rupee"
        case "gbp": return "British Pounds"
        case "chf": return "Swiss Franc"
        case "eur": return "Euro"
        case "sgd": return "Singapore Dollars"
        case "thb": return "Thai Baht"
        default: return ""
        }
    }
    
    var currencyTicker: String {
        switch currencyId {
        case "usd": return "USD"
        case "btc": return "BTC"
        case "cny": return "CNY"
        case "inr": return "INR"
        case "gbp": return "GBP"
        case "chf": return "CHF"
        case "eur": return "EUR"
        case "sgd": return "SGD"
        case "thb": return "THB"
        default: return ""
        }
    }
    
    var currencySymbol: String {
        switch currencyId {
        case "usd": return "$"
        case "btc": return "₿"
        case "cny": return "¥"
        case "inr": return "₹"
        case "gbp": return "£"
        case "chf": return "CHF"
        case "eur": return "€"
        case "sgd": return "S$"
        case "thb": return "฿"
        default: return ""
        }
    }
    
    var currencyLocaleId: String {
        switch currencyId {
        case "usd": return "en_US"
        case "btc": return "en_US"
        case "cny": return "zh_Hans"
        case "inr": return "en_US"
        case "gbp": return "en_GB"
        case "chf": return "gsw_CH"
        case "eur": return "en_US"
        case "sgd": return "zh_Hans_SG"
        case "thb": return "th_TH"
        default: return "en_US"
        }
    }
}
