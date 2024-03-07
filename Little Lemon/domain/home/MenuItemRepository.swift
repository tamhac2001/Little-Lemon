//
//  MenuItemRepository.swift
//  Little Lemon
//
//  Created by Tam Hac on 29/02/2024.
//

import Foundation
import SwiftData

protocol MenuItemRepository {
    func getDomainMenuItems() async throws -> [DomainMenuItem]
}
