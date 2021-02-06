//
//  HappyCoinApp.swift
//  HappyCoin
//
//  Created by Stefano on 06.02.21.
//

import SwiftUI

@main
struct HappyCoinApp: App {
    var body: some Scene {
        WindowGroup {
            PortfolioBuilder.makeMainView()
        }
    }
}
