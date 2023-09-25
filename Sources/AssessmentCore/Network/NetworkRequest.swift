//
//  NetworkRequest.swift
//  
//
//  Created by Amit Saini on 25/09/23.
//

import Foundation

public protocol NetworkRequestProtocol {
    var path: String { get set }
    var method: HTTPMethod { get set }
    var headerParamaters: [String: String] { get set }
    var queryParameters: [String: Any] { get set }
    var bodyParamaters: [String: Any] { get set }
}

public class NetworkRequest: NetworkRequestProtocol {
    
    public var path: String
    public var method: HTTPMethod
    public var headerParamaters: [String: String]
    public var queryParameters: [String: Any]
    public var bodyParamaters: [String: Any]
   
    public init(path: String,
         method: HTTPMethod,
         headerParamaters: [String: String] = [:],
         queryParameters: [String: Any] = [:],
         bodyParamaters: [String: Any] = [:]) {
        self.path = path
        self.method = method
        self.headerParamaters = headerParamaters
        self.queryParameters = queryParameters
        self.bodyParamaters = bodyParamaters
    }
}
