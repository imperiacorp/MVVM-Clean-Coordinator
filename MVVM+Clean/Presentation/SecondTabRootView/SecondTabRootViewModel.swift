//
//  SecondTabRootViewModel.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import Foundation
import Combine

class SecondTabRootViewModel: BaseViewModel<SecondTabRootViewTransition> {
    
    @Published var users = [UserViewModel]()
    @Published var error: Error?
    
    let showUserDetails: PassthroughSubject<Int, Never> = PassthroughSubject()
    
    private var useCase: GithubUsersUseCase
    private var githubUsers = [GithubUser]()
    
    init(useCase: GithubUsersUseCase) {
        self.useCase = useCase
        
        super.init()
        
        self.bind()
        self.retrieveGithubUsers()
    }
    
    // MARK: Private methods
    
    private func bind() {
        
        self.showUserDetails
            .sink(receiveValue: { [weak self] userId in
                guard let self = self, let neededUser = githubUsers.first(where: { $0.id == userId }) else { return }
                transitionSubject.send(.showUserDetails(githubUser: neededUser))
            })
            .store(in: &cancellables)
        
    }
    
    private func retrieveGithubUsers() {
        Task {
            do {
                let githubUsers = try await useCase.fetchUsers()
                let viewModels = githubUsers.map { UserViewModel(githubUser: $0) }
                Task { @MainActor in
                    users = viewModels
                    self.githubUsers = githubUsers
                }
            } catch {
                Task { @MainActor in
                    self.error = error
                }
            }
        }
    }
}
