//
//  MapViewController.swift
//  Dressee
//
//  Created by Isaac Albets Ramonet on 21/02/16.
//  Copyright © 2016 sfama. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    let manager = CLLocationManager()
    
    // MARK: - App Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
    
        let logo = UIImage(named: "Logo")
        self.navigationItem.titleView = UIImageView(image: logo)
        
        
      //  self.startUpdatingLocation(manager, didChangeAutorizationStatus: CLAuthorizationStatus)
    }
    
    func startUpdatingLocation(manager: CLLocationManager,didChangeAutorizationStatus status: CLAuthorizationStatus){
        if status == .AuthorizedAlways{
        //    manager.startRangingBeaconsInRegion(CLBeaconRegion)
            manager.delegate = self
            manager.requestAlwaysAuthorization()
            manager.desiredAccuracy = kCLLocationAccuracyBest
            manager.startUpdatingLocation()
        } else {
            SweetAlert().showAlert("We're sad", subTitle: "We wouldn't show your personalized offers", style: AlertStyle.None)

        }
        
    }

    
    // MARK: MapViewDelegate
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
        let reuseId = "pin"
        var pinView = mapView.dequeueReusableAnnotationViewWithIdentifier(reuseId) as? MKPinAnnotationView
        
        if pinView == nil{
            pinView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
            pinView!.canShowCallout = true
            pinView!.pinTintColor = UIColor.blueColor()
            pinView!.rightCalloutAccessoryView = UIButton(type: .DetailDisclosure)
        } else {
            pinView!.annotation = annotation
        }
        return pinView
    }
    
    func mapView(mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl){
        if control == view.rightCalloutAccessoryView{
            let app = UIApplication.sharedApplication()
            if let followLink = view.annotation?.subtitle! {
                app.openURL(NSURL(string: followLink)!)
            }
        }
    }

    
}
