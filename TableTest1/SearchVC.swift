//
//  SearchVC.swift
//  TableTest1
//
//  Created by Tim Manu on 8/24/20.
//  Copyright © 2020 Tim Manu. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    var viewTranslation = CGPoint(x: 0, y: 0)

    
    let arrowImage: UIImageView = {
        let arrowImg = UIImageView()
        arrowImg.contentMode = .scaleAspectFit
        arrowImg.clipsToBounds = true
        arrowImg.image = UIImage(named: "arrow")
        return arrowImg
    }()

    @objc func handleButton() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0 - UIScreen.main.bounds.height, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    let searchTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = UIColor(white: 1, alpha: 0.1)
        tf.text = "Choose a city"
        tf.textColor = .lightGray
        
        tf.leftViewMode = .always
        tf.autocorrectionType = .no
        
        let imageView = UIImageView(frame: CGRect(x: 10, y: -8, width: 16, height: 16))
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 36, height: tf.frame.height))
        imageView.image = UIImage(named: "searchIconTF")
        imageView.clipsToBounds = false
        imageView.contentMode = .scaleAspectFit

        paddingView.addSubview(imageView)
        tf.leftView = paddingView

        tf.layer.cornerRadius = 7
        return tf
    }()
    
    let segmentedControl: UISegmentedControl = {
        let font = UIFont(name: Fonts.sfProRegular, size: 16)
        let sc = UISegmentedControl(items: ["Low First", "High First"])
        sc.tintColor = .darkGray
        sc.setTitleTextAttributes([
            NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 16),
            NSAttributedString.Key.foregroundColor: UIColor.white,
        ], for: .normal)
        sc.setTitleTextAttributes([
            NSAttributedString.Key.foregroundColor: UIColor.gray
        ], for: .selected)
        sc.selectedSegmentIndex = 0
        sc.addTarget(self, action: #selector(handleSegmentedChange), for: .valueChanged)
        return sc
    }()
    
    @objc fileprivate func handleSegmentedChange() {
        print(segmentedControl.selectedSegmentIndex)
    }
    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchTextField.delegate = self
        
        setupSearchVC()
        setArrowImageConstraints()
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
        
        
        let stackView = UIStackView(arrangedSubviews: [
            searchTextField, segmentedControl
        ])
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
    }
    
    

    @objc func handleDismiss(sender: UIPanGestureRecognizer) {
        
        
        let touchPoint = sender.location(in: self.view.window)
        let rootWindow = UIApplication.shared.windows.first { $0.isKeyWindow }
        guard let rootVC = rootWindow?.rootViewController else { return }
        guard let navController = navigationController else { return }
        let offsetStartPointY = rootVC.view.safeAreaInsets.top + navController.navigationBar.frame.size.height
        
        
        switch sender.state {
        case .began:
            viewTranslation = touchPoint
            UIView.animate(withDuration: 0.1) {
                self.arrowImage.image = UIImage(named: "arrowWhite")
                self.arrowImage.transform = CGAffineTransform(rotationAngle: 3.14159)
            }
        case .changed:
            if touchPoint.y - viewTranslation.y < 0 {
                view.frame = CGRect(x: 0, y: touchPoint.y - viewTranslation.y + offsetStartPointY, width: view.frame.width, height: view.frame.height)
            }
        case .ended:
            if touchPoint.y - viewTranslation.y > -100 {
                dismiss(animated: false, completion: nil)
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.frame = CGRect(x: 0, y: offsetStartPointY, width: self.view.frame.width, height: self.view.frame.height)
                }, completion: nil)
                UIView.animate(withDuration: 0.1) {
                    self.arrowImage.transform = .identity
                    self.arrowImage.image = UIImage(named: "arrow")
                }

            } else {
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.frame = CGRect(x: 0, y: 0 - self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height)
                    self.arrowImage.transform = .identity
                    self.arrowImage.image = UIImage(named: "arrow")
                }, completion: nil)
                navigationController?.navigationBar.isHidden = false
            }
            
        default:
            break
        }
    }
    
    
    
    func setupSearchVC() {
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        let screenSize = UIScreen.main.bounds
        
        let yPosition = 0 - screenSize.height - view.safeAreaInsets.bottom - view.safeAreaInsets.top
        let widthPosition = screenSize.width
        let heightPosition = screenSize.height - view.safeAreaInsets.bottom - view.safeAreaInsets.top
        
        view.frame = CGRect(x: 0, y: yPosition, width: widthPosition, height: heightPosition)
        print("Y Position: ", yPosition)
        print(view.frame.minY - view.safeAreaInsets.top)
        
        
        blurEffectView.frame = view.bounds
        blurEffectView.backgroundColor = UIColor(white: 0, alpha: 0.6)
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        
        view.addSubview(blurEffectView)
        blurEffectView.contentView.addSubview(arrowImage)
    }

    func setArrowImageConstraints() {
        arrowImage.translatesAutoresizingMaskIntoConstraints = false
        arrowImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        arrowImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        arrowImage.widthAnchor.constraint(equalToConstant: 36.0).isActive = true
        arrowImage.heightAnchor.constraint(equalToConstant: 10.13).isActive = true
    }
    
}

extension SearchVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if searchTextField.textColor == UIColor.lightGray {
            searchTextField.text = nil
            searchTextField.textColor = .white
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if searchTextField.text!.isEmpty {
            searchTextField.text = "Choose a city"
            searchTextField.textColor = .lightGray
        }
    }
}
