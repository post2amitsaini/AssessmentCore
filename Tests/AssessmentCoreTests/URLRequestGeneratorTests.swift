//
//  URLRequestGeneratorTests.swift
//  
//
//  Created by Amit Saini on 25/09/23.
//

import XCTest
@testable import AssessmentCore

final class URLRequestGeneratorTests: XCTestCase {
    
    func testURLRequestGeneration() {
        let request = NetworkRequest(path: "/test",
                                     method: .get,
                                     headerParamaters: ["headerKey": "headerValue"],
                                     queryParameters: ["queryKey": "queryValue"],
                                     bodyParamaters: ["bodyKey": "bodyValue"])
        
        let generator = URLRequestGenerator()
        
        do {
            let urlRequest = try generator.createURLRequest(using: request)
            XCTAssertEqual(urlRequest.url?.path, "/test")
            XCTAssertEqual(urlRequest.httpMethod, "GET")
            XCTAssertEqual(urlRequest.allHTTPHeaderFields, ["headerKey": "headerValue"])
            
            let queryItems = URLComponents(url: urlRequest.url!, resolvingAgainstBaseURL: false)?.queryItems
            XCTAssertEqual(queryItems?.count, 1)
            XCTAssertEqual(queryItems?[0].name, "queryKey")
            XCTAssertEqual(queryItems?[0].value, "queryValue")
            
            let bodyData = urlRequest.httpBody
            let bodyDict = try JSONSerialization.jsonObject(with: bodyData!, options: []) as? [String: Any]
            XCTAssertEqual(bodyDict?["bodyKey"] as? String, "bodyValue")
        } catch {
            XCTFail("Unexpected error: \(error.localizedDescription)")
        }
    }
}
