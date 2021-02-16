//
//  AppoitmentVC.swift
//  TableTest1
//
//  Created by Tim Manu on 9/2/20.
//  Copyright © 2020 Tim Manu. All rights reserved.
//

import UIKit

class AppoitmentVC: UIViewController {
    
    
    
    let scheduledLabel: UILabel = {
        let sLabel = UILabel()
        sLabel.text = "Scheduled Appoitments"
        sLabel.font = UIFont(name: Fonts.sfProLight, size: 23.0)
        sLabel.adjustsFontSizeToFitWidth = true
        sLabel.textAlignment = .center
        
        return sLabel
    }()
    
    let bookLabel: UILabel = {
        let bLabel = UILabel()
        bLabel.text = "Book your first appoitment with Find My Barber"
        bLabel.font = UIFont(name: Fonts.sfProLight, size: 18.0)
        bLabel.adjustsFontSizeToFitWidth = true
        bLabel.textAlignment = .center
        
        return bLabel
    }()
    
    let appoitmentImage: UIImageView = {
        let ai = UIImageView()
        ai.image = UIImage(named: "appoitmentVCImage")
        ai.contentMode = .scaleAspectFit
        ai.clipsToBounds = true
        return ai
    }()
    
    let letsGoButton: UIButton = {
        let ltsgobtn = UIButton(type: .system)
        ltsgobtn.backgroundColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        ltsgobtn.setTitleColor(.white, for: .normal)
        ltsgobtn.setTitle("LET’S GO", for: .normal)
        ltsgobtn.titleLabel?.font = UIFont(name: Fonts.sfProLight, size: 23)
        ltsgobtn.layer.cornerRadius = 7
        ltsgobtn.addTarget(self, action: #selector(handleLetsGoButton), for: .touchUpInside)
        return ltsgobtn
    }()
    
    @objc func handleLetsGoButton() {
        let browseVC = BrowsePageVC()
        
        browseVC.modalPresentationStyle = .fullScreen
        self.tabBarController?.selectedIndex = 0
        
    }
    
    let alreadyRegisteredLabel: UILabel = {
        let aregisteredLbl = UILabel()
        aregisteredLbl.text = "Already registered?"
        aregisteredLbl.font = UIFont(name: Fonts.sfProLight, size: 18)
        aregisteredLbl.adjustsFontSizeToFitWidth = true
        
        return aregisteredLbl
    }()
    
    let signInButton: UIButton = {
        let sibutton = UIButton(type: .system)
        sibutton.backgroundColor = nil
        sibutton.setTitleColor(UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1), for: .normal)
        sibutton.setTitle("Sign in to your account", for: .normal)
        sibutton.titleLabel?.font = UIFont(name: Fonts.sfProLight, size: 18)
        
        return sibutton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupVC()
        
    }
    
    func setupVC() {
        navigationItem.title = "YOUR APPOITMENTS"
        view.backgroundColor = .white
        
        view.addSubview(scheduledLabel)
        view.addSubview(bookLabel)
        view.addSubview(appoitmentImage)
        view.addSubview(letsGoButton)
        
        
        
        setScheduledLabelConstraints()
        setBookLabelConstraints()
        setAppoitmentImageConstraints()
        setLetsGoButtonConstraints()
        setupStackViewConstraints()
    }
    
    func setScheduledLabelConstraints() {
        scheduledLabel.translatesAutoresizingMaskIntoConstraints = false
        scheduledLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 160).isActive = true
        scheduledLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        scheduledLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        scheduledLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    func setBookLabelConstraints() {
        bookLabel.translatesAutoresizingMaskIntoConstraints = false
        bookLabel.topAnchor.constraint(equalTo: scheduledLabel.bottomAnchor, constant: 8).isActive = true
        bookLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        bookLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        bookLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    
    func setAppoitmentImageConstraints() {
        appoitmentImage.translatesAutoresizingMaskIntoConstraints = false
        appoitmentImage.topAnchor.constraint(equalTo: bookLabel.bottomAnchor, constant: 40).isActive = true
        appoitmentImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        appoitmentImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        appoitmentImage.heightAnchor.constraint(equalToConstant: 80).isActive = true
        
    }
    
    func setLetsGoButtonConstraints() {
        letsGoButton.translatesAutoresizingMaskIntoConstraints = false
        letsGoButton.topAnchor.constraint(equalTo: appoitmentImage.bottomAnchor, constant: 40).isActive = true
        letsGoButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        letsGoButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        letsGoButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    fileprivate func setupStackViewConstraints() {
        let labelContainerView = UIView()
        
        let signInButtonContainerView = UIView()
        
        
        let stackView = UIStackView(arrangedSubviews: [
            labelContainerView, signInButtonContainerView
        ])
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: letsGoButton.bottomAnchor, constant: 36).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        view.addSubview(alreadyRegisteredLabel)
        view.addSubview(signInButton)
        
        alreadyRegisteredLabel.translatesAutoresizingMaskIntoConstraints = false
        alreadyRegisteredLabel.topAnchor.constraint(equalTo: labelContainerView.topAnchor).isActive = true
        alreadyRegisteredLabel.trailingAnchor.constraint(equalTo: labelContainerView.trailingAnchor, constant: -1).isActive = true
        alreadyRegisteredLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.topAnchor.constraint(equalTo: signInButtonContainerView.topAnchor).isActive = true
        signInButton.leadingAnchor.constraint(equalTo: signInButtonContainerView.leadingAnchor, constant: 1).isActive = true
        signInButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }
    
}
