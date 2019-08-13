//
//  ViewController.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/10.
//  Copyright © 2019 isc. All rights reserved.
//

import Cocoa

class InitialViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear() {
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func click(_ sender: Any) {
        switchView(id: "InProgressViewController", self)
    }
    @IBAction func quitClicked(_ sender: NSButton) {
        self.view.window?.windowController?.close()
    }
}

