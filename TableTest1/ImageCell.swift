//
//  ImageCell.swift
//  TableTest1
//
//  Created by Tim Manu on 11/8/20.
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
    }
    
    override func layoutSublayers(of layer: CALayer) {
        super.layoutSublayers(of: self.layer)
        gradientLayer.frame = storeImageView.bounds
        
        let colorSet = [UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0),
                        UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)]
        let location = [0.8, 1.06]
        
        storeImageView.addGradient(with: gradientLayer, colorSet: colorSet, locations: location)
    }
    
    func setupViews() {
        addSubview(storeImageView)
//        addSubview(pageControl)
        storeImageView.pin(to: contentView)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
