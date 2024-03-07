//
//  ContentView.swift
//  Little Lemon
//
//  Created by Tam Hac on 26/02/2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var users: [UserEntity]

    var body: some View {
        if users.isEmpty {
            OnboardingScreen()
        } else {
            HomeScreen()
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [UserEntity.self, SettingEntity.self, MenuItemEntity.self], inMemory: true) { result in
            switch result {
            case .success(let success):
                SwiftInjectModule.shared.injectModules(modelContext: success.mainContext)
            case .failure(let failure):
                return
            }
        }
}
