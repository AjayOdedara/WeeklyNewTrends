//
//  MockURLSession.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 16/12/20.
//


import XCTest
import Foundation
@testable import WeeklyNewTrends

class MockURLSession: URLSessionProtocol {
    private (set) var lastURL: URL?
    var nextDataTask = MockURLSessionDataTask()
    var nextResponse: HTTPURLResponse?
    var nextData: Data?
    var nextError: ServiceFetchError?
    
    func data(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = url
        completionHandler(nextData, nextResponse, nextError)
        return nextDataTask
    }
}
