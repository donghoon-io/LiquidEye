//
//  MidPopupViewController.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/12.
//  Copyright © 2019 isc. All rights reserved.
//

import Cocoa

class FullPopupViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do view setup here.
    }
    override func viewWillAppear() {
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
