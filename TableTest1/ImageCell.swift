//
//  ImageCell.swift
//  TableTest1
//
//  Created by Tim Manu on 1/8/20.
//  Copyright © 2020 Tim Manu. All rights reserved.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    let gradientLayer = CAGradientLayer()
    var barberStoreImage: BarberStoreImage? {
        didSet {
            guard let storeImage = barberStoreImage else { return }
            
            storeImageView.image = UIImage(named: storeImage.imageName)
        }
    }
    
    let storeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        //imageView.image = UIImage(named: "haircut2")
        imageView.clipsToBounds = true
        return imageView
    }()
//    let pageControl: UIPageControl = {
//        let pc = UIPageControl()
//        pc.numberOfPages = 3
//        return pc
//    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
//        setupCostraints()
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: self.layer)
        gradientLayer.frame = storeImageView.bounds
        
        let colorSet = [UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0),
                        UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)]
        //let location = [0.2, 1.0]
        let location = [0.8, 1.06]
        
        storeImageView.addGradient(with: gradientLayer, colorSet: colorSet, locations: location)
    }
    
    func setupViews() {
        addSubview(storeImageView)
//        addSubview(pageControl)
        storeImageView.pin(to: contentView)
    }
    
    
//    func setupCostraints() {
//        pageControl.translatesAutoresizingMaskIntoConstraints = false
//        pageControl.centerYAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15).isActive = true
//        pageControl.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
//        pageControl.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
//        pageControl.heightAnchor.constraint(equalToConstant: 0.1).isActive = true
//    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
