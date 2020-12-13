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
	var listViewController: ProductsViewController?
	let weeklyTrendService: WeeklyTrendService
	
	// MARK: - Initialization
	
	init(weeklyTrendService: WeeklyTrendService) {
		self.weeklyTrendService = weeklyTrendService
	}
	
	func createMain() -> UIViewController {
		
		let viewModel = ProductListViewModel(withWeeklyTrendService: weeklyTrendService)
		viewModel.getWeeklyTrendProducts()
		let productListViewController = ProductsViewController(viewModel: viewModel)
		productListViewController.viewModel = viewModel
		listViewController = productListViewController
		return productListViewController
	}
}
