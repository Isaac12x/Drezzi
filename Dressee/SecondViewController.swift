//
//  SecondViewController.swift
//  Dressee
//
//  Created by Isaac Albets Ramonet on 20/02/16.
//  Copyright © 2016 sfama. All rights reserved.
//

import UIKit
import ALCameraViewController


class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UINavigationControllerDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    var images: [TodayOutfit]!
    
    var image = [UIImage(named: "image1.jpg"),
        UIImage(named: "image2.jpg"),
        UIImage(named: "image3.jpg"),
        UIImage(named: "image4.jpg"),
        UIImage(named: "image5.jpg"),
        UIImage(named: "image6.jpg"),
        UIImage(named: "image7.jpg"),
        UIImage(named: "image8.jpg"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let logo = UIImage(named: "Logo")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        // Do any additional setup after loading the view, typically from a nib.
        let space: CGFloat = 3.0
        let interSpace: CGFloat = 2.0
        let layoutWidth = (view.frame.size.width - (2 * space)) / 2.0
        let layoutHeight = (view.frame.size.height - (4 * space)) / 2.0
        
        // Flow layout interface spacing
        flowLayout.minimumInteritemSpacing = interSpace
        flowLayout.minimumLineSpacing = interSpace
        
        // Create item size depending on Meme View  - depending on screen
        flowLayout.itemSize = CGSizeMake(layoutWidth, layoutHeight)
        
    }
    
    // Reload data in the collectionView
    override func viewWillAppear(animated: Bool) {
        collectionView!.reloadData()
    }
    // REQUIRED FUNCTIONS FOR COLLECTIONVIEW IMPLEMENTATION
    
    // Count the number of cells
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return image.count
    }
    
    // Populate your custom cell with data from the data storage
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("OutfitCell", forIndexPath: indexPath) as! OutfitCollectionViewController
        let img = image[indexPath.item]
        cell.outfits?.image = img
        
        return cell
    }
    
    // Instructions to segue when pressing down into any cell
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // SELECT IMAGE FOR THE OUTFIT TODAY
        
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
        let facebookButton = UIAlertAction(title: "Grab From Facebook", style: .Default){
            let url = "https://www.facebook.com"
        }
        imagePickerActionSheet.addAction(facebookButton)
        
        // MARK: Add Instagram
        let instagramButton = UIAlertAction(title: "Grab From Instagram", style: .Default){ (alert) -> Void in
            
        }
        imagePickerActionSheet.addAction(instagramButton)
        
        // MARK: Add Pinterest
        let pinterestButton = UIAlertAction(title: "Grab From Pinterest", style: .Default){ (alert) -> Void in
            
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

