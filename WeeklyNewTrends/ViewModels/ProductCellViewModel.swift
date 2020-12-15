//
//  ProductCollectionCellViewModel.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 13/12/20.
//

import Foundation

class ProductCellViewModel: ProductCellViewModelProtocol {
	
	var product: Product
	
	init(withProduct product: Product) {
		self.product = product
	}
}
