//
//  ViewController.swift
//  ProjectManagement
//
//  Created by 1 0 1 1  on 27/5/24.
//

import UIKit
import Toast_Swift
import FirebaseAuth
class ViewController: UIViewController {

    @IBOutlet weak var lbForgetPass: UILabel!
    @IBOutlet weak var btnRegister: UIButton!
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var tfPassword: UITextField!
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var lbLogin: UILabel!
    @IBOutlet weak var viewBG: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackGround()
        tapOnForgetPass()
    }
    
    func setupBackGround(){
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = [#colorLiteral(red: 0, green: 0.5725490196, blue: 0.2705882353, alpha: 1).cgColor, UIColor(red: 191/255, green: 246/255, blue: 195/255, alpha: 0).cgColor]
        gradientLayer.shouldRasterize = true
        viewBG.layer.addSublayer(gradientLayer)
    }

    @IBAction func tapOnNext(_ sender: Any) {
        if tfEmail.text == ""{
            self.view.makeToast("Please input your email!")
            return
        }
        if tfPassword.text == ""{
            self.view.makeToast("Please input your password!")
            return
        }
        // luu thong tin len fbAuth
        Auth.auth().signIn(withEmail: tfEmail.text!, password: tfPassword.text!) { result, error in
            if error != nil {
                self.view.makeToast(error?.localizedDescription)
            }else{
                // Hien qua man hinh home
                self.lbLogin.text = "Ok"
            }
        }
    }
    
    func tapOnForgetPass(){
        let tapOnForget = UITapGestureRecognizer(target: self, action: #selector(tapOnForget))
        lbForgetPass.isUserInteractionEnabled = true
        lbForgetPass.addGestureRecognizer(tapOnForget)
    }
    @objc func tapOnForget(){
        lbLogin.text = "Tap On"
    }
    
}

