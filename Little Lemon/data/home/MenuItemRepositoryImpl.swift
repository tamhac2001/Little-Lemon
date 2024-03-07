//
//  MenuItemRepositoryImpl.swift
//  Little Lemon
//
//  Created by Tam Hac on 29/02/2024.
//

import Foundation
import SwiftData

class MenuItemRepositoryImpl: MenuItemRepository {
    let menuItemDataStore: MenuItemDataStore
    let menuItemApi: MenuItemApi

    init(menuItemDataStore: MenuItemDataStore, menuItemApi: MenuItemApi) {
        self.menuItemDataStore = menuItemDataStore
        self.menuItemApi = menuItemApi
    }

    func getDomainMenuItems() async throws -> [DomainMenuItem] {
        let menuItemEntities = try menuItemDataStore.fetch()
        if menuItemEntities.isEmpty {
            let menuItems = try await menuItemApi.getMenuItems()
            let domainMenuItems = menuItems.map { $0.toDomainMenuItem() }
            let menuItemEntities = domainMenuItems.map { MenuItemEntity(domainMenuItem: $0) }
            try menuItemDataStore.save(menuItemEntities)
            return domainMenuItems
        }
        return menuItemEntities.map { $0.toDomainMenuItem() }
    }
}
