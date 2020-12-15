//
//  MainCoordinator.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 10/12/20.
//

import UIKit

protocol ProductListCoordinatorDelegate: class
{
	func listCoordinatorDidFinish(productListCoordinator: ProductListCoordinator)
}

class ProductListCoordinator {
	
	weak var delegate: ProductListCoordinatorDelegate?
	let weeklyTrendService: WeeklyTrendService
	
	init(weeklyTrendService: WeeklyTrendService) {
		self.weeklyTrendService = weeklyTrendService
	}
	
	func createMain() -> UIViewController {
		let viewModel = ProductListViewModel(withWeeklyTrendService: weeklyTrendService)
		let productListViewController = ProductsViewController(productListViewModel: viewModel)
		productListViewController.viewModel = viewModel
		return productListViewController
	}
}
