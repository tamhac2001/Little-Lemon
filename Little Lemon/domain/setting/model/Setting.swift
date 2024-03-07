//
//  Setting.swift
//  Little Lemon
//
//  Created by Tam Hac on 05/03/2024.
//

import Foundation

typealias DomainSetting = Setting

struct Setting: Equatable {
    var emailNotifications: Set<EmailNotification> = []
}
