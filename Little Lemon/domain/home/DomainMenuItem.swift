//
//  DomainMenuItem.swift
//  Little Lemon
//
//  Created by Tam Hac on 26/02/2024.
//

import Foundation
import SwiftData

struct DomainMenuItem: Identifiable {
    let id: Int
    let title: String
    let description: String
    let price: Decimal
    let image: String
    let category: MenuCategory
}
