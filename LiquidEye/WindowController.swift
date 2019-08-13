//
//  WindowController.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/11.
//  Copyright © 2019 isc. All rights reserved.
//

import Cocoa

class WindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
        
        self.window?.toggleFullScreen(true)
    }

}
