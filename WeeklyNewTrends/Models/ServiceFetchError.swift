//
//  FetchError.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 11/12/20.
//

import Foundation

enum ServiceFetchError: Error {
	case invalidJSON
	case decodingError
	case invalidURL
	case networkFailed
	case limit
}
