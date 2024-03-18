//
//  GithubStorageRepositoryImpl.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 20.02.2024.
//

import Foundation

final class GithubStorageRepositoryImpl {
    private let storage: UsersStorage
    
    init(storage: UsersStorage) {
        self.storage = storage
    }
}

extension GithubStorageRepositoryImpl: GithubStorageRepository {
    func fetchGithubUsers() async throws -> [GithubUser] {
        try await storage.fetchGithubUsers()
    }
    
    func saveGithubUsers(_ users: [GithubUser]) async throws {
        try await storage.saveGithubUsers(users)
    }
    
    
}
