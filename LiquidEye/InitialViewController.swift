//
//  ViewController.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/10.
//  Copyright © 2019 isc. All rights reserved.
//

import Cocoa

class InitialViewController: NSViewController {

    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if #available(OSX 10.12, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { (timer) in
                switchView(id: "InProgressViewController", self)
            })
        } else {
            // Fallback on earlier versions
        }
    }
    
    override func viewDidAppear() {
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func click(_ sender: Any) {
        saveTodayProgress(isTotal: false)
        sendClick(button: "quit", quitStatus: "initial")
        switchView(id: "InProgressViewController", self)
    }
    @IBAction func quitClicked(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
}

