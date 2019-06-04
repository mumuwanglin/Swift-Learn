//
//  NewsTableViewCell.swift
//  Day16-SlideMenu
//
//  Created by 王林 on 2019/6/4.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var postImageView:UIImageView!
    @IBOutlet weak var postTitle:UILabel!
    @IBOutlet weak var postAuthor:UILabel!
    @IBOutlet weak var authorImageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        authorImageView.layer.cornerRadius = authorImageView.frame.width / 2
        authorImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
