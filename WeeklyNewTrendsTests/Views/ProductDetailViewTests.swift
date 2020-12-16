//
//  ProductDetailViewTests.swift
//  WeeklyNewTrendsTests
//
//  Created by Ajay Odedra on 16/12/20.
//
import XCTest

@testable import WeeklyNewTrends

class ProductDetailViewTests: XCTestCase {

	func testInitWithCoderShouldBeNil() {
		XCTAssertNil(ProductDetailView(coder: NSCoder()))
	}
}
