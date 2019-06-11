//
//  AnimationCellModel.swift
//  Day20-CollectionViewAnimation
//
//  Created by 王林 on 2019/6/11.
//  Copyright © 2019 王林. All rights reserved.
//

import Foundation

struct AnimationCellModel {
    let imagePath: String
    
    init(imagePath: String?) {
        self.imagePath = imagePath ?? ""
    }
}
