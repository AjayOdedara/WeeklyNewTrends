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
	private var mainCoordinator: ProductListCoordinator?
	
	init(window: UIWindow)
	{
		self.window = window
		
		window.tintColor = .themeMain
		window.backgroundColor = .themeMain
		
		window.rootViewController = emptyState()
		window.makeKeyAndVisible()
	}
	
	func start()
	{
		DispatchQueue.main.async { [weak self] in
			self?.goToMainApp()
		}
	}
	private func goToMainApp() {
		let (mainCoordinator, rootViewController) = createMain()
		self.mainCoordinator = mainCoordinator
		window.rootViewController = rootViewController
	}
	private func emptyState() -> UIViewController {
		let viewController = UIViewController()
		viewController.view.backgroundColor = .themeMain
		return viewController
	}
	
	private func createMain() -> (ProductListCoordinator, UIViewController) {
		let mainCoordinator = ProductListCoordinator(weeklyTrendService: WeeklyTrendService())
		let viewController = mainCoordinator.createMain()
		return (mainCoordinator, viewController)
	}
}

