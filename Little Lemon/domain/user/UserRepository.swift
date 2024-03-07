//
//  UserRepository.swift
//  Little Lemon
//
//  Created by Tam Hac on 06/03/2024.
//

import Foundation

protocol UserRepository {
    func getUser() throws -> User

    func saveUser(_ user: User) throws
    
    func deleteUser() throws
}
