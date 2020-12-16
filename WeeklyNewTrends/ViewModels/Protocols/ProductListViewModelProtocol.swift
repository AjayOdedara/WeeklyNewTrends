//
//  ProductListViewModel.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 10/12/20.
//

import Foundation

protocol ProductListViewModelDelegate: class {
	func productsDidLoad()
}

protocol ProductListViewModelCoordinatorDelegate: class {
	func productDidSelect(_ viewModel: ProductListViewModel, data: Product)
}

protocol ProductListViewModelProtocol {
	var title: String { get }
	var data: WeeklyTrends? { get set }
	var numberOfItems: Int { get }
	
	func productCellViewModel(at indexPath: IndexPath) -> ProductCellViewModel?
	func getWeeklyTrendProducts()
	
	var viewDelegate: ProductListViewModelDelegate? { get set }
}
