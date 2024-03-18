//
//  GithubUsersUseCase.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 20.02.2024.
//

import Foundation

protocol GithubUsersUseCase {
    func fetchUsers() async throws -> [GithubUser]
}

final class GithubUsersUseCaseImpl {
    
    private let githubRepository: GithubNetworkRepository
    private let githubStorageRepository: GithubStorageRepository
    
    init(githubRepository: GithubNetworkRepository, githubStorageRepository: GithubStorageRepository) {
        self.githubRepository = githubRepository
        self.githubStorageRepository = githubStorageRepository
    }
}

extension GithubUsersUseCaseImpl: GithubUsersUseCase {
    func fetchUsers() async throws -> [GithubUser] {
        let users = try await githubRepository.fetchUsers()
        try await githubStorageRepository.saveGithubUsers(users)
        return users
    }
}
