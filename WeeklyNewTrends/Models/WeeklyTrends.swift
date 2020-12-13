//
//  WeeklyTrendsResponse.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 11/12/20.
//

import Foundation

// MARK: - WeeklyTrendsResponse
struct WeeklyTrends: Codable {
	let products: [Product]
	let title: String
	let productCount: Int

	enum CodingKeys: String, CodingKey {
		case products, title
		case productCount = "product_count"
	}
}

// MARK: - Product
struct Product: Codable {
	let id: String
	let name: String
	let price: String
	let image: String
}

