//
//  HomeViewModel.swift
//  Little Lemon
//
//  Created by Tam Hac on 26/02/2024.
//

import Foundation
import SwiftData

@Observable
class HomeViewModel {
    private let getUserUseCase: GetUserUseCase
    private let getMenuItemUseCase: GetMenuItemUseCase

    init(getUserUseCase: GetUserUseCase, getMenuItemUseCase: GetMenuItemUseCase, uiState: HomeScreenUiState = HomeScreenUiState(searchQuery: "", selectedMenuCategory: MenuCategory.allCases, allMenuItems: [])) {
        self.getUserUseCase = getUserUseCase
        self.getMenuItemUseCase = getMenuItemUseCase
        self.uiState = uiState
    }

    var uiState = HomeScreenUiState(searchQuery: "", selectedMenuCategory: MenuCategory.allCases, allMenuItems: [])

    func updateUi() {
        updateAvatar()
        updateMenuItems()
    }

    private func updateAvatar() {
        let userResult = getUserUseCase.invoke()
        switch userResult {
        case .success(let user):
            uiState.avatar = user.avatar
        case .failure(let failure):
            debugPrint(failure)
        }
    }

    private func updateMenuItems() {
        Task {
            let menuItemsResult = await getMenuItemUseCase.invoke()
            switch menuItemsResult {
            case .success(let domainMenuItems):
                uiState.menuItems = domainMenuItems

            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}
