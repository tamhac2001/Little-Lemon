//
//  SaveUserUseCase.swift
//  Little Lemon
//
//  Created by Tam Hac on 06/03/2024.
//

import Foundation

final class SaveUserUseCase {
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func invoke(_ user: User) -> Result<Void, Error> {
        do {
            return try .success(userRepository.saveUser(user))
        } catch {
            return .failure(error)
        }
    }
}
