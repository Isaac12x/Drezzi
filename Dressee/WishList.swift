//
//  File.swift
//  Dressee
//
//  Created by Isaac Albets Ramonet on 21/02/16.
//  Copyright © 2016 sfama. All rights reserved.
//

import UIKit

class WishList: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    @IBOutlet weak var takePhoto: UIButton!
    @IBOutlet weak var displayInstruction: UILabel!
    
    var images: [WishListPictures] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        let space: CGFloat = 3.0
        let interSpace: CGFloat = 2.0
        let layoutWidth = (view.frame.size.width - (2 * space)) / 2.0
        let layoutHeight = (view.frame.size.height - (2 * space)) / 3.0
        
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
        return images.count
    }
    
    // Populate your custom cell with data from the data storage
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("WishListCell", forIndexPath: indexPath) as! WishListCollectionViewController
        let image = images[indexPath.item]
        cell.wishListImage?.image = image.wishListPicture
        
        return cell
    }
    
    // Instructions to segue when pressing down into any cell
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        //mapView with beacons arround
        
        let controller = self.storyboard!.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
        self.presentViewController(controller, animated: true, completion: nil)
        
    }

    
}