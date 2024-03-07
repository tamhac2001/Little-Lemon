//
//  MenuItemApiImpl.swift
//  Little Lemon
//
//  Created by Tam Hac on 29/02/2024.
//

import Alamofire
import Foundation

class MenuItemApiImpl: MenuItemApi {
    var baseUrl: String = "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json"

    func getMenuItems() async throws -> [MenuItem] {
        let response = await AF.request(baseUrl, interceptor: .retryPolicy)
            // Caching customization.
            .cacheResponse(using: .cache)
            // Redirect customization.
            .redirect(using: .follow)
            // Validate response code and Content-Type.
            .validate()
            // Automatic Decodable support with background parsing.
            .serializingDecodable(MenuItemResponse.self)
            // Await the full response with metrics and a parsed body.
            .response

        return try response.result.get().menu
    }
}
