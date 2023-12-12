//
//  AppDelegate.swift
//  TestApp
//
//  Created by Елена Воронцова on 12.12.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    weak var window: UIWindow?
    var startService: StartService?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window
        self.startService = StartService(window: window)
        return true
    }
}

