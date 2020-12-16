//
//  ProductDetailCoordinator.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 15/12/20.
//

import UIKit

protocol ProductDetailCoordinatorDelegate: class
{
	func detailCoordinatorDidFinish(detailCoordinator: ProductDetailCoordinator)
}

class ProductDetailCoordinator: Coordinator {
	
	let product: Product
	var navigation: UINavigationController
	
	init(navigation: UINavigationController, product: Product)
	{
		self.navigation = navigation
		self.product = product
	}
	
	func start()
	{
		let productDetailVC = ProductsDetailController()
		let viewModel = ProductDetailViewModel()
		productDetailVC.viewModel = viewModel
		viewModel.product = self.product
		navigation.pushViewController(productDetailVC, animated: true)
	}
}
