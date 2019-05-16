//
//  ViewController.swift
//  Day10-VideoBackground
//
//  Created by 王林 on 2019/5/16.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class ViewController: VideoSplashViewController {

    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signupButton: UIButton!
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 4
        signupButton.layer.cornerRadius = 4
        
        
        setupVideoBackground()
    }

    func setupVideoBackground() {
        
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        
        videoFrame = view.frame
        fillMode = .resizeAspectFill
        alwaysRepeat = true
        sound = true
        startTime = 2.0
        alpha = 0.8
        
        contentURL = url
        // view.isUserInteractionEnabled = false
        
    }
}

