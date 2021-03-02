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
        default: return ""
        }
    }
    
    var currencyTicker: String {
        switch currencyId {
        case "usd": return "USD"
        case "btc": return "BTC"
        default: return ""
        }
    }
    
    var currencySymbol: String {
        switch currencyId {
        case "usd": return "$"
        case "btc": return "₿"
        default: return ""
        }
    }
    
    var currencyLocaleId: String {
        switch currencyId {
        case "usd": return "en_US"
        case "btc": return "en_US"
        default: return ""
        }
    }
}
