//
//  FirstViewController.swift
//  Dressee
//
//  Created by Isaac Albets Ramonet on 20/02/16.
//  Copyright © 2016 sfama. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var displayOutfit: UIView!
    @IBOutlet weak var createYourOutfit: UIButton!
    @IBOutlet weak var perfectOutFitCreator: UIButton!
    
    var todaysOutfit: TodayOutfit? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.createYourOutfit.layer.cornerRadius = 10.0
        
        if (todaysOutfit != nil){
            createYourOutfit.hidden = true
            perfectOutFitCreator.hidden = true
        } else{
            createYourOutfit.hidden = false
            perfectOutFitCreator.hidden = false
        }
    }


    @IBAction func createNewOutlet(sender: AnyObject){
        SweetAlert().showAlert("Good job!", subTitle: "Let's Build Your Closet", style: AlertStyle.Success)

        let controller = self.storyboard!.instantiateViewControllerWithIdentifier("ThirdViewController") as! ThirdViewController
        presentViewController(controller, animated: true, completion: nil)
    }

}

