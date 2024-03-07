//
//  GetUserUseCase.swift
//  Little Lemon
//
//  Created by Tam Hac on 06/03/2024.
//

import Foundation

final class GetUserUseCase {
    private let userRepository: UserRepository

    init(userRepository: UserRepository) {
        self.userRepository = userRepository
    }

    func invoke() -> Result<User, Error> {
        do {
            let user = try userRepository.getUser()
            return .success(user)
        } catch {
            return .failure(error)
        }
    }
}
