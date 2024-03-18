//
//  SecondTabCoordinator.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import Combine

class SecondTabCoordinator {
    
    var cancellables = Set<AnyCancellable>()
    
    let path = ObjectNavigationPath()
    
    private(set) var secondTabViewModel: SecondTabRootViewModel
    
    private var dataDIContainer: DataDIContainer
    
    init() {
        let servicesDIContainer = ServicesDIContainer()
        let domainDIContainer = DomainDIContainer(
            apiClient: servicesDIContainer.makeAPIClient(baseURLString: AppConfig.baseURLString),
            usersStorage: servicesDIContainer.makeDefaultsUsersStorage()
        )
        dataDIContainer = DataDIContainer(
            githubNetworkRepository: domainDIContainer.makeGithubNetworkRepository(),
            githubStorageRepository: domainDIContainer.makeGithubStorageRepository()
        )
        
        secondTabViewModel = SecondTabRootViewModel(useCase: dataDIContainer.makeGithubUsersCase())
        
        self.showSecondTabViewModel()
    }
    
    func showSecondTabViewModel() {
        secondTabViewModel.transitionPublisher.sink { [weak self] transition in
            switch transition {
            case .showUserDetails(let githubUser):
                self?.showDetails(user: githubUser)
            }
        }.store(in: &cancellables)
    }
    
    func showDetails(user: GithubUser) {
        let firstDetailsViewModel = SecondTabDetailsViewModel(user: user)
        firstDetailsViewModel.transitionPublisher.sink { [weak self] transition in
            switch transition {
            case .back:
                self?.path.removeLast()
            }
        }.store(in: &cancellables)
        path.append(firstDetailsViewModel)
    }
}
