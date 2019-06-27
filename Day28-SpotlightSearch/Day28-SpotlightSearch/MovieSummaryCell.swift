//
//  MovieSummaryCell.swift
//  Day28-SpotlightSearch
//
//  Created by 王林 on 2019/6/27.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class MovieSummaryCell: UITableViewCell {

    @IBOutlet weak var imgMovieImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        lblRating.layer.cornerRadius = lblRating.frame.size.width/2
        lblRating.layer.masksToBounds = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
