//
//  Resource.swift
//  
//
//  Created by Amit Saini on 19/09/23.
//

import Foundation

struct Resource<T: Codable> {
    
    let url: URL
    var method: HttpMethod = .get([])
}
