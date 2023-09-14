//
//  Request.swift
//  
//
//  Created by Amit Saini on 14/09/23.
//

import Foundation

protocol Request {
    var path: String { get }
    var method: HTTPMethod { get }
    var queryParameters: [String: String] { get }
    var bodyParameters: [String: Any] { get }
    func urlRequest(with config: NetworkConfigurable) async throws -> URLRequest
}

actor APIRequest: Request {
    let path: String
    let method: HTTPMethod
    let queryParameters: [String: String]
    let bodyParameters: [String: Any]

    init(path: String,
         method: HTTPMethod,
         queryParameters: [String: String] = [:],
         bodyParameters: [String: Any] = [:]) {
        self.path = path
        self.method = method
        self.queryParameters = queryParameters
        self.bodyParameters = bodyParameters
    }

    func urlRequest(with config: NetworkConfigurable) async throws -> URLRequest {
        let url = config.baseURL.appendingPathComponent(path)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        urlRequest.allHTTPHeaderFields = config.headers

        if !queryParameters.isEmpty {
            var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false)
            urlComponents?.queryItems = queryParameters.map { URLQueryItem(name: $0.key, value: $0.value) }
            guard let urlWithQuery = urlComponents?.url else { throw NetworkError.urlError }
            urlRequest.url = urlWithQuery
        }

        if !bodyParameters.isEmpty {
            let jsonData = try JSONSerialization.data(withJSONObject: bodyParameters)
            urlRequest.httpBody = jsonData
        }

        return urlRequest
    }
}
