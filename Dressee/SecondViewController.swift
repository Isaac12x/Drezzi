//
//  SecondViewController.swift
//  Dressee
//
//  Created by Isaac Albets Ramonet on 20/02/16.
//  Copyright © 2016 sfama. All rights reserved.
//

import UIKit

class SecondViewController: UICollectionViewController {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    
    
    var images: [TodayOutfit]!
    
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
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    // Populate your custom cell with data from the data storage
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("OutfitCell", forIndexPath: indexPath) as! OutfitCollectionViewController
        let image = images[indexPath.item]
        cell.outfits?.image = image.Picture
        
        return cell
    }
    
    // Instructions to segue when pressing down into any cell
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let collectionVC = storyboard!.instantiateViewControllerWithIdentifier("FirstViewController") as! FirstViewController
        collectionVC.todaysOutfit = images[indexPath.item]
        
        navigationController!.pushViewController(collectionVC, animated: true)
        
    }

}

