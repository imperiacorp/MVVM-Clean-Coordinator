//
//  GithubUser.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 20.02.2024.
//

import Foundation

struct GithubUser: Codable {
    let id: Int
    let login: String
    let htmlURL: String
    let avatarURL: String
    
    enum CodingKeys: String, CodingKey {
        case id, login
        case htmlURL = "html_url"
        case avatarURL = "avatar_url"
    }
}
