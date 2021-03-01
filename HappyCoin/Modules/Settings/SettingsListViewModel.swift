//
//  SettingsListViewModel.swift
//  HappyCoin
//
//  Created by Stefano on 01.03.21.
//

import Combine

final class SettingsListViewModel: ObservableObject {
    
    let title: String = "Settings"
    let items: [SettingsListItemViewModel] = [
        .init(name: "Currency")
    ]
}
