//
//  SmallPopupViewController.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/12.
//  Copyright © 2019 isc. All rights reserved.
//

import Cocoa

class SmallPopupViewController: NSViewController {

    @IBOutlet weak var backView: NSImageView!
    @IBOutlet weak var midView: NSView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do view setup here.
    }
    override func viewWillAppear() {
        midView.wantsLayer = true
        midView.layer?.backgroundColor =  NSColor.black.cgColor
        view.window?.isOpaque = false
        view.window?.backgroundColor = NSColor.black.withAlphaComponent(0.3)
        switch preset.interventionScreenEffect {
        case 0://블러
            backView.image = NSImage(named: "blur")
        case 1://도트
            backView.image = NSImage(named: "dot")
        default://없음
            backView.image = NSImage()
        }
    }
    
    @IBAction func goClicked(_ sender: NSButton) {
        NotificationCenter.default.post(name: Notification.Name("totPause"), object: nil)
        self.view.window?.close()
    }
    @IBAction func fiveClicked(_ sender: NSButton) {
        setPauseTimer(interval: 300)
        self.view.window?.close()
    }
    @IBAction func nextClicked(_ sender: NSButton) {
        self.view.window?.close()
    }
}
