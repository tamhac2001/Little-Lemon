//
//  OnboardingUiState.swift
//  Little Lemon
//
//  Created by Tam Hac on 26/02/2024.
//

import Foundation

struct OnboardingUiState {
    var firstName: String
    var lastName: String
    var email: String
    var isFormValid: Bool {
        return !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty
    }

    init(firstName: String, lastName: String, email: String) {
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
    }
}
