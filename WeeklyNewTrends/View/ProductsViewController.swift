//
//  ProductsViewController.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 10/12/20.
//

import UIKit
import SnapKit

class ProductsViewController: UIViewController {
	
	var viewModel: ProductListViewModel? {
		didSet {
			viewModel?.viewDelegate = self
		}
	}
	
	lazy var productCollectionView: UICollectionView = {
		let layout = UICollectionViewLayout()
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		view.addSubview(collectionView)
		collectionView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
		collectionView.delegate = self
		collectionView.backgroundColor = .red
		return collectionView
	}()
	
	init(viewModel: ProductListViewModel) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func refreshDisplay()
	{
		DispatchQueue.main.async { [self] in
			title = viewModel?.title
			productCollectionView.reloadData()
		}
	}
	

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
}
extension ProductsViewController: UICollectionViewDelegate{
	
}

extension ProductsViewController: ProductListViewModelViewDelegate
{
	func productsDidChange(viewModel: ProductListViewModel) {
		DLog("\(viewModel.data?.productCount)")
		refreshDisplay()
		
	}
	
}
