//
//  SmallPopupWindowController.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/12.
//  Copyright © 2019 isc. All rights reserved.
//

import Cocoa

class SmallPopupWindowController: NSWindowController {

    override func windowDidLoad() {
        super.windowDidLoad()
    
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}
