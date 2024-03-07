//
//  MenuItemApi.swift
//  Little Lemon
//
//  Created by Tam Hac on 29/02/2024.
//

import Foundation

protocol MenuItemApi {
    var baseUrl: String {
        get
    }

    func getMenuItems() async throws -> [MenuItem]
}
