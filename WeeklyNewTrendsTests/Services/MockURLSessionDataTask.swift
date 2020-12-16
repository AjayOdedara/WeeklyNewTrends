//
//  MockURLSessionDataTask.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 16/12/20.
//


import Foundation
@testable import WeeklyNewTrends

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
    
    func cancel() {
        
    }
}
