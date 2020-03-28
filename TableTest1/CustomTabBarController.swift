//
//  CustomTabBarController.swift
//  TableTest1
//
//  Created by Tim Manu on 1/15/20.
//  Copyright © 2020 Tim Manu. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let window = UIWindow()
        //let layout = UICollectionViewFlowLayout()
        window.rootViewController = BrowsePageVC()
        let browsePageVC = BrowsePageVC()
        let searchStoresNavigationController = UINavigationController(rootViewController: browsePageVC)
        searchStoresNavigationController.tabBarItem.title = "Saloons"
        searchStoresNavigationController.tabBarItem.image = UIImage(named: "searchIcon")
        tabBar.tintColor = .black
        
        viewControllers = [searchStoresNavigationController, creatingViewControllers(title: "Appoitment", imageName: "bladeIcon"), creatingViewControllers(title: "Profile", imageName: "profileIcon")]
    }
    
    fileprivate func creatingViewControllers(title: String, imageName: String) -> UINavigationController {
        let viewController = UIViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = UIImage(named: imageName)
        
        return navigationController
    }
}
