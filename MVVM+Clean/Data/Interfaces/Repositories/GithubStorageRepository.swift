//
//  GithubStorageRepository.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 20.02.2024.
//

import Foundation

protocol GithubStorageRepository {
    func fetchGithubUsers() async throws -> [GithubUser]
    func saveGithubUsers(_ users: [GithubUser]) async throws
}
