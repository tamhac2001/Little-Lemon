//
//  UserEntity.swift
//  Little Lemon
//
//  Created by Tam Hac on 27/02/2024.
//

import Foundation
import SwiftData

@Model
final class UserEntity {
    @Attribute(.externalStorage) var avatar: Data?
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String

    init(avatar: Data?, firstName: String, lastName: String, email: String, phoneNumber: String) {
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
    }

    init(from user: User) {
        self.avatar = user.avatar
        self.firstName = user.firstName
        self.lastName = user.lastName
        self.email = user.email
        self.phoneNumber = user.phoneNumber
    }

    func toUser() -> User {
        return User(avatar: self.avatar, firstName: self.firstName, lastName: self.lastName, email: self.email, phoneNumber: self.phoneNumber)
    }
}
