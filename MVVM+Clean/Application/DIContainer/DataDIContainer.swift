//
//  DataDIContainer.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 20.02.2024.
//

import Foundation

final class DataDIContainer {
    
    private let githubNetworkRepository: GithubNetworkRepository
    private let githubStorageRepository: GithubStorageRepository
    
    init(githubNetworkRepository: GithubNetworkRepository, githubStorageRepository: GithubStorageRepository) {
        self.githubNetworkRepository = githubNetworkRepository
        self.githubStorageRepository = githubStorageRepository
    }
    
    func makeGithubUsersCase() -> GithubUsersUseCase {
        GithubUsersUseCaseImpl(githubRepository: githubNetworkRepository, githubStorageRepository: githubStorageRepository)
    }
}
