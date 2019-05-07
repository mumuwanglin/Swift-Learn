//
//  ViewController.swift
//  Day02-CustomFont
//
//  Created by 王林 on 2019/5/7.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    static let identifier = "FontCell"
    
    @IBOutlet weak var changeFontLabel: UILabel!
    @IBOutlet weak var fontTableView: UITableView!
    
    var data = ["30 Days Swift", "这些字体特别适合打「奋斗」和「理想」",
                "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体",
                "呵呵，再见🤗 See you next Project", "微博 @Allen朝辉",
                "测试测试测试测试测试测试", "123", "Alex", "@@@@@@"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular",
                     "MFJinHei_Noncommercial-Regular",
                     "MFZhiHei_Noncommercial-Regular",
                     "Zapfino",
                     "Gaspar Regular"]
    
    var fontRowIndex = 0
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @objc func changeFontDidTouch(_ sender: AnyObject) {
        fontRowIndex = (fontRowIndex + 1) % 5
        print(fontNames[fontRowIndex])
        fontTableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeFontLabel.layer.cornerRadius = 50
        changeFontLabel.layer.masksToBounds = true
        changeFontLabel.isUserInteractionEnabled = true
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(changeFontDidTouch(_:)))
        
        changeFontLabel.addGestureRecognizer(gesture)
    }

    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = fontTableView.dequeueReusableCell(withIdentifier: ViewController.identifier, for: indexPath)
        let text = data[indexPath.row]
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.font = UIFont(name: self.fontNames[fontRowIndex], size: 16)
        
        return cell
    }
}

