//
//  DeleteUserUseCase.swift
//  Little Lemon
//
//  Created by Tam Hac on 07/03/2024.
//

import Foundation

class DeleteUserUseCase {
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func invoke() -> Result<Void, Error> {
        do {
            try userRepository.deleteUser()
            return .success(())
        } catch {
            return .failure(error)
        }
    }
}
