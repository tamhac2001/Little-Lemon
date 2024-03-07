//
//  SettingDataStore.swift
//  Little Lemon
//
//  Created by Tam Hac on 05/03/2024.
//

import Foundation
import SwiftData

class SettingDatastore {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetch() throws -> SettingEntity {
        return try context.fetch(FetchDescriptor<SettingEntity>()).first ?? SettingEntity(emailNotifications: [])
    }

    func save(_ setting: SettingEntity) throws {
        try context.delete(model: SettingEntity.self)
        context.insert(setting)
        try context.save()
    }
    
    func delete() throws{
        try context.delete(model: SettingEntity.self)
        try context.save()
    }
}
