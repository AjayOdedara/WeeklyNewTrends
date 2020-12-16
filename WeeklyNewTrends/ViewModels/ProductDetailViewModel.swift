//
//  ProductDetailViewModel.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 15/12/20.
//

import Foundation

class ProductDetailViewModel: ProductDetailViewModelProtocol {
	
	weak var viewDelegate: ProductDetailViewModelDelegate?
	
	var product: Product? {
		didSet {
			viewDelegate?.detailDidLoad(viewModel: self)
		}
	}
}
