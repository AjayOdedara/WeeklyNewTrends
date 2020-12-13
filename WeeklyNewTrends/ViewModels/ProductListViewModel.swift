//
//  ProductListViewModel.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 12/12/20.
//

import Foundation
class ProductListViewModel: ProductListViewModelProtocol {
	
	var title: String {
		if let products = data {
			return products.title
		}
		return "Weekly Trend"
	}
	
	internal var data: WeeklyTrends? {
		didSet {
			viewDelegate?.productsDidChange(viewModel: self)
		}
	}
	
	var viewDelegate: ProductListViewModelViewDelegate?
	private let weeklyTrendService: WeeklyTrendService
	
	init(withWeeklyTrendService weeklyTrendService: WeeklyTrendService) {
		self.weeklyTrendService = weeklyTrendService
	}
	
	var numberOfItems: Int {
		if let items = data {
			return items.productCount
		}
		return 0
	}
	
	func itemAtIndex(_ index: Int) -> Product? {
		if let items = data?.products, items.count > index {
			return items[index]
		}
		return nil
	}
	
	func getWeeklyTrendProducts() {
		weeklyTrendService.fetch { [weak self] (result) in
			switch result{
			case .success(let response):
				self?.data = response
			case .failure(let error):
				DLog(error.localizedDescription)
			}
		}
	}
	
	
}
