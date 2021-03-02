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
        .init(id: "usd", name: "US Dollars", selected: true)
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
