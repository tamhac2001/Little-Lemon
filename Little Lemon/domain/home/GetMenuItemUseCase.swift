//
//  GetMenuItemUseCase.swift
//  Little Lemon
//
//  Created by Tam Hac on 29/02/2024.
//

import Foundation
import SwiftData

final class GetMenuItemUseCase {
    private let menuItemRepository: MenuItemRepository

    init(menuItemRepository: MenuItemRepository) {
        self.menuItemRepository = menuItemRepository
    }

    func invoke() async -> Result<[DomainMenuItem], Error> {
        do {
            let menuItems = try await menuItemRepository.getDomainMenuItems()
            return .success(menuItems)
        } catch {
            return .failure(error)
        }
    }
}
