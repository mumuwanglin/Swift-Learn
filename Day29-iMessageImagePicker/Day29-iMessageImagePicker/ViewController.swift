//
//  ViewController.swift
//  Day29-iMessageImagePicker
//
//  Created by 王林 on 2019/6/27.
//  Copyright © 2019 王林. All rights reserved.
//

import UIKit
import Photos
class ViewController: UIViewController {

    @IBOutlet weak var userProfileImageView: UIImageView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var containerView: UIView!
    
    private var profileImage: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        usernameTextField.becomeFirstResponder()
        
        userProfileImageView.layer.cornerRadius = userProfileImageView.bounds.width / 2
        userProfileImageView.layer.masksToBounds = true
    }

    @IBAction func pickProfileImage(_ tap: UITapGestureRecognizer) {
        let authorization = PHPhotoLibrary.authorizationStatus()
        
        if authorization == .notDetermined {
            PHPhotoLibrary.requestAuthorization { _ in
                DispatchQueue.main.async {
                    self.pickProfileImage(tap)
                }
            }
        }
        
        if authorization == .authorized {
            let controller = ImagePickerSheetController()
            controller.addAction(action: ImageAction(title: NSLocalizedString("Take Photo or Video", comment: "Action Title"), secondaryTitle: NSLocalizedString("Use this one", comment: "Action Title"), handler: { _ in
                self.presentCamera()
            }, secondaryHandler: { (action, numberOfPhotos) in
                controller.getSelectedImagesWithCompletion(completion: { images in
                    self.profileImage = images[0]
                    self.userProfileImageView.image = self.profileImage
                })
            }))
            
            controller.addAction(action: ImageAction(title: NSLocalizedString("Cancel", comment: "Action Title"), style: .Cancel, handler: nil, secondaryHandler: nil))
            
            self.present(controller, animated: true, completion: nil)
        }
        
        
    }
    
    func presentCamera()
    {
        print("拍照")
    }

}

