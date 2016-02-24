//
//  SecondViewController.swift
//  Dressee
//
//  Created by Isaac Albets Ramonet on 20/02/16.
//  Copyright © 2016 sfama. All rights reserved.
//

import UIKit
import ALCameraViewController


class SecondViewController: UIViewController, UINavigationControllerDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    var images: [TodayOutfit]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
      // Instructions to segue when pressing down into any cell
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // SELECT IMAGE FOR THE OUTFIT TODAY
        
    }
    
    @IBAction func createOutfit(sender: AnyObject){
        view.endEditing(true)
        SweetAlert().showAlert("Good job!", subTitle: "Let's Build Your Closet", style: AlertStyle.Success)
        
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
        let facebookButton = UIAlertAction(title: "Grab From Facebook", style: .Default) { (alert) -> Void in
            let url = "https://www.facebook.com"
            
        }
        imagePickerActionSheet.addAction(facebookButton)
        
        // MARK: Add Instagram
        let instagramButton = UIAlertAction(title: "Grab From Instagram", style: .Default){ (alert) -> Void in
            let url = "https://www.instagram.com"

        }
        imagePickerActionSheet.addAction(instagramButton)
        
        // MARK: Add Pinterest
        let pinterestButton = UIAlertAction(title: "Grab From Pinterest", style: .Default){ (alert) -> Void in
            let url = "https://www.pinterest.com"

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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "AlertAction"){
            let navVC = segue.destinationViewController as! WebViewController
            
        }
    }
    
    func scaleImage(image: UIImage, maxDimension: CGFloat) -> UIImage {
        
        var scaledSize = CGSizeMake(maxDimension, maxDimension)
        var scaleFactor:CGFloat
        
        if image.size.width > image.size.height {
            scaleFactor = image.size.height / image.size.width
            scaledSize.width = maxDimension
            scaledSize.height = scaledSize.width * scaleFactor
        } else {
            scaleFactor = image.size.width / image.size.height
            scaledSize.height = maxDimension
            scaledSize.width = scaledSize.height * scaleFactor
        }
        
        UIGraphicsBeginImageContext(scaledSize)
        image.drawInRect(CGRectMake(0, 0, scaledSize.width, scaledSize.height))
        let scaledImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return scaledImage
    }

}

extension SecondViewController: UIImagePickerControllerDelegate {
    func imagePickerController(picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String : AnyObject]) {
            let selectedPhoto = info[UIImagePickerControllerOriginalImage] as! UIImage
            let scaledImage = scaleImage(selectedPhoto, maxDimension: 140)
    }
}

