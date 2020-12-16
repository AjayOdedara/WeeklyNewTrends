//
//  ProductDetailViewModelProtocol.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 15/12/20.
//

import Foundation

protocol ProductDetailViewModelDelegate: class {
	func detailDidLoad(viewModel: ProductDetailViewModelProtocol)
}

protocol ProductDetailViewModelProtocol {
	var product: Product? { get set }
	var viewDelegate: ProductDetailViewModelDelegate? { get set }
}
