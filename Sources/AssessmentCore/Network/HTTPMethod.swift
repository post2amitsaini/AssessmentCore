//
//  HTTPMethod.swift
//  
//
//  Created by Amit Saini on 14/09/23.
//

import Foundation

enum HttpMethod {
    case get([URLQueryItem])
    case post(Data?)
    
    var name: String {
        switch self {
            case .get:
                return "GET"
            case .post:
                return "POST"
        }
    }
}

