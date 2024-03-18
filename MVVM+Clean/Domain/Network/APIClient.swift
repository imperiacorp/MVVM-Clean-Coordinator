//
//  APIClient.swift
//  CloudTrainer
//
//  Created by Dmitriy Gonchar on 19.02.2024.
//

import Foundation

protocol APICLient {
    func generalPerform(request: Request) async throws -> Data
    func send(request: Request) async throws
    func send<T: Decodable>(request: Request) async throws -> T where T: Decodable
}

final class APIClientImpl: APICLient {

    var baseURLString: String
    var session = URLSession.shared
    
    // MARK: Public functions

    init(baseURLString: String) {
        self.baseURLString = baseURLString
    }
    
    func generalPerform(request: Request) async throws -> Data {
        guard let urlRequest = makeRequest(request: request) else {
            throw APIError.badURLError
        }
        
        let (data, response) = try await session.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.unspecifiedError
        }
                
        switch httpResponse.statusCode {
        case 200...399:
            return data
        case 400...499:
            throw APIError.clientError
        case 500...599:
            throw APIError.serverError
        default:
            throw APIError.unspecifiedError
        }
    }
    
    func send(request: Request) async throws {
        _ = try await generalPerform(request: request)
    }
    
    func send<T: Decodable>(request: Request) async throws -> T where T: Decodable {
        do {
            let data = try await generalPerform(request: request)
            do {
                let parsedData = try JSONDecoder().decode(T.self, from: data)
                return parsedData
            } catch {
                throw APIError.decodingError
            }
        } catch {
            throw error
        }
    }
    
    // Private methods
    
    private func makeRequest(request: Request) -> URLRequest? {
        guard let requestURL = URL(string: baseURLString + request.endPoint) else { return nil }
        var urlRequest = URLRequest(url: requestURL)
        urlRequest.httpMethod = request.httpMethod.rawValue
        
        request.headers?.forEach {
            urlRequest.addValue(
                $0.value,
                forHTTPHeaderField: $0.key
            )
        }
        
        urlRequest.addValue(request.encoding.headerString, forHTTPHeaderField: "Accept")
        urlRequest.addValue(request.encoding.headerString, forHTTPHeaderField: "Content-Type")
        
        if
            let bodyParams = request.bodyParams,
            let jsonData = try? JSONSerialization.data(withJSONObject: bodyParams)
        {
            urlRequest.httpBody = jsonData
        }
        
        return urlRequest
    }
}
