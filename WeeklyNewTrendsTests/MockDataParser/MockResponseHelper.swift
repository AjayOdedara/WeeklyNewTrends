//
//  MockResponseHelper.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 16/12/20.
//


import Foundation

enum MockResponseType: String {
	case invalidJsonResponse = "WeeklyProductListInvalidResponse"
	case validJsonResponse = "WeeklyProductListValidResponse"
	case emptyJsonResponse = "WeeklyProductListEmptyResponse"
}

class MockResponseHelper {
	
	func processJsonData(for responseType: MockResponseType) -> Data {
		guard let path = Bundle(for: type(of: self)).url(forResource: responseType.rawValue, withExtension: "json"),
			let result = try? Data(contentsOf: path) else { return Data() }
		return result
	}
}
