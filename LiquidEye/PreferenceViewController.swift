//
//  PreferenceViewController.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/10.
//  Copyright © 2019 isc. All rights reserved.
//

import Cocoa
import macOSThemeKit

class PreferenceViewController: NSViewController, NSTextFieldDelegate {
    
    let dateFormatter = DateFormatter()
    let todayDateFormatter = DateFormatter()
    
    func setPrevious() {
        idField.stringValue = preset.identifier
        frequencyButton0.state = (preset.frequency == 0) ? .on:.off
        frequencyButton1.state = (preset.frequency == 1) ? .on:.off
        frequencyButton2.state = (preset.frequency == 2) ? .on:.off
        
        perTextField.stringValue = String(preset.customFrequencyPerMinute)
        intervalTextField.stringValue = String(preset.customFrequencyInterval)
        
        timeTypeButton.selectItem(at: preset.timeType)
        
        visualCueButton.state = preset.isVisualQue ? .on:.off
        messageButton.state = preset.isMessage ? .on:.off
        
        sizeButton0.state = (preset.interventionSize == 0) ? .on:.off
        sizeButton1.state = (preset.interventionSize == 1) ? .on:.off
        sizeButton2.state = (preset.interventionSize == 2) ? .on:.off
        sizeButton3.state = (preset.interventionSize == 3) ? .on:.off
        
        effectButton0.state = (preset.interventionScreenEffect == 0) ? .on:.off
        effectButton1.state = (preset.interventionScreenEffect == 1) ? .on:.off
        effectButton2.state = (preset.interventionScreenEffect == 2) ? .on:.off
        
        
        explanationFrequencyButton0.state = (preset.explanationFrequency == 0) ? .on:.off
        explanationFrequencyButton1.state = (preset.explanationFrequency == 1) ? .on:.off
        explanationFrequencyButton2.state = (preset.explanationFrequency == 2) ? .on:.off
        explanationFrequencyButton3.state = (preset.explanationFrequency == 3) ? .on:.off
        
        eyeInfoButton0.state = preset.isHealthInfo ? .on:.off
        eyeInfoButton1.state = preset.isHealthInfo ? .off:.on
        
        beefButton0.state = preset.isBeep ? .on:.off
        beefButton1.state = preset.isBeep ? .off:.on
        
        notiChooseButton.selectItem(at: preset.notiColor)
        restChooseButton.selectItem(at: preset.restColor)
        
        completeMessageButton.state = preset.isAccomplishmentMessage ? .on:.off
        
        
        completeAccomplishmentButton0.state = (preset.isAccomplishment) ? .on:.off
        completeAccomplishmentButton1.state = (preset.isAccomplishment) ? .off:.on
        
        completeComplimentButton0.state = (preset.isCompliment) ? .on:.off
        completeComplimentButton1.state = (preset.isCompliment) ? .off:.on
        
        botButton0.state = (preset.character == 0) ? .on:.off
        botButton1.state = (preset.character == 1) ? .on:.off
        botButton2.state = (preset.character == 2) ? .on:.off
        botButton3.state = (preset.character == 3) ? .on:.off
    }
    
    @IBOutlet weak var idField: NSTextField!
    @IBOutlet weak var frequencyButton0: NSButton!
    @IBOutlet weak var frequencyButton1: NSButton!
    @IBOutlet weak var frequencyButton2: NSButton!
    @IBAction func frequencyButtonClicked(_ sender: NSButton) {
        frequencyButton0.state = (sender.tag == 0) ? .on:.off
        frequencyButton1.state = (sender.tag == 1) ? .on:.off
        frequencyButton2.state = (sender.tag == 2) ? .on:.off
    }
    
    @IBOutlet weak var perTextField: NSTextField!
    @IBOutlet weak var intervalTextField: NSTextField!
    
    @IBOutlet weak var timeTypeButton: NSPopUpButton!
    
    @IBOutlet weak var visualCueButton: NSButton!
    @IBAction func visualCueButtonClicked(_ sender: NSButton) {
        if visualCueButton.state == .off && messageButton.state == .off {
            visualCueButton.state = .on
        }
    }
    
    @IBOutlet weak var messageButton: NSButton!
    @IBAction func messageButtonClicked(_ sender: NSButton) {
        if visualCueButton.state == .off && messageButton.state == .off {
            visualCueButton.state = .on
        }
    }
    
    @IBOutlet weak var sizeButton0: NSButton!
    @IBOutlet weak var sizeButton1: NSButton!
    @IBOutlet weak var sizeButton2: NSButton!
    @IBOutlet weak var sizeButton3: NSButton!
    @IBAction func sizeButtonClicked(_ sender: NSButton) {
        sizeButton0.state = (sender.tag == 0) ? .on:.off
        sizeButton1.state = (sender.tag == 1) ? .on:.off
        sizeButton2.state = (sender.tag == 2) ? .on:.off
        sizeButton3.state = (sender.tag == 3) ? .on:.off
    }
    
    @IBOutlet weak var effectButton0: NSButton!
    @IBOutlet weak var effectButton1: NSButton!
    @IBOutlet weak var effectButton2: NSButton!
    @IBAction func effectButtonClicked(_ sender: NSButton) {
        effectButton0.state = (sender.tag == 0) ? .on:.off
        effectButton1.state = (sender.tag == 1) ? .on:.off
        effectButton2.state = (sender.tag == 2) ? .on:.off
    }
    
    @IBOutlet weak var explanationFrequencyButton0: NSButton!
    @IBOutlet weak var explanationFrequencyButton1: NSButton!
    @IBOutlet weak var explanationFrequencyButton2: NSButton!
    @IBOutlet weak var explanationFrequencyButton3: NSButton!
    @IBAction func explanationFrequencyButtonClicked(_ sender: NSButton) {
        explanationFrequencyButton0.state = (sender.tag == 0) ? .on:.off
        explanationFrequencyButton1.state = (sender.tag == 1) ? .on:.off
        explanationFrequencyButton2.state = (sender.tag == 2) ? .on:.off
        explanationFrequencyButton3.state = (sender.tag == 3) ? .on:.off
    }
    
    @IBOutlet weak var eyeInfoButton0: NSButton!
    @IBOutlet weak var eyeInfoButton1: NSButton!
    @IBAction func eyeInfoButtonClicked(_ sender: NSButton) {
        eyeInfoButton0.state = (sender.tag == 0) ? .on:.off
        eyeInfoButton1.state = (sender.tag == 1) ? .on:.off
    }
    
    @IBOutlet weak var beefButton0: NSButton!
    @IBOutlet weak var beefButton1: NSButton!
    @IBAction func beefButtonClicked(_ sender: NSButton) {
        beefButton0.state = (sender.tag == 0) ? .on:.off
        beefButton1.state = (sender.tag == 1) ? .on:.off
    }
    
    @IBOutlet weak var notiChooseButton: NSPopUpButton!
    @IBAction func notiChooseButtonClicked(_ sender: NSPopUpButton) {
    }
    
    @IBOutlet weak var restChooseButton: NSPopUpButton!
    @IBAction func restChooseButtonClicked(_ sender: NSPopUpButton) {
    }
    
    @IBOutlet weak var completeMessageButton: NSButton!
    @IBAction func completeMessageButtonClicked(_ sender: NSButton) {
    }
    
    @IBOutlet weak var completeAccomplishmentButton0: NSButton!
    @IBOutlet weak var completeAccomplishmentButton1: NSButton!
    @IBAction func completeAccomplishmentButtonClicked(_ sender: NSButton) {
        completeAccomplishmentButton0.state = (sender.tag == 0) ? .on:.off
        completeAccomplishmentButton1.state = (sender.tag == 1) ? .on:.off
    }
    
    @IBOutlet weak var completeComplimentButton0: NSButton!
    @IBOutlet weak var completeComplimentButton1: NSButton!
    @IBAction func completeComplimentButtonClicked(_ sender: NSButton) {
        completeComplimentButton0.state = (sender.tag == 0) ? .on:.off
        completeComplimentButton1.state = (sender.tag == 1) ? .on:.off
    }
    
    @IBOutlet weak var botButton0: NSButton!
    @IBOutlet weak var botButton1: NSButton!
    @IBOutlet weak var botButton2: NSButton!
    @IBOutlet weak var botButton3: NSButton!
    @IBAction func botButtonClicked(_ sender: NSButton) {
        botButton0.state = (sender.tag == 0) ? .on:.off
        botButton1.state = (sender.tag == 1) ? .on:.off
        botButton2.state = (sender.tag == 2) ? .on:.off
        botButton3.state = (sender.tag == 3) ? .on:.off
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        perTextField.delegate = self
        intervalTextField.delegate = self
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        todayDateFormatter.dateFormat = "yyyy-MM-dd"
    }
    override func viewDidAppear() {
        setPrevious()
    }
    
    @IBAction func closePopupClicked(_ sender: NSButton) {
        self.view.window?.close()
    }
    
    @IBAction func saveClicked(_ sender: NSButton) {
        preset.time = dateFormatter.string(from: Date())
        preset.identifier = idField.stringValue
        
        if frequencyButton0.state == .on {
            preset.frequency = 0
        } else if frequencyButton1.state == .on {
            preset.frequency = 1
        } else {
            preset.frequency = 2
            preset.customFrequencyPerMinute = Int(perTextField.stringValue) ?? 20
            preset.customFrequencyInterval = Int(intervalTextField.stringValue) ?? 20
            preset.timeType = timeTypeButton.indexOfSelectedItem
        }
        preset.isVisualQue = visualCueButton.state == .on
        preset.isMessage = messageButton.state == .on
        
        if sizeButton0.state == .on {
            preset.interventionSize = 0
        } else if sizeButton1.state == .on {
            preset.interventionSize = 1
        } else if sizeButton2.state == .on {
            preset.interventionSize = 2
        } else {
            preset.interventionSize = 3
        }
        
        if effectButton0.state == .on {
            preset.interventionScreenEffect = 0
        } else if effectButton1.state == .on {
            preset.interventionScreenEffect = 1
        } else {
            preset.interventionScreenEffect = 2
        }
        
        if explanationFrequencyButton0.state == .on {
            preset.explanationFrequency = 0
        } else if explanationFrequencyButton1.state == .on {
            preset.explanationFrequency = 1
        } else if explanationFrequencyButton2.state == .on {
            preset.explanationFrequency = 2
        } else {
            preset.explanationFrequency = 3
        }
        
        preset.isHealthInfo = eyeInfoButton0.state == .on
        
        preset.isBeep = beefButton0.state == .on
        
        preset.notiColor = notiChooseButton.indexOfSelectedItem
        preset.restColor = restChooseButton.indexOfSelectedItem
        
        preset.isAccomplishmentMessage = completeMessageButton.state == .on
        
        
        preset.isAccomplishment = completeAccomplishmentButton0.state == .on
        
        preset.isCompliment = completeComplimentButton0.state == .on
        
        if botButton0.state == .on {
            preset.character = 0
        } else if botButton1.state == .on {
            preset.character = 1
        } else if botButton2.state == .on {
            preset.character = 2
        } else {
            preset.character = 3
        }
        
        setFrequency()
        
        if preset.restColor == 0 {
            ThemeManager.darkTheme.apply()
        } else {
            ThemeManager.lightTheme.apply()
        }
        
        print(preset)
        sendPreference()
        
        
        let feedbackWindowController = NSStoryboard(name: "Main", bundle: nil).instantiateController(withIdentifier: "feedbackwindow") as? NSWindowController
        feedbackWindowController!.showWindow(nil)
        feedbackWindowController!.window?.makeKeyAndOrderFront(nil)
        
        view.window?.close()
    }
}
