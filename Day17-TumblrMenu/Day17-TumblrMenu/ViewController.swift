//
//  ViewController.swift
//  Day17-TumblrMenu
//
//  Created by 王林 on 2019/6/9.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class ViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
    }


    @IBAction func unwindToMainViewController (_ sender: UIStoryboardSegue){
        self.dismiss(animated: true, completion: nil)
    }
}

