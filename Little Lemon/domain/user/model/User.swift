//
//  User.swift
//  Little Lemon
//
//  Created by Tam Hac on 06/03/2024.
//

import Foundation

struct User: Equatable {
    var avatar: Data?
    var firstName: String
    var lastName: String
    var email: String
    var phoneNumber: String

    init(avatar: Data? = nil, firstName: String = "", lastName: String = "", email: String = "", phoneNumber: String = "") {
        self.avatar = avatar
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
    }
}
