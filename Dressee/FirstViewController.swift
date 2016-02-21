//
//  FirstViewController.swift
//  Dressee
//
//  Created by Isaac Albets Ramonet on 20/02/16.
//  Copyright © 2016 sfama. All rights reserved.
//

import Foundation
import UIKit
import EventKit

class FirstViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var displayOutfit: UIView!
    @IBOutlet weak var needPermissionView: UIView!
    @IBOutlet weak var calendarsTableView: UITableView!
    
    
    var todaysOutfit: TodayOutfit? = nil
    let eventStore = EKEventStore()
    
    var calendars: [EKCalendar]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.createYourOutfit.layer.cornerRadius = 10.0
//        
//        if (todaysOutfit != nil){
//            createYourOutfit.hidden = true
//            perfectOutFitCreator.hidden = true
//        } else{
//            createYourOutfit.hidden = false
//            perfectOutFitCreator.hidden = false
//        }
        
        checkCalendarAuthorizationStatus()
        needPermissionView.hidden = true
        
    }


    @IBAction func createNewOutlet(sender: AnyObject){
        SweetAlert().showAlert("Good job!", subTitle: "Let's Build Your Closet", style: AlertStyle.Success)

        let controller = self.storyboard!.instantiateViewControllerWithIdentifier("ThirdViewController") as! ThirdViewController
        presentViewController(controller, animated: true, completion: nil)
    }

    
    func checkCalendarAuthorizationStatus() {
        let status = EKEventStore.authorizationStatusForEntityType(EKEntityType.Event)
        
        switch (status) {
        case EKAuthorizationStatus.NotDetermined:
            // This happens on first-run
            requestAccessToCalendar()
        case EKAuthorizationStatus.Authorized:
            // Things are in line with being able to show the calendars in the table view
            loadCalendars()
            refreshTableView()
        case EKAuthorizationStatus.Restricted, EKAuthorizationStatus.Denied:
            // We need to help them give us permission
            SweetAlert().showAlert("You don't garanted Access to Calendar", subTitle: "You file will permanently delete!", style: AlertStyle.Warning, buttonTitle:"Dismiss")
            self.needPermissionView.hidden = false
            self.needPermissionView.fadeIn()

        }
    }
    
    func requestAccessToCalendar() {
        eventStore.requestAccessToEntityType(EKEntityType.Event, completion: {
            (accessGranted: Bool, error: NSError?) in
            
            if accessGranted == true {
                dispatch_async(dispatch_get_main_queue(), {
                    self.loadCalendars()
                    self.refreshTableView()
                })
            } else {
                dispatch_async(dispatch_get_main_queue(), {
                    self.needPermissionView.hidden = false
                    self.needPermissionView.fadeIn()
                })
            }
        })
    }
    
    func loadCalendars() {
        self.calendars = eventStore.calendarsForEntityType(EKEntityType.Event)
    }
    func refreshTableView() {
        calendarsTableView.hidden = false
        calendarsTableView.reloadData()
    }
    
    /* Helper: alert display function */
    func alertOnFailure(title: String!, message: String!){
        let openSettingsUrl = NSURL(string: UIApplicationOpenSettingsURLString)
        UIApplication.sharedApplication().openURL(openSettingsUrl!)
        dispatch_async(dispatch_get_main_queue()){
            let controller = UIAlertController(title: title, message: message, preferredStyle: .Alert)
            controller.addAction(UIAlertAction(title: "\(openSettingsUrl)", style: .Default, handler: nil))
            self.presentViewController(controller, animated: true, completion: nil)
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let calendars = self.calendars {
            return calendars.count
        }
        
        return 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("basicCell")!
        
        if let calendars = self.calendars {
            let calendarName = calendars[indexPath.row].title
            cell.textLabel?.text = calendarName
        } else {
            cell.textLabel?.text = "Unknown Calendar Name"
        }
        
        return cell
    }
}

