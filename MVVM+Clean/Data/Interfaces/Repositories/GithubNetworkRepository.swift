//
//  GitHubUsersRepository.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 20.02.2024.
//

import Foundation

protocol GithubNetworkRepository {
    func fetchUsers() async throws -> [GithubUser]
}
