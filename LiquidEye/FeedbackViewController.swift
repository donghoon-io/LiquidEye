//
//  FeedbackViewController.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/14.
//  Copyright © 2019 isc. All rights reserved.
//

import Cocoa

class FeedbackViewController: NSViewController {
    
    var curDate = Date()
    
    @IBOutlet weak var feedback1: NSTextField!
    @IBOutlet weak var feedback11: NSTextField!
    @IBOutlet weak var feedback2: NSTextField!
    @IBOutlet weak var feedback3: NSTextField!
    @IBOutlet weak var feedback4: NSTextField!
    @IBOutlet weak var feedback5: NSTextField!
    @IBOutlet weak var feedback6: NSTextField!
    @IBOutlet weak var feedback7: NSTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func sendClicked(_ sender: NSButton) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var feedbackContent = Feedback(identifier: preset.identifier, time: dateFormatter.string(from: curDate), feedbackMsgInterventionTime: feedback1.stringValue, feedbackMsgForcedness: feedback11.stringValue, feedbackMsgVisualEffect: feedback2.stringValue, feedbackMsgInstruction: feedback3.stringValue, feedbackMsgHealthInfo: feedback4.stringValue, feedbackMsgSound: feedback5.stringValue, feedbackMsgColor: feedback6.stringValue, feedbackMsgFeedback: feedback7.stringValue)
        sendFeedback(feedback: feedbackContent)
        view.window?.close()
    }
}
