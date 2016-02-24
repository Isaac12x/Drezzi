//
//  WebViewController.swift
//  Dressee
//
//  Created by Isaac Albets Ramonet on 21/02/16.
//  Copyright © 2016 sfama. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var webyView: UIWebView!
    var openAddress: String!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let url = NSURL(string: "\(openAddress)")
        let requestURL = NSURLRequest(URL: url!)
        webyView.loadRequest(requestURL)
    }
}
