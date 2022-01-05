//
//  SceneDelegate.swift
//  VibrationButtons
//
//  Created by Adriano-R Vieira on 05/01/22.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = MainViewController(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
    }
}

