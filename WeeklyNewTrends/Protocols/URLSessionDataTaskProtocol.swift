//
//  URLSessionDataTaskProtocol.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 10/12/20.
//

import Foundation

protocol URLSessionDataTaskProtocol {
    func resume()
    func cancel()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }
