//
//  SearchVC.swift
//  TableTest1
//
//  Created by Tim Manu on 1/24/20.
//  Copyright © 2020 Tim Manu. All rights reserved.
//

import UIKit

class SearchVC: UIViewController {
    
    var viewTranslation = CGPoint(x: 0, y: 0)
    
    var dismissButtn: UIButton = {
        //let db = UIButton(style: .plain, target: self, action: #selector(handleButton))
        let db = UIButton(type: .system)
        db.setTitle("dismiss", for: .normal)
        db.translatesAutoresizingMaskIntoConstraints = false
        db.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        return db
    }()

    @objc func handleButton() {
        //self.dismiss(animated: true, completion: nil)
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.view.frame = CGRect(x: 0, y: 0 - UIScreen.main.bounds.height, width: self.view.frame.width, height: self.view.frame.height)
        }, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dismissButtn.frame = CGRect(x: 100, y: 100, width: 100, height: 100)
        
        
        
        setupSearchVC()
        view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(handleDismiss)))
        ///blurEffectView.contentView.addSubview(textView)

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
        case .changed:
            if touchPoint.y - viewTranslation.y < 0 {
                view.frame = CGRect(x: 0, y: touchPoint.y - viewTranslation.y + offsetStartPointY, width: view.frame.width, height: view.frame.height)
                print("Touch point: ", touchPoint.y)
                print("View Translation: ", viewTranslation.y)
                print("Both: ", touchPoint.y - viewTranslation.y)
            }
        case .ended:
            if touchPoint.y - viewTranslation.y > -100 {
                dismiss(animated: false, completion: nil)
                //view.frame = CGRect(x: 0, y: offsetStartPointY, width: view.frame.width, height: view.frame.height)
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.frame = CGRect(x: 0, y: offsetStartPointY, width: self.view.frame.width, height: self.view.frame.height)
                }, completion: nil)
            } else {
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    self.view.frame = CGRect(x: 0, y: 0 - self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height)
                    //self.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
                }, completion: nil)
            }
            
        default:
            break
        }
//        switch sender.state {
//        case .changed:
//            viewTranslation = sender.translation(in: view)
//            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//                self.view.transform = CGAffineTransform(translationX: 0, y: self.viewTranslation.y)
//            }, completion: nil)
//        case .ended:
//            if viewTranslation.y > 200 {
//                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
//                    //self.view.transform = .identity
//                    self.view.frame = CGRect(x: 0, y: 0 - UIScreen.main.bounds.height, width: self.view.frame.width, height: self.view.frame.height)
//                }, completion: nil)
//            } else {
////
////                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
////                    self.view.frame = CGRect(x: 0, y: 0 - UIScreen.main.bounds.height, width: self.view.frame.width, height: self.view.frame.height)
////                }, completion: nil)
////                //dismiss(animated: false, completion: nil)
//            }
//        default:
//            break
//        }
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
        
        blurEffectView.contentView.addSubview(dismissButtn)
        
        view.addSubview(blurEffectView)
    }
}
