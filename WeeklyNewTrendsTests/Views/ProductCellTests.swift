//
//  ProductCellTests.swift
//  WeeklyNewTrendsTests
//
//  Created by Ajay Odedra on 16/12/20.
//

import XCTest
@testable import WeeklyNewTrends

class ProductCellTests: XCTestCase {
	
	func testInitWithCoderShouldBeNil() {
		XCTAssertNil(ProductCell(coder: NSCoder()))
	}
}
