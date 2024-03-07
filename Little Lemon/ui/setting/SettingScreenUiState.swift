//
//  SettingScreenUiState.swift
//  Little Lemon
//
//  Created by Tam Hac on 04/03/2024.
//

import Foundation
import PhotosUI
import SwiftUI

struct SettingScreenUiState: Equatable {
    var user: User
    var setting: Setting

    init(user: User = User(avatar: nil, firstName: "", lastName: "", email: "", phoneNumber: ""), setting: Setting = Setting()) {
        self.user = user
        self.setting = setting
    }
}
