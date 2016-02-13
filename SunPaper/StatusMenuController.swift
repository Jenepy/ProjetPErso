//
//  StatusMenuController.swift
//  SunPaper
//
//  Created by David Celis on 2/13/16.
//  Copyright © 2016 David Celis. All rights reserved.
//

import Cocoa

class StatusMenuController: NSObject {
    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSVariableStatusItemLength)
    let sunriseSunsetAPI = SunriseSunsetAPI()

    override func awakeFromNib() {
        let icon = NSImage(named: "StatusIcon")
        icon?.template = true // Dark mode support

        statusItem.image = icon
        statusItem.menu = statusMenu
    }

    @IBAction func updateClicked(sender: NSMenuItem) {
        sunriseSunsetAPI.getSunsetAndSunriseTimes(0.0, longitude: 0.0)
    }
    
    @IBAction func quitClicked(sender: NSMenuItem) {
        NSApplication.sharedApplication().terminate(self)
    }
}
