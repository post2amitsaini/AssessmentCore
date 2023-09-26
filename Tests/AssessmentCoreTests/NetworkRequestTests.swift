//
//  NetworkRequestTests.swift
//  
//
//  Created by Amit Saini on 25/09/23.
//

import XCTest
@testable import AssessmentCore

final class NetworkRequestTests: XCTestCase {
    func testNetworkRequestInitialization() {
        let request = NetworkRequest(path: "/test",
                                     method: .get,
                                     headerParamaters: ["headerKey": "headerValue"],
                                     queryParameters: ["queryKey": "queryValue"],
                                     bodyParamaters: ["bodyKey": "bodyValue"])
        
        XCTAssertEqual(request.path, "/test")
        XCTAssertEqual(request.method, .get)
        XCTAssertEqual(request.headerParamaters, ["headerKey": "headerValue"])
//        XCTAssertEqual(request.queryParameters, ["queryKey": "queryValue"])
//        XCTAssertEqual(request.bodyParamaters, ["bodyKey": "bodyValue"])
    }
    
}
