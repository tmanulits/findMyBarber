//
//  CustomTabBarController.swift
//  TableTest1
//
//  Created by Tim Manu on 8/15/20.
//  Copyright © 2020 Tim Manu. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let window = UIWindow()
        window.rootViewController = BrowsePageVC()
        let browsePageVC = BrowsePageVC()
        let searchStoresNavigationController = UINavigationController(rootViewController: browsePageVC)
        searchStoresNavigationController.tabBarItem.title = "Saloons"
        searchStoresNavigationController.tabBarItem.image = UIImage(named: "searchIcon")
        tabBar.tintColor = .black
        
        viewControllers = [searchStoresNavigationController, creatingViewControllers(title: "Appoitment", imageName: "bladeIcon", viewController: AppoitmentVC()), creatingViewControllers(title: "Profile", imageName: "profileIcon", viewController: ProfileVC())]
    }
    
    fileprivate func creatingViewControllers(title: String, imageName: String, viewController: UIViewController) -> UINavigationController {
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)
        
        return navigationController
    }
}
