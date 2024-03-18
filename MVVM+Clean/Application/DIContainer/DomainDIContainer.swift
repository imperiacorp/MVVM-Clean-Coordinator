//
//  DomainDIContainer.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 20.02.2024.
//

import Foundation

final class DomainDIContainer {
    
    private let apiClient: APICLient
    private let usersStorage: UsersStorage
    
    init(apiClient: APICLient, usersStorage: UsersStorage) {
        self.apiClient = apiClient
        self.usersStorage = usersStorage
    }
    
    func makeGithubNetworkRepository() -> GithubNetworkRepository {
        GithubNetworkRepositoryImpl(client: apiClient)
    }
    
    func makeGithubStorageRepository() -> GithubStorageRepository {
        GithubStorageRepositoryImpl(storage: usersStorage)
    }
}
