//
//  Little_LemonApp.swift
//  Little Lemon
//
//  Created by Tam Hac on 26/02/2024.
//

import SwiftData
import SwiftUI

@main
struct Little_LemonApp: App {
    init() {
        SwiftInjectModule.shared.injectModules(modelContext: sharedModelContainer.mainContext)
    }

    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            UserEntity.self,
            SettingEntity.self,
            MenuItemEntity.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
