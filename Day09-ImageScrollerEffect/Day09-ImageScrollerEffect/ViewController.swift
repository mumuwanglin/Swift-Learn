//
//  ViewController.swift
//  Day09-ImageScrollerEffect
//
//  Created by 王林 on 2019/5/16.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var imageViewLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }


    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateMinZoomScaleForSize(view.bounds.size)
    }
    
    //计算缩放比例，缩放比例为1表示内容以正常大小显示；缩放比例小于1表示容器内的内容缩小，缩放比例大于1表示放大容器内的内容
    fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
        //要获得最小的缩放比例，首先计算所需的缩放比例，以便根据其宽度在scrollView中紧贴imageView
        let widthScale = size.width / imageView.bounds.width
        let heightScale = size.height / imageView.bounds.height
        
        //选取宽度和高度比例中最小的那个,设置为minimumZoomScale
        let minScale = min(widthScale,heightScale)
        scrollView.minimumZoomScale = minScale
        scrollView.maximumZoomScale = 3.0
        scrollView.zoomScale = minScale
    }
}

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateConstraintsForSize(view.bounds.size)
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        //当手势动作发生时，scrollView告诉控制器要放大或缩小子视图imageView
        return imageView
    }
    
    fileprivate func updateConstraintsForSize (_ size: CGSize) {
        //将图像垂直居中，从视图高度减去imageView的高度并分成两半，这个值用作顶部和底部imageView的约束
        let yOffset = max(0, (size.height - imageView.frame.height) / 2)
        imageViewTopConstraint.constant = yOffset
        imageViewBottomConstraint.constant = yOffset
        
        ////根据宽度计算imageView前后约束的偏移量
        let xOffset = max(0, (size.width - imageView.frame.width) / 2)
        imageViewLeadingConstraint.constant = xOffset
        imageViewTrailingConstraint.constant = xOffset
        
        view.layoutIfNeeded()
    }
    
}
