//
//  UsersStorage.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 19.02.2024.
//

import Foundation

protocol UsersStorage {
    func fetchGithubUsers() async throws -> [GithubUser] 
    func saveGithubUsers(_ users: [GithubUser]) async throws
}
