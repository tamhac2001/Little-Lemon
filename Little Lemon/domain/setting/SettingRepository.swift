//
//  SettingRepository.swift
//  Little Lemon
//
//  Created by Tam Hac on 05/03/2024.
//

import Foundation

protocol SettingRepository {
    func getSetting() throws -> Setting

    func saveSetting(_ setting: Setting) throws
    
    func deleteSetting() throws
}
