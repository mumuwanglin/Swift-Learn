//
//  ViewController.swift
//  Day12-LoginAnimation
//
//  Created by 王林 on 2019/5/22.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var uesernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var centerAlignUsername: NSLayoutConstraint!
    @IBOutlet weak var centerAlignPassword: NSLayoutConstraint!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uesernameTextField.layer.cornerRadius = 5
        passwordTextField.layer.cornerRadius = 5
        uesernameTextField.delegate = self
        passwordTextField.delegate = self
        loginButton.layer.cornerRadius = 5
    }


    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        centerAlignUsername.constant -= view.bounds.width
        centerAlignPassword.constant -= view.bounds.width
        loginButton.alpha = 0
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.00, options: .curveEaseOut, animations: {
            
            self.centerAlignUsername.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.10, options: .curveEaseOut, animations: {
            
            self.centerAlignPassword.constant += self.view.bounds.width
            self.view.layoutIfNeeded()
            
        }, completion: nil)
        
        UIView.animate(withDuration: 0.5, delay: 0.20, options: .curveEaseOut, animations: {
            
            self.loginButton.alpha = 1
            
        }, completion: nil)
    }
    
    @IBAction func loginButtonDidTouch(_ sender: UIButton) {
        let bounds = self.loginButton.bounds
        
        UIView.animate(withDuration: 1.0, delay: 0.0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: UIView.AnimationOptions.curveLinear, animations: {
            self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
            self.loginButton.isEnabled = false
        }) { (finished) in
            UIView.animate(withDuration: 0.5, animations: {
                self.loginButton.bounds = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height)
                self.loginButton.isEnabled = true
            })
        }
    }
}


extension ViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}
