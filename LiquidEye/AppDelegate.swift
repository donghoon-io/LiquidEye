//
//  AppDelegate.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/10.
//  Copyright © 2019 isc. All rights reserved.
//

import Cocoa
import SwiftDate
import macOSThemeKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSPopoverDelegate, NSUserNotificationCenterDelegate {
    
    var activity: NSObjectProtocol?
    
    var statusBarItem: NSStatusItem!
    
    let popover = NSPopover()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        
        setFrequency()
        
        NSApp.activate(ignoringOtherApps: true)
        
        activity = ProcessInfo().beginActivity(options: .userInitiatedAllowingIdleSystemSleep, reason: "Intervention")
        
        NSUserNotificationCenter.default.delegate = self
        NotificationCenter.default.addObserver(self, selector: #selector(handleTot), name: Notification.Name("totOpen"), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handlePause), name: Notification.Name("totPause"), object: nil)
        
        
        let preSetInit = UserDefaults.standard.bool(forKey: "preSetInit")
        if !preSetInit {
            UserDefaults.standard.set(true, forKey: "preSetInit")
            preset = Preference()
        }
        
        print(preset)
        
        popover.behavior = .transient
        popover.animates = true
        popover.contentViewController = PreferenceViewController.returnPopupVC()
        
        
        let statusBar = NSStatusBar.system
        statusBarItem = statusBar.statusItem(
            withLength: NSStatusItem.squareLength)
        
        if let button = statusBarItem.button {
            button.image = NSImage(named:NSImage.Name("StatusBarButtonImage"))
            button.action = #selector(togglePopover(_:))
        }
    }
    
    var popupWindowController: NSWindowController?
    
    @objc func handleTot(_ notification: Notification) {
        DispatchQueue.main.async {
            switch preset.interventionSize {
            case 0:
                self.popupWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "FullPopupWindowController") as? NSWindowController
                self.popupWindowController!.showWindow(nil)
                self.popupWindowController!.window?.makeKeyAndOrderFront(nil)
            case 1:
                self.popupWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "MidPopupWindowController") as? NSWindowController
                self.popupWindowController!.showWindow(nil)
                self.popupWindowController!.window?.makeKeyAndOrderFront(nil)
            case 2:
                self.popupWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "SmallPopupWindowController") as? NSWindowController
                self.popupWindowController!.showWindow(nil)
                self.popupWindowController!.window?.makeKeyAndOrderFront(nil)
            default:
                if preset.explanationFrequency == 0 {
                    self.openVC(identifier: "InstructionViewController")
                } else {
                    if preset.isHealthInfo {
                        self.openVC(identifier: "HealthInfoViewController")
                    } else {
                        self.openVC(identifier: "InitialViewController")
                    }
                }
            }
        }/*
        DispatchQueue.main.async {
            if preset.explanationFrequency == 0 {
                self.openVC(identifier: "InstructionViewController")
            } else {
                if preset.isHealthInfo {
                    self.openVC(identifier: "HealthInfoViewController")
                } else {
                    self.openVC(identifier: "InitialViewController")
                }
            }
        }*/
    }
    
    @objc func handlePause(_ notification: Notification) {
        DispatchQueue.main.async {
            if preset.explanationFrequency == 0 {
                self.openVC(identifier: "InstructionViewController")
            } else {
                if preset.isHealthInfo {
                    self.openVC(identifier: "HealthInfoViewController")
                } else {
                    self.openVC(identifier: "InitialViewController")
                }
            }
        }
    }


    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    @objc func togglePopover(_ sender: Any?) {
        if popover.isShown {
            closePopover(sender: sender)
        } else {
            showPopover(sender: sender)
        }
    }
    
    func showPopover(sender: Any?) {
        if let button = statusBarItem.button {
            NSRunningApplication.current.activate(options: NSApplication.ActivationOptions.activateIgnoringOtherApps)
            popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    func closePopover(sender: Any?) {
        popover.performClose(sender)    
    }
    
    var myWindowController: WindowController?
    
    func openVC(identifier: String) {
        myWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "WindowController") as! WindowController
        let secondVC = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: identifier) as? NSViewController
        myWindowController!.contentViewController = secondVC
        myWindowController!.showWindow(nil)
        myWindowController!.window?.makeKeyAndOrderFront(nil)
    }
    
}

extension PreferenceViewController {
    static func returnPopupVC() -> PreferenceViewController {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        let identifier = NSStoryboard.SceneIdentifier("PreferenceViewController")
        guard let viewcontroller = storyboard.instantiateController(withIdentifier: identifier) as? PreferenceViewController else {
            fatalError("Why cant i find QuotesViewController? - Check Main.storyboard")
        }
        return viewcontroller
    }
}

func setFrequency() {
    switch preset.frequency {
    case 0:
        setTotalTimer(interval: 1200)
    case 1:
        setTotalTimer(interval: 3600)
    default:
        setTotalTimer(interval: TimeInterval(60*preset.customFrequencyPerMinute))
    }
}
