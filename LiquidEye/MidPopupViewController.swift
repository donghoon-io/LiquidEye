//
//  MidPopupViewController.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/12.
//  Copyright © 2019 isc. All rights reserved.
//

import Cocoa

class MidPopupViewController: NSViewController {

    var timer = Timer()
    
    let message = ["주의하십시오. 당신의 눈은 지금 휴식이 필요합니다",
                   "휴식을 취할 시간이에요! 지금 시작해볼까요?",
                   "LiquidEye가 당신의 눈휴식을 도울거에요. 참여하시겠습니까?",
                   "지금 휴식 취하지 않으면, 당신은 심각한 눈관련 질병에 노출될 수 있습니다. ",
                   "컴퓨터 시력증후군을 예방하기 위해서 지금 휴식에 참여하는 것이 어떠세요?", "눈 휴식을 취하고 눈 손상을 예방해 볼까요?", "당신의 눈이 위험합니다", "당신의 눈을 지키는 것이 열심히 일하는 것보다 중요하지 않을까요?", "경고: 휴식을 취하십시오", "지나친 컴퓨터 사용은 당신의 눈을 죽이고 있습니다", "당신의 눈을 버리지 마십시오", "건강한 눈을 원하신다면 참여해보시는게 어때요?", "작은 휴식이 당신의 눈을 보호해 줄 수 있어요~"]
    @IBOutlet weak var logoView: NSImageView!
    @IBOutlet weak var titleLabel: NSTextField!
    @IBOutlet weak var descriptionLabel: NSTextField!
    @IBOutlet weak var backView: NSImageView!
    @IBOutlet weak var midView: NSView!
    @IBOutlet weak var button1: NSButton!
    @IBOutlet weak var button2: NSButton!
    @IBOutlet weak var button3: NSButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        logoView.isHidden = !preset.isVisualQue
        titleLabel.isHidden = !preset.isMessage
        descriptionLabel.isHidden = !preset.isMessage
        
        titleLabel.stringValue = message[Int.random(in: 0..<message.count)]
        
        
        if #available(OSX 10.12, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 60.0, repeats: false, block: { (timer) in
                self.view.window?.close()
            })
        } else {
            // Fallback on earlier versions
        }
    }
    override func viewWillAppear() {
        midView.wantsLayer = true
        button1.wantsLayer = true
        button2.wantsLayer = true
        button3.wantsLayer = true
        if preset.notiColor == 0 {
            midView.layer?.backgroundColor =  NSColor.black.cgColor
            titleLabel.textColor = NSColor.white
            descriptionLabel.textColor = NSColor.white
            button1.layer?.shadowColor = NSColor.black.cgColor
            button2.layer?.shadowColor = NSColor.black.cgColor
            button3.layer?.shadowColor = NSColor.black.cgColor
        } else {
            midView.layer?.backgroundColor =  NSColor.white.cgColor
            titleLabel.textColor = NSColor.black
            descriptionLabel.textColor = NSColor.black
            button1.layer?.shadowColor = NSColor.black.cgColor
            button2.layer?.shadowColor = NSColor.black.cgColor
            button3.layer?.shadowColor = NSColor.black.cgColor
        }
        view.window?.isOpaque = false
        view.window?.backgroundColor = NSColor.black.withAlphaComponent(0.1)
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
        sendClick(button: "next", quitStatus: "notification")
        NotificationCenter.default.post(name: Notification.Name("totPause"), object: nil)
        self.view.window?.close()
    }
    @IBAction func fiveClicked(_ sender: NSButton) {
        sendClick(button: "5mlater", quitStatus: "notification")
        setPauseTimer(interval: 300)
        self.view.window?.close()
    }
    @IBAction func nextClicked(_ sender: NSButton) {
        sendClick(button: "quit", quitStatus: "notification")
        self.view.window?.close()
    }
    
}
