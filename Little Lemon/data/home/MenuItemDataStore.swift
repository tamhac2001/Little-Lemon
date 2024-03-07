//
//  MenuItemDataStore.swift
//  Little Lemon
//
//  Created by Tam Hac on 29/02/2024.
//

import Foundation
import SwiftData

class MenuItemDataStore {
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }

    func fetch() throws -> [MenuItemEntity] {
        let menuItems = try modelContext.fetch(FetchDescriptor<MenuItemEntity>())
        return menuItems
    }

    func save(_ menuItems: [MenuItemEntity]) throws {
        for menuItem in menuItems {
            modelContext.insert(menuItem)
        }
        try modelContext.save()
    }
}
