//
//  ProfileVC.swift
//  TableTest1
//
//  Created by Tim Manu on 9/2/20.
//  Copyright © 2020 Tim Manu. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    let signInLabel: UILabel = {
        let siLabel = UILabel()
        siLabel.text = "Sign in"
        siLabel.font = UIFont(name: Fonts.sfProLight, size: 24)
        siLabel.adjustsFontSizeToFitWidth = true
        siLabel.textAlignment = .center
        
        return siLabel
    }()
    
    let toContinueLabel: UILabel = {
        let tcLabel = UILabel()
        tcLabel.text = "to continue appointment booking..."
        tcLabel.font = UIFont(name: Fonts.sfProLight, size: 18)
        tcLabel.adjustsFontSizeToFitWidth = true
        tcLabel.textAlignment = .center
        
        return tcLabel
    }()
    
    let emailSignIn: UIButton = {
        let esign = UIButton(type: .system)
        esign.backgroundColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)
        esign.layer.cornerRadius = 7
        esign.setTitle("CONTINUE WITH EMAIL", for: .normal)
        esign.setTitleColor(.white, for: .normal)
        esign.titleLabel?.font = UIFont(name: Fonts.sfProLight, size: 20)
        
        return esign
    }()
    
    let orTextView: UILabel = {
        let orTV = UILabel()
        orTV.textColor = UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1)
        orTV.font = UIFont(name: Fonts.sfProLight, size: 14)
        orTV.text = "OR"
        orTV.adjustsFontSizeToFitWidth = true
        orTV.textAlignment = .center
        
        return orTV
    }()
    
    let separationLine: UIView = {
        let seperatLn = UIView()
        seperatLn.backgroundColor = UIColor(red: 184/255, green: 184/255, blue: 184/255, alpha: 1)
        seperatLn.layer.cornerRadius = 1
        return seperatLn
    }()
    
    let facebookSignIn: UIButton = {
        let fbsign = UIButton(type: .system)
        fbsign.backgroundColor = UIColor(red: 60/255, green: 89/255, blue: 155/255, alpha: 1)
        fbsign.layer.cornerRadius = 7
        fbsign.setTitle("CONTINUE WITH FACEBOOK", for: .normal)
        fbsign.setTitleColor(.white, for: .normal)
        fbsign.titleLabel?.font = UIFont(name: Fonts.sfProLight, size: 20)
        
        return fbsign
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupProfileVC()
    }
    
    
    func setupProfileVC() {
        view.backgroundColor = .white
        navigationItem.title = "SIGN IN TO CONTINUE"
        
        
        view.addSubview(signInLabel)
        view.addSubview(toContinueLabel)
        view.addSubview(emailSignIn)
        
        setSignInLabelConstraints()
        setToContinueLabelConstraints()
        
        setEmailSignInButtonConstraints()
        setupStackViewConstraints()
        
    }
    
    func setSignInLabelConstraints() {
        signInLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true
        signInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        signInLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        signInLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        signInLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setToContinueLabelConstraints() {
        toContinueLabel.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 25).isActive = true
        toContinueLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        toContinueLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        toContinueLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        toContinueLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setEmailSignInButtonConstraints() {
        emailSignIn.topAnchor.constraint(equalTo: toContinueLabel.bottomAnchor, constant: 130).isActive = true
        emailSignIn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        emailSignIn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        emailSignIn.heightAnchor.constraint(equalToConstant: 50).isActive = true
        emailSignIn.translatesAutoresizingMaskIntoConstraints = false
    }

    
    fileprivate func setupStackViewConstraints() {
        view.addSubview(separationLine)
        view.addSubview(orTextView)
    
        separationLine.topAnchor.constraint(equalTo: emailSignIn.bottomAnchor, constant: 40).isActive = true
        separationLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        separationLine.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        separationLine.heightAnchor.constraint(equalToConstant: 20).isActive = true
        separationLine.translatesAutoresizingMaskIntoConstraints = false
        separationLine.backgroundColor = .cyan
        
        orTextView.leadingAnchor.constraint(equalTo: separationLine.leadingAnchor, constant: 80).isActive = true
        orTextView.trailingAnchor.constraint(equalTo: separationLine.trailingAnchor, constant: -80).isActive = true
        orTextView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        orTextView.translatesAutoresizingMaskIntoConstraints = false

    }
    
}
