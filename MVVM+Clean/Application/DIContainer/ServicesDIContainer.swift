//
//  ServicesDIContainer.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 28.02.2024.
//

import Foundation

final class ServicesDIContainer {
    
    func makeAPIClient(baseURLString: String) -> APICLient {
        return APIClientImpl(baseURLString: baseURLString)
    }
    
    func makeMockAPIClient() {
        
    }
    
    func makeDefaultsUsersStorage() -> UsersStorage {
        DefaultsUsersStorage(userDefaults: UserDefaults.standard)
    }
    
    func makeCoreDataUsersStorage() {
        
    }
}
