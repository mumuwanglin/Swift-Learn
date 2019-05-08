//
//  ViewController.swift
//  Day04-SnapChatMenu
//
//  Created by 王林 on 2019/5/8.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let leftView: LeftView = LeftView(nibName: "LeftView", bundle: nil)
        let cameraView: CameraView = CameraView(nibName: "CameraView", bundle: nil)
        let rightView: RightView = RightView(nibName: "RightView", bundle: nil)

        let leftSubView: UIView! = leftView.view
        let cameraSubView: UIView! = cameraView.view
        let rightSubView: UIView! = rightView.view
        
        leftSubView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        cameraSubView.frame = CGRect(x: screenWidth, y: 0, width: screenWidth, height: screenHeight)
        rightSubView.frame = CGRect(x: 2 * screenWidth, y: 0, width: screenWidth, height: screenHeight)
        
        self.scrollView.addSubview(leftSubView)
        self.scrollView.addSubview(rightSubView)
        self.scrollView.addSubview(cameraSubView)
        
        self.scrollView.contentSize = CGSize(width: screenWidth * 3, height: screenHeight)
    }


    override var prefersStatusBarHidden: Bool {
        return true
    }
     
}

