//
//  APIRequest.swift
//  CodingTask
//
//  Created by Dmitriy Gonchar on 19.02.2024.
//

import Foundation

public enum HTTPMethod: String {
    case options = "OPTIONS"
    case get     = "GET"
    case head    = "HEAD"
    case post    = "POST"
    case put     = "PUT"
    case patch   = "PATCH"
    case delete  = "DELETE"
    case trace   = "TRACE"
    case connect = "CONNECT"
}

public enum RequestEncoding {

    /// The JSON Accept/Content-Type encoding.
    case json

    /// The Form-URLEncoded Accept/Content-Type encoding.
    case form

    /// The JSON text/html Accept/Content-Type encoding.
    case textHTML
    
    case imageJPEG
    
    var headerString: String {
        switch self {

        case .json:
            return "application/json"

        case .form:
            return "application/x-www-form-urlencoded; charset=utf-8; v=2"

        case .textHTML:
            return "text/html"
            
        case .imageJPEG:
            return "image/jpeg"
        }
    }
}


protocol Request {
    var endPoint: String { get }
    var httpMethod: HTTPMethod { get }
    var authorizedRequest: Bool { get }
    var headers: [String : String]? { get }
    var errorCodeKeys: [String] { get }
    var bodyParams: [String: Any]? { get }
    var encoding: RequestEncoding { get }
}
