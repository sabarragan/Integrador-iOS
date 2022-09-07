//
//  SceneDelegate.swift
//  Integrador-iOS
//
//  Created by Santiago Barragan Leon on 6/09/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let homeViewController = SuggestionViewController()
        
        let navController = UINavigationController(rootViewController: homeViewController)
        
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
    
    

}

