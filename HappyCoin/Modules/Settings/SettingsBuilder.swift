//
//  SettingsBuilder.swift
//  HappyCoin
//
//  Created by Stefano on 01.03.21.
//

import SwiftUI

struct SettingsBuilder {
    
    static func currencySettingsView() -> some View {
        let viewModel = SettingsListViewModel()
        return SettingsListView(viewModel: viewModel)
    }
}
