//
//  ScaleViewController.swift
//  Day25-BasicAnimation
//
//  Created by 王林 on 2019/6/23.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class ScaleViewController: UIViewController {

    @IBOutlet weak var scaleImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.scaleImageView.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.scaleImageView.transform = CGAffineTransform(scaleX: 2, y: 2)
            self.scaleImageView.alpha = 1
            
        }, completion: nil )
    }

}
