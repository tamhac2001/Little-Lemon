//
//  UserDatastore.swift
//  Little Lemon
//
//  Created by Tam Hac on 06/03/2024.
//

import Foundation
import SwiftData

final class UserDatastore {
    private let context: ModelContext

    init(context: ModelContext) {
        self.context = context
    }

    func fetch() throws -> UserEntity {
        return try context.fetch(FetchDescriptor<UserEntity>()).first ?? UserEntity(avatar: nil, firstName: "", lastName: "", email: "", phoneNumber: "")
    }

    func save(_ user: UserEntity) throws {
        try context.delete(model: UserEntity.self)
        context.insert(user)
        try context.save()
    }
    
    func delete() throws{
        try context.delete(model: UserEntity.self)
        try context.save()
    }
}
