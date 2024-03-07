//
//  HomeScreenUiState.swift
//  Little Lemon
//
//  Created by Tam Hac on 26/02/2024.
//

import Foundation

struct HomeScreenUiState {
    var searchQuery: String
    var selectedMenuCategory: [MenuCategory]
    var menuItems: [DomainMenuItem]
    var avatar: Data?

    init(searchQuery: String, selectedMenuCategory: [MenuCategory], allMenuItems: [DomainMenuItem], avatar: Data? = nil) {
        self.searchQuery = searchQuery
        self.selectedMenuCategory = selectedMenuCategory
        self.menuItems = allMenuItems
        self.avatar = avatar
    }
}
