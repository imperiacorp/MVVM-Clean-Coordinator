//
//  SecondTabRootViewTransition.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 09.02.2024.
//

import Foundation

enum SecondTabRootViewTransition: AppTransition {
    case showUserDetails(githubUser: GithubUser)
}
