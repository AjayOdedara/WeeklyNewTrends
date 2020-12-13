//
//  Reusable.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 13/12/20.
//

import UIKit

protocol Reusable: class {}

extension Reusable where Self: UIView {
	
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}
