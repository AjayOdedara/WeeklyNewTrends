//
//  SceneDelegate.swift
//  WeeklyNewTrends
//
//  Created by Ajay Odedra on 10/12/20.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?
	var appCoordinator: AppCoordinator?
	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		
		guard let windowScene = (scene as? UIWindowScene) else { return }
		window = UIWindow(frame: UIScreen.main.bounds)
		window?.windowScene = windowScene
		appCoordinator = AppCoordinator(window: window!)
		appCoordinator?.start()
	}

}

