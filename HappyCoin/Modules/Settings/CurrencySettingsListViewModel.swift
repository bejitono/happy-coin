//
//  CurrencySettingsListViewModel.swift
//  HappyCoin
//
//  Created by Stefano on 01.03.21.
//

import Combine

final class CurrencySettingsListViewModel: ObservableObject {
    
    let title: String = "Currencies"
    @Published var items: [CurrencySettingsListItemViewModel] = [
        .init(id: "btc", name: "Bitcoin", selected: false),
        .init(id: "usd", name: "US Dollars", selected: true),
        .init(id: "cny", name: "Chinese Yuan", selected: false),
        .init(id: "inr", name: "Indian Rupee", selected: false),
        .init(id: "gbp", name: "British Pounds", selected: false),
        .init(id: "chf", name: "Swiss Franc", selected: false),
        .init(id: "eur", name: "Euro", selected: false),
        .init(id: "sgd", name: "Singapore Dollars", selected: false),
        .init(id: "thb", name: "Thai Baht", selected: false)
    ]
    
    private let service: SettingsServiceable
    
    init(service: SettingsServiceable) {
        self.service = service
        
        let settings = service.getSettings()
        items = items.map { .init(id: $0.id, name: $0.name, selected: settings.currencyId == $0.id) }
    }
    
    func save(currencyId: String) {
        items = items.map { .init(id: $0.id, name: $0.name, selected: currencyId == $0.id) }
        service.save(currencyId: currencyId)
    }
}
