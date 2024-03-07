//
//  OnboardingViewModel.swift
//  Little Lemon
//
//  Created by Tam Hac on 27/02/2024.
//

import Foundation
import SwiftData
import SwiftUI

@Observable
class OnboardingViewModel {
    private let saveUserUseCase: SaveUserUseCase

    init(saveUserUseCase: SaveUserUseCase, uiState: OnboardingUiState = OnboardingUiState(firstName: "", lastName: "", email: "")) {
        self.saveUserUseCase = saveUserUseCase
        self.uiState = uiState
    }

    var uiState: OnboardingUiState

    func register() {
        let user = User(avatar: nil, firstName: uiState.firstName, lastName: uiState.lastName, email: uiState.email, phoneNumber: "")
        let saveUserResult = saveUserUseCase.invoke(user)
        switch saveUserResult {
        case .success():
            return
        case .failure(let failure):
            debugPrint(failure)
        }
    }
}
