//
//  Navigation.swift
//  HappyCoin
//
//  Created by Stefano on 11.02.21.
//

import Combine

final class AppNavigation: ObservableObject {
    @Published var addCoinSheet: Sheet = Sheet()
    
    private var disposable: AnyCancellable? = nil
    
    init() {
        disposable = addCoinSheet.objectWillChange.sink { [weak self] _ in
            self?.objectWillChange.send()
        }
    }
}

final class Sheet: ObservableObject {
    @Published var isPresented: Bool = false
}
