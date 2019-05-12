//
//  VideoCell.swift
//  Day03-PlayLocalVideo
//
//  Created by 王林 on 2019/5/7.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

// 定义Video的结构体，属性初始化后不能被改变，因为结构体时值类型。
// 在你每次定义一个新类或者结构体的时候，实际上你是定义了一个新的 Swift 类型。
// 因此请使用UpperCamelCase这种方式来命名
struct Video {
    let image: String
    let title: String
    let source: String
}

class VideoCell: UITableViewCell {
    
    @IBOutlet weak var videoScreenshot: UIImageView!
    @IBOutlet weak var videoTitleLabel: UILabel!
    @IBOutlet weak var videoSourceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}