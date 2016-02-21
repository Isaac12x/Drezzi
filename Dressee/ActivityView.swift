//
//  ActivityView.swift
//  Dressee
//
//  Created by Isaac Albets Ramonet on 20/02/16.
//  Copyright © 2016 sfama. All rights reserved.
//

import UIKit
import ALCameraViewController

class ActivityView {

    func activityViewController(activityViewController: UIActivityViewController, itemForActivityType activityType: String) -> AnyObject? {
        
        
    }
    
    
    func pickImage(argument: UIImagePickerControllerSourceType) {
        let pickImage = UIImagePickerController()
        pickImage.delegate = self
        pickImage.sourceType = argument
        presentViewController(pickImage, animated: true, completion: nil)
    }
    
    let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
    self.presentViewController(controller, animated: true, completion: nil)
    
    // Display the image in the imageView
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            imageViewController.image = image
            if imageViewController != nil {
                actionButton.enabled = true
            } else {
                actionButton.enabled = false
            }
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            func imagePickerControllerDidCancel(picker: UIImagePickerController) {
                dismissViewControllerAnimated(true, completion: nil)
            }
        }
        
    }
    
    let controller = UIImagePickerController()
    self.presentViewController(controller, animated: true, completion: nil)
    
    let croppingEnabled = true
    let cameraViewController = ALCameraViewController(croppingEnabled: croppingEnabled) { image in
        // Do something with your image here.
        // If cropping is enabled this image will be the cropped version
    }
    
    presentViewController(cameraViewController, animated: true, completion: nil)

    
    // MARK: - Shared Instance
    class func sharedInstance() -> ActivityView {
        struct Singleton {
            static var sharedInstance = ActivityView()
        }
        return Singleton.sharedInstance
    }
}
