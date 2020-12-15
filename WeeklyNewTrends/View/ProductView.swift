//
//  ProductView.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 13/12/20.
//

import UIKit
import SDWebImage

class ProductView: UIView {
	
	var name: UILabel = {
		let label = UILabel()
		label.textColor = .black
		label.numberOfLines = 2
		return label
	}()
	
	var color: UILabel = {
		let label = UILabel()
		label.textColor = .lightGray
		label.numberOfLines = 2
		//label.backgroundColor = .yellow
		return label
	}()
	
	var price: UILabel = {
		let label = UILabel()
		label.textColor = .black
		label.numberOfLines = 2
		//label.backgroundColor = .cl
		return label
	}()
	
	var image: UIImageView = {
		let imageView = UIImageView()
		imageView.contentMode = .scaleAspectFit
		imageView.clipsToBounds = true
		imageView.backgroundColor = .clear
		return imageView
	}()
	
	var favoriteBtn: UIButton = {
		let button = UIButton()
		button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
		return button
	}()
	
	convenience init() {
		self.init(frame: CGRect.zero)
		setupConstraints()
	}
	
	func setupConstraints() {
		
		addSubview(image)
		addSubview(name)
		addSubview(color)
		addSubview(price)
		addSubview(favoriteBtn)
		
		image.snp.makeConstraints { make in
			make.top.equalToSuperview()
			make.leading.equalToSuperview()
			make.trailing.equalToSuperview()
			make.bottom.equalToSuperview().offset(-70)
		}
		
		name.snp.makeConstraints { make in
			make.top.equalTo(image.snp.bottom).offset(3)
			make.leading.equalToSuperview()
			make.trailing.equalToSuperview()
			make.bottom.lessThanOrEqualToSuperview()
		}
		
		color.snp.makeConstraints { make in
			make.top.equalTo(name.snp.bottom).offset(3)
			make.leading.equalToSuperview()
			make.trailing.equalToSuperview()
			make.bottom.lessThanOrEqualToSuperview()
		}
		
		price.snp.makeConstraints { make in
			make.top.equalTo(color.snp.bottom).offset(3)
			make.leading.equalToSuperview()
			make.bottom.lessThanOrEqualToSuperview()
			make.bottom.equalToSuperview()
		}
		
		favoriteBtn.snp.makeConstraints { make in
			make.top.equalTo(color.snp.bottom).offset(3)
			make.leading.equalTo(price.snp.trailing).offset(2)
			make.trailing.equalToSuperview()
			make.bottom.equalToSuperview()
			make.width.lessThanOrEqualTo(20)
			make.height.lessThanOrEqualTo(20)
		}
	}
	
	func config(withViewModel viewModel: ProductCellViewModelProtocol) {
		name.text = viewModel.productName()
		color.text = viewModel.productColor()
		price.text = viewModel.productPrice()
		image.sd_setImage(with: viewModel.productImage(), placeholderImage: UIImage(named: "placeholder"))
	}
	
}
