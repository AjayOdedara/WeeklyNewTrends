//
//  ProductListViewModel.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 10/12/20.
//

import Foundation

protocol ProductListViewModelViewDelegate: class {
	func productsDidChange(viewModel: ProductListViewModel)
}

protocol ProductListViewModelProtocol {
	var title: String { get }
	var data: WeeklyTrends? { get set }
	var numberOfItems: Int { get }
	
	func itemAtIndex(_ index: Int) -> Product?
	func getWeeklyTrendProducts()
	
	var viewDelegate: ProductListViewModelViewDelegate? { get set }
}
