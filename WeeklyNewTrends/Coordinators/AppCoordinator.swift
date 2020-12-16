//
//  AppCoordinator.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 10/12/20.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
	
	var window: UIWindow
	var navigation: UINavigationController
	
	init(window: UIWindow, navigation: UINavigationController)
	{
		self.navigation = navigation
		self.window = window
		window.rootViewController = emptyState()
		window.tintColor = .themeMain
		window.backgroundColor = .themeMain
		window.makeKeyAndVisible()
		
		navigation.navigationBar.tintColor = .black
		navigation.navigationBar.barTintColor = .themeMain
		let BarButtonItemAppearance = UIBarButtonItem.appearance()
		BarButtonItemAppearance.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.clear], for: .normal)
	}
	
	func start()
	{
		let listCoordinator = ProductListCoordinator(navigation: navigation, weeklyTrendService: WeeklyTrendService())
		listCoordinator.start()
		window.rootViewController = listCoordinator.navigation
	}
	
	private func emptyState() -> UIViewController {
		let viewController = UIViewController()
		viewController.view.backgroundColor = .themeMain
		return viewController
	}
}

