//
//  Navigation.swift
//  HappyCoin
//
//  Created by Stefano on 11.02.21.
//

import Combine

final class AddCoinFlow: ObservableObject {
    @Published var addCoinSheet: Sheet = Sheet()
    
    private var disposable: AnyCancellable? = nil
    
    init() {
        disposable = addCoinSheet.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}

final class UpdateCoinFlow: ObservableObject {
    @Published var updateCoinSheet: Sheet = Sheet()
    
    private var disposable: AnyCancellable? = nil
    
    init() {
        disposable = updateCoinSheet.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}

final class SettingsFlow: ObservableObject {
    @Published var settingsSheet: Sheet = Sheet()
    
    private var disposable: AnyCancellable? = nil
    
    init() {
        disposable = settingsSheet.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}


final class Sheet: ObservableObject {
    @Published var isPresented: Bool = false
}
