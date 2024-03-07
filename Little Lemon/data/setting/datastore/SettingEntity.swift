//
//  SettingEntity.swift
//  Little Lemon
//
//  Created by Tam Hac on 05/03/2024.
//

import Foundation
import SwiftData

@Model
class SettingEntity {
    var emailNotifications: Set<EmailNotification>

    init(emailNotifications: Set<EmailNotification>) {
        self.emailNotifications = emailNotifications
    }

    init(setting: Setting) {
        self.emailNotifications = setting.emailNotifications
    }
}

extension SettingEntity {
    func toSetting() -> Setting {
        return Setting(emailNotifications: self.emailNotifications)
    }
}
