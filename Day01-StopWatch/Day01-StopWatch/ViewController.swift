//
//  ViewController.swift
//  Day01-StopWatch
//
//  Created by 王林 on 2019/5/6.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resetBtn: UIButton!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var pauseBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
    var counter: Float = 0.0 {
        didSet {
            timeLbl.text = String(format: "%.1f", counter);
        }
    }
    
    var timer: Timer? = Timer()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counter = 0.0
        
        resetBtn.addTarget(self, action: #selector(resetButtonDidTouch), for: UIControl.Event.touchUpInside);
        pauseBtn.addTarget(self, action: #selector(pauseButtonDidTouch), for: UIControl.Event.touchUpInside);
        playBtn.addTarget(self, action: #selector(playButtonDidTouch), for: UIControl.Event.touchUpInside);
    }

    @objc func resetButtonDidTouch() {
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        timer = nil
        counter = 0
        playBtn.isEnabled = true
        pauseBtn.isEnabled = true
    }
    
    @objc func pauseButtonDidTouch() {
        playBtn.isEnabled = true
        pauseBtn.isEnabled = false
        
        if let timerTemp = timer {
            timerTemp.invalidate()
        }
        
        timer = nil
    }
    
    @objc func playButtonDidTouch() {
        playBtn.isEnabled = false
        pauseBtn.isEnabled = true
        
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)        
    }

    @objc func updateTimer() {
        counter = counter + 0.1
    }
}

