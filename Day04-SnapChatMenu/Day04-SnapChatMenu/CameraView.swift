//
//  CameraView.swift
//  Day04-SnapChatMenu
//
//  Created by 王林 on 2019/5/8.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit
import AVFoundation
class CameraView: UIViewController {

    @IBOutlet weak var tempImageView: UIImageView!
    @IBOutlet weak var cameraView: UIView!
    
    var captureSession: AVCaptureSession?
    var stillImageOutput : AVCaptureStillImageOutput?
    var previewLayer: AVCaptureVideoPreviewLayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        captureSession = AVCaptureSession()
        captureSession?.sessionPreset = AVCaptureSession.Preset.hd1920x1080
        let backCamera = AVCaptureDevice.devices(for: .video).first!
        
        var error: NSError?
        var input: AVCaptureDeviceInput!
        
        do{
            input = try AVCaptureDeviceInput(device: backCamera)
        }catch let e as NSError {
            error = e
            input = nil
        }
        
        if(error == nil && captureSession?.canAddInput(input) != nil) {
            captureSession?.addInput(input)
            
            stillImageOutput = AVCaptureStillImageOutput()
            stillImageOutput?.outputSettings = [AVVideoCodecKey : AVVideoCodecJPEG]
            
            if let stillImageOutputTemp = stillImageOutput {
                if captureSession?.canAddOutput(stillImageOutputTemp) != nil {
                    captureSession?.addOutput(stillImageOutputTemp)
                    if let captureSessionTemp = captureSession {
                        previewLayer = AVCaptureVideoPreviewLayer(session: captureSessionTemp)
                        previewLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
                        // 已经废弃不用了
                        // previewLayer?.videoGravity = AVLayerVideoGravityResizeAspect
                        previewLayer?.connection?.videoOrientation = AVCaptureVideoOrientation.portrait
                        cameraView.layer.addSublayer(previewLayer!)
                        captureSession?.startRunning()
                    }
                }
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        previewLayer?.frame = cameraView.bounds
    }    
    
    func didPressTakePhoto(){
        
        if let videoConnection = stillImageOutput?.connection(with: .video){
            videoConnection.videoOrientation = AVCaptureVideoOrientation.portrait
            stillImageOutput?.captureStillImageAsynchronously(from: videoConnection, completionHandler: {
                (sampleBuffer, error) in
                
                if sampleBuffer != nil {
                    
                    
                    let imageData = AVCaptureStillImageOutput.jpegStillImageNSDataRepresentation(sampleBuffer!)
                    let dataProvider  = CGDataProvider(data: imageData! as CFData)
                    let cgImageRef = CGImage(jpegDataProviderSource: dataProvider!, decode: nil, shouldInterpolate: true, intent: CGColorRenderingIntent.defaultIntent)
                    
                    let image = UIImage(cgImage: cgImageRef!, scale: 1.0, orientation: .right)
                    
                    self.tempImageView.image = image
                    self.tempImageView.isHidden = false
                    
                }
                
                
            })
        }
        
        
    }
    
    
    var didTakePhoto = Bool()
    
    func didPressTakeAnother(){
        if didTakePhoto == true{
            tempImageView.isHidden = true
            didTakePhoto = false
            
        }
        else{
            captureSession?.startRunning()
            didTakePhoto = true
            didPressTakePhoto()
            
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        didPressTakeAnother()
    }
}
