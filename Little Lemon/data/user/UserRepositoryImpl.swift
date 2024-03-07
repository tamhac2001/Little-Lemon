//
//  UserRepositoryImpl.swift
//  Little Lemon
//
//  Created by Tam Hac on 06/03/2024.
//

import Foundation

class UserRepositoryImpl: UserRepository {

    
    private let userDatastore: UserDatastore

    init(userDatastore: UserDatastore) {
        self.userDatastore = userDatastore
    }

    func getUser() throws -> User {
        let userEntity = try userDatastore.fetch()
        return userEntity.toUser()
    }

    func saveUser(_ user: User) throws {
        let userEntity = UserEntity(from: user)
        try userDatastore.save(userEntity)
    }
    
    func deleteUser() throws {
        try userDatastore.delete()
    }
}
