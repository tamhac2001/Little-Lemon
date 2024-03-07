//
//  Dish.swift
//  Little Lemon
//
//  Created by Tam Hac on 29/02/2024.
//

import Foundation

struct MenuItem: Identifiable, Codable {
    let id: Int
    let title: String
    let description: String
    let price: String
    let image: String
    let category: String

    init(id: Int, title: String, description: String, price: String, image: String, category: String) {
        self.id = id
        self.title = title
        self.description = description
        self.price = price
        self.image = image
        self.category = category
    }

    func toDomainMenuItem() -> DomainMenuItem {
        return DomainMenuItem(id: Int(self.id), title: self.title, description: self.description, price: Decimal(string: self.price) ?? Decimal.zero, image: self.image, category: MenuCategory(rawValue: self.category) ?? MenuCategory.starters)
    }
}
