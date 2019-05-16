//
//  VideoCutter.swift
//  Day10-VideoBackground
//
//  Created by 王林 on 2019/5/16.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit
import AVFoundation
extension String {
    var covert: NSString {
        return (self as NSString)
    }
}

class VideoCutter: NSObject {

    func cropVideoWithURL(videoURL url: URL, startTime: CGFloat, duration: CGFloat, completion: ((_ videoPath: URL?, _ error: NSError?) -> Void)?) {
        //异步加载
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            let asset = AVURLAsset(url: url, options: nil)
            let exportSession = AVAssetExportSession(asset: asset, presetName: "AVAssetExportPresetHighestQuality")
            
            let paths: NSArray = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
            
            var outputURL = paths.object(at: 0) as! String
            let manager = FileManager.default
            // 异常处理：
            // try?: 将错误转化成可选异常,有错误发生时返回nil
            // try!: 禁用错误传递，当确认无异常发生时使用，否则可能会发生运行时异常
            // defer: 在即将离开当前代码块时执行一系列语句,延迟执行的语句不能包含任何控制转移语句，例如break、return语句，或是抛出一个错误。
            // defer语句是从后往前执行
            do {
                try manager.createDirectory(atPath: outputURL, withIntermediateDirectories: true, attributes: nil)
            }catch _ {}
            
            outputURL = outputURL.covert.appendingPathComponent("output.mp4")
            
            do {
                try manager.removeItem(atPath: outputURL)
            } catch _ {
            }
            
            if let exportSession = exportSession as AVAssetExportSession? {
                let start = CMTimeMakeWithSeconds(Float64(startTime), preferredTimescale: 600)
                let duration = CMTimeMakeWithSeconds(Float64(duration), preferredTimescale: 600)
                let range = CMTimeRangeMake(start: start, duration: duration)
                
                exportSession.outputURL = URL(fileURLWithPath: outputURL)
                exportSession.shouldOptimizeForNetworkUse = true
                exportSession.outputFileType = AVFileType.mp4
                exportSession.timeRange = range
                
                exportSession.exportAsynchronously {
                    switch exportSession.status {
                    case AVAssetExportSessionStatus.completed:
                        completion?(exportSession.outputURL, nil)
                    case AVAssetExportSessionStatus.failed:
                        print("Failed: \(String(describing: exportSession.error))")
                    case AVAssetExportSessionStatus.cancelled:
                        print("Failed: \(String(describing: exportSession.error))")
                    default:
                        print("default case")
                    }
                }
            }
        }
    }
}
