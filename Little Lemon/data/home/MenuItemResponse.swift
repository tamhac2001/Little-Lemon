//
//  GetDishResponse.swift
//  Little Lemon
//
//  Created by Tam Hac on 29/02/2024.
//

import Foundation

struct MenuItemResponse {
    let menu: [MenuItem]
}

extension MenuItemResponse: Codable {}
