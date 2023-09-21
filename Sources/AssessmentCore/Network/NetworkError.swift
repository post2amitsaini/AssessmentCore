//
//  NetworkError.swift
//  
//
//  Created by Amit Saini on 14/09/23.
//

import Foundation

public enum NetworkError: Error {
    case badUrl
    case invalidResponse
    case decodingError
}
