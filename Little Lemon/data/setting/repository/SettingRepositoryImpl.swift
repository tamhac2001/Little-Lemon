//
//  SettingRepositoryImpl.swift
//  Little Lemon
//
//  Created by Tam Hac on 05/03/2024.
//

import Foundation

class SettingRepositoryImpl: SettingRepository {
    private let dataStore: SettingDatastore

    init(datastore: SettingDatastore) {
        self.dataStore = datastore
    }

    func getSetting() throws -> Setting {
        return try dataStore.fetch().toSetting()
    }

    func saveSetting(_ setting: Setting) throws {
        try dataStore.save(SettingEntity(setting: setting))
    }

    func deleteSetting() throws {
        try dataStore.delete()
    }
}
