//
//  DisplayOutfitViewController.swift
//  Drezzi
//
//  Created by Isaac Albets Ramonet on 20/02/16.
//  Copyright © 2016 sfama. All rights reserved.
//

import UIKit

class DisplayOutfitViewController: UITableViewCell {
    @IBOutlet weak var electedOutfit: UILabel!
    @IBOutlet weak var outfitImage: UIImageView!
    @IBOutlet weak var calendarEventName: UILabel!

    @IBOutlet weak var calendarEventHour: UILabel!
    @IBOutlet weak var calendarEventLocation: UILabel!
    @IBOutlet weak var forecastLabel: UILabel!
    @IBOutlet weak var yahooForecast: UIImageView!
}
