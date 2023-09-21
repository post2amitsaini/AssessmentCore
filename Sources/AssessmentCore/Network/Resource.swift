//
//  Resource.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

public struct Resource<T: Codable> {
    
    public let url: URL
    public var method: HttpMethod = .get([])
    
    public init(url: URL, method: HttpMethod = .get([])) {
        self.url = url
        self.method = method
    }
}
