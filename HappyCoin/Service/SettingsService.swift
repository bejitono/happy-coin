//
//  SettingsService.swift
//  HappyCoin
//
//  Created by Stefano on 01.03.21.
//

import Combine
import Foundation

protocol SettingsServiceable {
    func getSettings() -> Settings
    func save(currencyId: String)
}

final class SettingsService {
    
    private let cache: UserCacheable
    
    init(cache: UserCacheable) {
        self.cache = cache
    }
}

extension SettingsService: SettingsServiceable {
    
    func getSettings() -> Settings {
        guard let user: User = cache.get() else { return .defaultSettings }
        return user.settings
    }
    
    func save(currencyId: String) {
        guard var user: User = cache.get() else {
            cache.set(User(coins: [], settings: Settings(currencyId: currencyId)))
            return
        }
        user.settings.currencyId = currencyId
        cache.set(user)
    }
}
