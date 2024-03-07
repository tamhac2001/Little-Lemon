//
//  GetSettingUseCase.swift
//  Little Lemon
//
//  Created by Tam Hac on 05/03/2024.
//

import Foundation

final class GetSettingUseCase {
    private let settingRepository: SettingRepository

    init(settingRepository: SettingRepository) {
        self.settingRepository = settingRepository
    }

    func invoke() -> Result<Setting, Error> {
        do {
            let setting = try settingRepository.getSetting()
            return .success(setting)
        } catch {
            print(error)
            return .failure(error)
        }
    }
}
