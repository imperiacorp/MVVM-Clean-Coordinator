//
//  DefaultsUsersStorage.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 19.02.2024.
//

import Foundation

final class DefaultsUsersStorage {
    
    private enum Consts {
        static let usersStorageKey = "GitHubUsersKey"
    }
    
    private let userDefaults: UserDefaults
    
    init(userDefaults: UserDefaults) {
        self.userDefaults = userDefaults
    }
    
    private func fetchArray<T: Codable>(key: String) -> [T] {
        guard let queriesData = userDefaults.object(forKey: key) as? Data else { return [] }
        let movieQueryList = try? JSONDecoder().decode([T].self, from: queriesData)
        return movieQueryList ?? []
    }

    private func persist<T: Codable>(objects: [T], key: String) {
        let encoder = JSONEncoder()
        guard let encoded = try? encoder.encode(objects) else { return }
        userDefaults.set(encoded, forKey: key)
    }
}

extension DefaultsUsersStorage: UsersStorage {
    
    func fetchGithubUsers() async throws -> [GithubUser] {
        fetchArray(key: Consts.usersStorageKey)
    }
    
    func saveGithubUsers(_ users: [GithubUser]) async throws {
        persist(objects: users, key: Consts.usersStorageKey)
    }
}
