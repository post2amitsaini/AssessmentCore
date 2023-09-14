//
//  NetworkManager.swift
//  
//
//  Created by Amit Saini on 10/09/23.
//

import Foundation

actor NetworkManager {
    let config: ApiDataNetworkConfig

    init(config: ApiDataNetworkConfig) {
        self.config = config
    }

    func performRequest<T: Decodable>(_ request: APIRequest) async throws -> T {
        let urlRequest = try await request.urlRequest(with: config)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
            throw NetworkError.invalidResponse
        }

        let decoder = JSONDecoder()
        let decodedResponse = try decoder.decode(T.self, from: data) // Use 'data' directly instead of 'responseData'
        return decodedResponse
    }
}
