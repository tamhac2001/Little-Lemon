//
//  MenuItemEntity.swift
//  Little Lemon
//
//  Created by Tam Hac on 29/02/2024.
//

import Foundation
import SwiftData

@Model
class MenuItemEntity {
    let id: Int
    let title: String
    let descriptionString: String
    let price: Decimal
    let image: String
    let category: MenuCategory

    init(id: Int, title: String, descriptionString: String, price: Decimal, image: String, category: MenuCategory) {
        self.id = id
        self.title = title
        self.descriptionString = descriptionString
        self.price = price
        self.image = image
        self.category = category
    }

    init(domainMenuItem: DomainMenuItem) {
        self.id = domainMenuItem.id
        self.title = domainMenuItem.title
        self.descriptionString = domainMenuItem.description
        self.price = domainMenuItem.price
        self.image = domainMenuItem.image
        self.category = domainMenuItem.category
    }

    func toDomainMenuItem() -> DomainMenuItem {
        return DomainMenuItem(id: self.id, title: self.title, description: self.descriptionString, price: self.price, image: self.image, category: self.category)
    }
}
