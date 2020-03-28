//
//  BrowsePageVC.swift
//  TableTest1
//
//  Created by Tim Manu on 10/16/19.
//  Copyright © 2019 Tim Manu. All rights reserved.
//

import UIKit

class BrowsePageVC: UIViewController {

    var tableView = UITableView()
    var stores: [BarberStoreLabel] = []
    var distances: [Distance] = []
    lazy var topConstraint: CGFloat = 0
    
    let navigationButton: UIButton = {
        let image = UIImage(named: "navigation")
        let nb = UIButton()
        nb.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        nb.setImage(image, for: .normal)
        nb.contentMode = .center
        nb.contentMode = .scaleAspectFill
        nb.layer.cornerRadius = 23
        
        return nb
    }()
    
    let searchContainerView: UIView = {
        let searchCV = UIView()
        searchCV.backgroundColor = .gray
        return searchCV
    }()

    
    struct Cells {
        static let browseCell = "BrowseCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stores = fetchLabelsData()
        distances = fetchDistance()
        confgureTableView()
        
        view.addSubview(navigationButton)
        view.addSubview(searchContainerView)
        self.addChild(searchVC)
        
       // guard let root = UIApplication.shared.keyWindow?.rootViewController else {
         //   return
        //}
        let rootWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
        guard let rootVC = rootWindow?.rootViewController else { return }
        guard let navController = navigationController else { return }
        
        //let frame = self.view.safeAreaLayoutGuide.layoutFrame
        //print("safe", view.safeAreaInsets.top)
        //print("Safe area top: ", roou?.rootViewController?.view.safeAreaInsets.top)
        print("Safe area top: ", rootVC.view.safeAreaInsets.top)
        //print("Safe area top: ", root.view.safeAreaInsets.top)
        print("Nav Controller top: ", navController.navigationBar.frame.size.height)
        let offsetStartPoint = rootVC.view.safeAreaInsets.top + navController.navigationBar.frame.size.height
        print("Offset start point: ", offsetStartPoint - (offsetStartPoint * 2))
        //print("Nav controller: ", navigationController?.navigationBar.frame.size.height)
        
        

        setNavigationButtonConstraints()
        setTableViewConstraints()
        setupNavigationBar()
        
//        for family in UIFont.familyNames.sorted() {
//            let names = UIFont.fontNames(forFamilyName: family)
//            print("Family: \(family) Font names: \(names)")
//        }
        
    }
    
    fileprivate func setupNavigationBar() {
        let button = UIBarButtonItem(image: UIImage(named: "searchIcon"), style: .plain, target: self, action: #selector(handleNavBarButton))
        self.navigationItem.rightBarButtonItem = button
        self.navigationItem.rightBarButtonItem?.tintColor = .black

    }
    
    let searchVC: SearchVC = {
        let svc = SearchVC()
        return svc
    }()
    
    
    @objc func handleNavBarButton() {
        
        view.addSubview(searchVC.view)

        let endAnimationPoint = view.safeAreaInsets.top
        let screenSize = UIScreen.main.bounds
  

        let heightVal = screenSize.height - view.safeAreaInsets.bottom - view.safeAreaInsets.top

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
            self.searchVC.view.frame = CGRect(x: 0, y: endAnimationPoint, width: screenSize.width, height: heightVal)
        }, completion: nil)
        

    }

    func confgureTableView() {
        
        view.addSubview(tableView)
        setTableViewDelegates()
        tableView.rowHeight = 340
        tableView.register(BrowseCell.self, forCellReuseIdentifier: Cells.browseCell)
        tableView.showsVerticalScrollIndicator = false
        tableView.pin(to: view)

    }
    
    func setTableViewDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset.y)
//        let safeAreaTop: CGFloat = 88
//
//        let offset = scrollView.contentOffset.y + safeAreaTop
//
//        searchContainerView.transform = .init(scaleX: 0, y: -offset)
    }
    
    
    func setSearchContainerView() {
        searchContainerView.translatesAutoresizingMaskIntoConstraints = false
        searchContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        searchContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        searchContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        searchContainerView.heightAnchor.constraint(equalToConstant: 300).isActive = true

    }
    
    func setTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setNavigationButtonConstraints() {
        navigationButton.translatesAutoresizingMaskIntoConstraints = false
        navigationButton.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: -115).isActive = true
        navigationButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        navigationButton.widthAnchor.constraint(equalToConstant: 46).isActive = true
        navigationButton.heightAnchor.constraint(equalToConstant: 46).isActive = true
    }


}

extension BrowsePageVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stores.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.browseCell) as! BrowseCell
        let store = stores[indexPath.row]
        let distance = distances[indexPath.row]
        cell.setAddressTitle(barberStoreLabel: store)
        cell.setDistance(distanceToTheStoreLabel: distance)
        return cell
    }
}

extension BrowsePageVC {
    
    fileprivate func fetchLabelsData() -> [BarberStoreLabel] {
        let store1 = BarberStoreLabel(title: "Abner’s Barbershop", address: "3359 Mission St, San Francisco")
        let store2 = BarberStoreLabel(title: "The House of Handsome", address: "4971 Mission St, San Francisco")
        let store3 = BarberStoreLabel(title: "Fine Line Barbershop", address: "1796 San Jose Avenue, San Francisco")
        return [store1, store2, store3]
    }
    
    fileprivate func fetchDistance() -> [Distance] {
        let firstStore = Distance(distance: 0.7)
        let secondStore = Distance(distance: 1.2)
        let thirdStore = Distance(distance: 1.4)
        return [firstStore, secondStore, thirdStore]
    }
}
