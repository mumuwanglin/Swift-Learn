//
//  OpacityViewController.swift
//  Day25-BasicAnimation
//
//  Created by 王林 on 2019/6/23.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class OpacityViewController: UIViewController {

    @IBOutlet weak var exampleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 2) {
            self.exampleImageView.alpha = 0
        }
    }

}
