//
//  ProductsViewController.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 10/12/20.
//

import UIKit
import SnapKit

class ProductsViewController: UIViewController {
	
	var viewModel: ProductListViewModel
	
	lazy var productCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		return collectionView
	}()
	
	init(productListViewModel: ProductListViewModel) {
		self.viewModel = productListViewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		/*
		if let flowLayout = contentView.collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
		flowLayout.estimatedItemSize = CGSize(width: 150, height: 50)
		}
		
		if let collectionFlowLayout = contentView.collectionView.collectionViewLayout as? UICollectionViewFlowLayout{
		collectionFlowLayout.minimumLineSpacing = 10
		collectionFlowLayout.minimumInteritemSpacing = 20
		}
		*/
		
		setupCollectionView()
		viewModel.viewDelegate = self
		viewModel.getWeeklyTrendProducts()
	}
	
	private func refreshDisplay() {
		DispatchQueue.main.async { [self] in
			title = viewModel.title
			productCollectionView.reloadData()
		}
	}
	
	private func setupCollectionView() {
		
		view.addSubview(productCollectionView)
		productCollectionView.contentInset = UIEdgeInsets(top: 10, left: viewModel.cellPadding, bottom: 10, right: viewModel.cellPadding)
		
		productCollectionView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
		
		productCollectionView.register(ProductCell.self)
		
		productCollectionView.dataSource = self
		productCollectionView.delegate = self
		productCollectionView.backgroundColor = .themeMain
	}
	
}

extension ProductsViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	}
}

extension ProductsViewController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.numberOfItems
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ProductCell
		guard let viewModel = viewModel.productCellViewModel(at: indexPath) else { return cell }
		cell.config(withViewModel: viewModel)
		return cell
	}
	
}

extension ProductsViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: (collectionView.frame.width / CGFloat(viewModel.itemsPerRow) - viewModel.cellPadding), height: collectionView.frame.height/2.5)
	}
}

extension ProductsViewController: ProductListViewModelViewDelegate
{
	func productsDidChange() {
		refreshDisplay()
	}
	
}
