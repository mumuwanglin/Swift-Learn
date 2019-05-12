//
//  InterestCollectionViewCell.swift
//  Day05-CarouselEffect
//
//  Created by 王林 on 2019/5/12.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
 
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    fileprivate func updateUI() {
        interestTitleLabel?.text! = interest.title
        featuredImageView?.image! = interest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
}
