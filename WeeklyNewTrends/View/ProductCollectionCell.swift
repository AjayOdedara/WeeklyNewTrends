//
//  ProductCollectionCell.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 13/12/20.
//

import UIKit

class ProductCollectionCell: UICollectionViewCell, Reusable {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setupViews()
		setupConstraints()
	}
	
	required init?(coder aDecoder: NSCoder) {
		return nil
	}
	
	func setupConstraints(){
		
	}
	
	func setupViews() {
		backgroundColor = .clear
	}
}
