//
//  AppDelegate.swift
//  OOExamples
//
//  Created by Karsten Litsche on 21.10.17.
//
//

import UIKit
import OOUIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    // MARK: - init
    
    // MARK: - UIApplicationDelegate
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        appScreenFlow = ScreenFlow()
        window?.rootViewController = appScreenFlow.ui
        window?.makeKeyAndVisible()
        return true
    }
    
    // MARK: - private
    
    private var appScreenFlow: OOScreen!
    
}

