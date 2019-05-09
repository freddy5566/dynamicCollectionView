//
//  AppDelegate.swift
//  DynamicCollectionView
//
//  Created by Jamfly on 2019/5/10.
//  Copyright © 2019 jamfly. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    window = UIWindow()
    window?.makeKeyAndVisible()

    window?.rootViewController = DynamicCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout())

    return true
  }

}
