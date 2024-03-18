//
//  GitHubUsersRepositoryImpl.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 20.02.2024.
//

import Foundation

final class GithubNetworkRepositoryImpl {
    private let apiClient: APICLient
    
    init(client: APICLient) {
        self.apiClient = client
    }
}

extension GithubNetworkRepositoryImpl: GithubNetworkRepository {
    func fetchUsers() async throws -> [GithubUser] {
       try await apiClient.send(request: GithubRequests.users)
    }
}
