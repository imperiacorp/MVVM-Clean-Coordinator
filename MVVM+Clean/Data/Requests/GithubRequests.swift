//
//  GithubRequests.swift
//  MVVM+Clean
//
//  Created by Dmitriy Gonchar on 20.02.2024.
//

import Foundation

enum GithubRequests: Request {

    case users

    var endPoint: String {
        switch self {
            case .users: return "users"
        }
    }

    var httpMethod: HTTPMethod {
        switch self {
            case .users:
                return .get
        }
    }

    var headers: [String : String]? {
        return [:]
    }

    var authorizedRequest: Bool {
        return false
    }

    var errorCodeKeys: [String] {
        switch self {
            default: return []
        }
    }

    var bodyParams: [String: Any]? {
        switch self {
        case .users:
            return nil
        }
    }
    
    var encoding: RequestEncoding {
        return .json
    }
}
