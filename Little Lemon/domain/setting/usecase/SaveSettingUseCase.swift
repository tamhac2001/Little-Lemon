//
//  SaveSettingUseCase.swift
//  Little Lemon
//
//  Created by Tam Hac on 06/03/2024.
//

import Foundation

final class SaveSettingUseCase {
    private let settingRepository: SettingRepository

    init(settingRepositor: SettingRepository) {
        self.settingRepository = settingRepositor
    }

    func invoke(_ setting: Setting) -> Result<Void, Error> {
        do {
            try settingRepository.saveSetting(setting)
            return .success(())
        } catch {
            return .failure(error)
        }
    }
}
