//
//  ThirdViewController.swift
//  Dressee
//
//  Created by Isaac Albets Ramonet on 20/02/16.
//  Copyright © 2016 sfama. All rights reserved.
//

import UIKit
import ALCameraViewController

class ThirdViewController: UIViewController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func createOutfit(sender: AnyObject){
        view.endEditing(true)
        
        let imagePickerActionSheet = UIAlertController(title: "Add ",
            message: nil, preferredStyle: .ActionSheet)
        
        // MARK: Add the cool camera
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            let cameraButton = UIAlertAction(title: "Take Photo",
                style: .Default) { (alert) -> Void in
                    
                    let croppingEnabled = true
                    let cameraViewController = ALCameraViewController(croppingEnabled: croppingEnabled) { image in
                        let imagePicker = UIImagePickerController()
                        imagePicker.delegate = self
                        imagePicker.sourceType = .Camera
                        self.presentViewController(imagePicker, animated: true, completion: nil)
                    }
                    
            }
            imagePickerActionSheet.addAction(cameraButton)
        }
        
        // MARK: Add Pick images from camera roll
        let libraryButton = UIAlertAction(title: "Camera Roll",
            style: .Default) { (alert) -> Void in
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(imagePicker,
                    animated: true,
                    completion: nil)
        }
        imagePickerActionSheet.addAction(libraryButton)
        
        // MARK: Add Facebook
        let facebookButton = UIAlertAction(title: "Grab From Facebook", style: .Default){ (alert) -> Void in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker,
                animated: true,
                completion: nil)
        }
        imagePickerActionSheet.addAction(facebookButton)
        
        // MARK: Add Instagram
        let instagramButton = UIAlertAction(title: "Grab From Instagram", style: .Default){ (alert) -> Void in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker,
                animated: true,
                completion: nil)
        }
        imagePickerActionSheet.addAction(instagramButton)
        
        // MARK: Add Pinterest
        let pinterestButton = UIAlertAction(title: "Grab From Pinterest", style: .Default){ (alert) -> Void in
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .PhotoLibrary
            self.presentViewController(imagePicker,
                animated: true,
                completion: nil)
        }
        imagePickerActionSheet.addAction(pinterestButton)
        
        let cancelButton = UIAlertAction(title: "Cancel",
            style: .Cancel) { (alert) -> Void in
        }
        imagePickerActionSheet.addAction(cancelButton)
        // 6
        presentViewController(imagePickerActionSheet, animated: true,
            completion: nil)
    }

    
    
}