//
//  DeleteSettingUseCase.swift
//  Little Lemon
//
//  Created by Tam Hac on 07/03/2024.
//

import Foundation

class DeleteSettingUseCase {
    private let settingRepository: SettingRepository

    init(settingRepository: SettingRepository) {
        self.settingRepository = settingRepository
    }

    func invoke() -> Result<Void, Error> {
        do {
            try settingRepository.deleteSetting()
            return .success(())
        } catch {
            debugPrint(error)
            return .failure(error)
        }
    }
}
