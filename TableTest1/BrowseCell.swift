//
//  BrowseCell.swift
//  TableTest1
//
//  Created by Tim Manu on 10/21/19.
//  Copyright © 2019 Tim Manu. All rights reserved.
//

import UIKit

class BrowseCell: UITableViewCell {
    
    private var storeImages: [BarberStoreImage] = []
    let gradientLayer = CAGradientLayer()
    
//    var fetchStoreImages: [BarberStoreImage] = {
//        let firstImage = BarberStoreImage(imageName: "haircut1")
//        let secondImage = BarberStoreImage(imageName: "haircut2")
//        let thirdImage = BarberStoreImage(imageName: "haircut3")
//
//        return [firstImage, secondImage, thirdImage]
//    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //let frame = CGRect(x: 30, y: 50, width: 100, height: 100)
        //layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        //layout.itemSize = CGSize(width: 50, height: 50)
        //cv = UICollectionView(frame: frame, collectionViewLayout: layout)
        //addSubview(collectionView)
        cv.delegate = self
        cv.dataSource = self
        cv.isPagingEnabled = true
        cv.register(ImageCell.self, forCellWithReuseIdentifier: "cellId")
        cv.showsHorizontalScrollIndicator = false
        cv.backgroundColor = .yellow
        
        cv.layer.cornerRadius = 4
        
        return cv
    }()

    
    var browseImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = self.storeImages.count
        
        return pc
    }()
    
    var browseTitleLabel: UILabel = {
       var bTitleLabel = UILabel()
        bTitleLabel.font = UIFont(name: Fonts.sfProRegular, size: 22.0)
        bTitleLabel.numberOfLines = 0
        //bTitleLabel.textColor = .red
        bTitleLabel.adjustsFontSizeToFitWidth = true
        return bTitleLabel
    }()
    
    var addressLabel: UILabel = {
        var aLabel = UILabel()
        aLabel.font = UIFont(name: Fonts.sfProLight, size: 16.0)
        aLabel.numberOfLines = 0
        aLabel.adjustsFontSizeToFitWidth = true
        return aLabel
    }()
    
    var mapIcon: UIImageView = {
        var mi = UIImageView()
        mi.image = UIImage(named: "mapIconWhite")
        mi.contentMode = .scaleAspectFill
        return mi
    }()
    
    var distanceLabel: UILabel = {
        var dl = UILabel()
        dl.font = UIFont(name: Fonts.sfProRegular, size: 30)
        dl.textColor = .white
        dl.numberOfLines = 0
        dl.adjustsFontSizeToFitWidth = true
        return dl
    }()
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        storeImages = fetchImages()
        //addSubview(browseImageView)
        addSubview(browseTitleLabel)
        addSubview(addressLabel)
        addSubview(collectionView)
        addSubview(pageControl)
        addSubview(mapIcon)
        addSubview(distanceLabel)
        configureBrowseImageView()
//        configureBrowseTitleLabel()
//        configureAddressLabel()
        //setImageConstraints()

    

//        configureCollectionView()
//        setupCollectionViewDelegates()
        setCollectionViewConstraints()
        setPageControlConstraints()
        setTitleLabelConstraints()
        setAddressLabelConstraints()
        setMapIconConstraints()
        setDistanceConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func layoutSublayers(of layer: CALayer) {
//        super.layoutSublayers(of: self.layer)
//        gradientLayer.frame = collectionView.bounds
//        
//        let colorSet = [UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0),
//                        UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)]
//        //let location = [0.2, 1.0]
//        let location = [0.8, 1.1]
//        
//        collectionView.addGradient(with: gradientLayer, colorSet: colorSet, locations: location)
//    }
    
//    func configureCell(content: UIView) {
//        let colorSet = [UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0),
//                        UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)]
//        let location = [0.2, 1.0]
//        collectionView.addGradient(with: gradientLayer, colorSet: colorSet, locations: location)
//    }
    

    
//    func setupCollectionViewDelegates() {
//        collectionView.delegate = self
//        collectionView.dataSource = self
//    }
    
//    func configureCollectionView() {
//        let layout = UICollectionViewFlowLayout()
//        let frame = CGRect(x: 30, y: 50, width: 100, height: 100)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
//        layout.itemSize = CGSize(width: 50, height: 50)
//        collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
//        addSubview(collectionView)
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
//        collectionView.backgroundColor = .yellow
//
//        collectionView.layer.cornerRadius = 4
//        //collectionView.bringSubviewToFront(browseImageView)
//        //collectionView.pin(to: browseImageView)
//    }
    
    
    func setAddressTitle(barberStoreLabel: BarberStoreLabel) {
        //browseImageView.image = barberStore.image
        browseTitleLabel.text = barberStoreLabel.title
        addressLabel.text = barberStoreLabel.address
    }
    
    func setDistance(distanceToTheStoreLabel: Distance) {
        distanceLabel.text = "\(distanceToTheStoreLabel.distance) mi"
        //print(distanceToTheStoreLabel.distance)
    }
    
    func configureBrowseImageView() {
        browseImageView.layer.cornerRadius = 4
        browseImageView.clipsToBounds = true
    }
    
//    func configureBrowseTitleLabel() {
//        browseTitleLabel.numberOfLines = 0
//        browseTitleLabel.font = UIFont(name: "SF Pro Text", size: 12)
//        browseTitleLabel.adjustsFontSizeToFitWidth = true
//    }
//
//    func configureAddressLabel() {
//        addressLabel.numberOfLines = 0
//        addressLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
//        addressLabel.adjustsFontSizeToFitWidth = true
//    }
    
//    func setImageConstraints() {
//        browseImageView.translatesAutoresizingMaskIntoConstraints = false
//        browseImageView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -24).isActive = true
//        browseImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
//        browseImageView.heightAnchor.constraint(equalToConstant: 255).isActive = true
//        browseImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17).isActive = true
//    }
    
    func setCollectionViewConstraints() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -24).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: 255).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17).isActive = true
    }
    
    func setPageControlConstraints() {
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.centerYAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -12).isActive = true
        pageControl.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 0.1).isActive = true
        pageControl.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor).isActive = true
        
    }
    
    func setTitleLabelConstraints() {
        browseTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        browseTitleLabel.centerYAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 20).isActive = true
        browseTitleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        browseTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        browseTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17).isActive = true
    }
    
    func setAddressLabelConstraints() {
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.centerYAnchor.constraint(equalTo: browseTitleLabel.bottomAnchor, constant: 10).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 17).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -17).isActive = true
    }
    
    func setMapIconConstraints() {
        mapIcon.translatesAutoresizingMaskIntoConstraints = false
        mapIcon.centerYAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -15).isActive = true
        mapIcon.rightAnchor.constraint(equalTo: collectionView.rightAnchor, constant: -70).isActive = true
        mapIcon.widthAnchor.constraint(equalToConstant: 17).isActive = true
        mapIcon.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
    
    func setDistanceConstraints() {
        distanceLabel.translatesAutoresizingMaskIntoConstraints = false
        distanceLabel.centerYAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: -15).isActive = true
        distanceLabel.rightAnchor.constraint(equalTo: collectionView.rightAnchor, constant: -15).isActive = true
        distanceLabel.widthAnchor.constraint(equalToConstant: 50).isActive = true
        distanceLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / collectionView.frame.width)
        pageControl.currentPage = pageNumber
    }
    
}

extension BrowseCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return storeImages.count
        //return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! ImageCell
        
        let storeBarberImages = storeImages[indexPath.row]
        cell.barberStoreImage = storeBarberImages
                
//        gradientLayer.frame = cell.contentView.bounds
//        
//        let colorSet = [UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0),
//                        UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1.0)]
//        let location = [0.8, 1.1]
//        
//        cell.contentView.addGradient(with: gradientLayer, colorSet: colorSet, locations: location)
        
//        let storeImages = fetchStoreImages[indexPath.row]
//        cell.barberStoreImage = storeImages
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
    }
    
}

extension BrowseCell {
    fileprivate func fetchImages() -> [BarberStoreImage] {
        let firstImage = BarberStoreImage(imageName: "haircut1")
        let secondImage = BarberStoreImage(imageName: "haircut2")
        let thirdImage = BarberStoreImage(imageName: "haircut3")
        
        return [firstImage, secondImage, thirdImage]
    }
}
