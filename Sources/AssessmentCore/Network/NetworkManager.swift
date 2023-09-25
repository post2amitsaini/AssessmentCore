//
//  NetworkManager.swift
//  
//
//  Created by Amit Saini on 25/09/23.
//

import Foundation

public protocol NetworkManagerProtocol {
    func request<T: Decodable>(request: NetworkRequestProtocol, responseType: T.Type) async throws -> T
}

public class NetworkManager: NetworkManagerProtocol{
    
    private let session: URLSession
    private let requestGenerator: URLRequestGeneratorProtocol
    
    public init(session: URLSession, requestGenerator: URLRequestGeneratorProtocol) {
        self.session = session
        self.requestGenerator = requestGenerator
    }
    
    public convenience init(session: URLSession = .shared) {
        self.init(session: session, requestGenerator: URLRequestGenerator())
    }
    
    public func request<T>(request: NetworkRequestProtocol, responseType: T.Type) async throws -> T where T : Decodable {
        guard let urlRequest = try? requestGenerator.createURLRequest(using: request) else {
            throw NetworkError.invalidRequest
        }
        let (data, response) = try await session.data(for: urlRequest)
        
        guard let httpResponse = response as? HTTPURLResponse, (200..<300).contains(httpResponse.statusCode) else {
            throw NetworkError.badRequest
        }
        
        do {
            let decodedResponse = try JSONDecoder().decode(T.self, from: data)
            return decodedResponse
        }catch{
            throw error
        }
    }
}

