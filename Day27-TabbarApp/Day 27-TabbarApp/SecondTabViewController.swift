//
//  SecondTabViewController.swift
//  Day 27-TabbarApp
//
//  Created by 王林 on 2019/6/25.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class SecondTabViewController: UIViewController {

    @IBOutlet weak var exploreImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        resetViewTransform()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.5, delay: 0.1, usingSpringWithDamping: 0.7, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.exploreImageView.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.exploreImageView.alpha = 1
            
        }, completion: nil )
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        resetViewTransform()
    }
    
    // MARK:
    func resetViewTransform() {
        self.exploreImageView.alpha = 0
        self.exploreImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
    }

}
