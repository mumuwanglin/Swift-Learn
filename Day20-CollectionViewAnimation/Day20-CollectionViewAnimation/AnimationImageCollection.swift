//
//  AnimationImageCollection.swift
//  Day20-CollectionViewAnimation
//
//  Created by 王林 on 2019/6/11.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

struct AnimationImageCollection {
    private let imagePaths = ["1", "2", "3", "4", "5"]
    var images: [AnimationCellModel]
    
    init() {
        images = imagePaths.map { AnimationCellModel(imagePath: $0) }
    }
}
