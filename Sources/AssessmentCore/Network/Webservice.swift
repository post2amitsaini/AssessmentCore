//
//  Webservice.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

public class Webservice {
    
    public init() {}
    
    public func load<T: Codable>(_ resource: Resource<T>) async throws -> T {
        
        var request = URLRequest(url: resource.url)

        switch resource.method {
            case .post(let data):
                request.httpMethod = resource.method.name
                request.httpBody = data
            case .get(let queryItems):
                request = URLRequest(url: resource.url)
        }
        
        // create the URLSession configuration
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        
        let (data, response) = try await session.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode)
        else {
            throw NetworkError.invalidResponse
        }
        
        guard let result = try? JSONDecoder().decode(T.self, from: data) else {
            throw NetworkError.decodingError
        }
        
        return result
    }
}
