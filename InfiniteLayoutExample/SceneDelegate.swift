//
//  SceneDelegate.swift
//  InfiniteLayoutExample
//
//  Created by iMac on 2022/07/04.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)
        guard let window = window else { return }
        window.backgroundColor = .systemBackground
        window.rootViewController = ViewController()
        window.makeKeyAndVisible()
    }
}

