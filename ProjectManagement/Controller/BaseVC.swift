//
//  BaseVC.swift
//  ProjectManagement
//
//  Created by 1 0 1 1  on 27/5/24.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func roundCorner(views : [UIView], radius : CGFloat){
        views.forEach{ v in
            v.layer.cornerRadius = radius
            v.layer.masksToBounds = true
        }
    }
    
    func setupBackGround(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0, green: 0.5725490196, blue: 0.2705882353, alpha: 1).cgColor, UIColor(red: 191/255, green: 246/255, blue: 195/255, alpha: 0).cgColor]
        gradientLayer.shouldRasterize = true
        view.layer.addSublayer(gradientLayer)
    }
    func taptoCloseKeyBoard(){
        let tapOn = UITapGestureRecognizer(target: self, action: #selector(tapToClose))
        view.isUserInteractionEnabled = true
        view.addGestureRecognizer(tapOn)
    }
    @objc func tapToClose(){
        view.endEditing(true)
    }
    
}

