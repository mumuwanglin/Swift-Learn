//
//  SplasViewController.swift
//  Day12-LoginAnimation
//
//  Created by 王林 on 2019/5/23.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class SplasViewController: UIViewController {

    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        signupButton.layer.cornerRadius = 5
        loginButton.layer.cornerRadius = 5
    }
    

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}
