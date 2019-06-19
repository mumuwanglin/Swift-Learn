//
//  ViewController.swift
//  Day23-SlideOutMenu
//
//  Created by 王林 on 2019/6/19.
//  Copyright © 2019 王林. All rights reserved.
//

import Foundation

class ReadLater : UIViewController {
    
    override func viewDidLoad() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
}
