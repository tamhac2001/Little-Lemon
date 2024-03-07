//
//  EmailValidator.swift
//  Little Lemon
//
//  Created by Tam Hac on 27/02/2024.
//

import Foundation

enum EmailValidator {
    private static let emailRegex = /^[\w\-\.]+@([\w-]+\.)+[\w-]{2,}$/

    static func invoke(_ email: String) -> Bool {
        let match = try? emailRegex.wholeMatch(in: email)
        return match != nil
    }
}
