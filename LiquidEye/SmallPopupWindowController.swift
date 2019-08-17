//
//  SmallPopupWindowController.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/12.
//  Copyright © 2019 isc. All rights reserved.
//

import Cocoa

class SmallPopupWindowController: NSWindowController {

    let message = ["주의하십시오. 당신의 눈은 지금 휴식이 필요합니다",
                   "휴식을 취할 시간이에요! 지금 시작해볼까요?",
                   "LiquidEye가 당신의 눈휴식을 도울거에요. 참여하시겠습니까?",
                   "지금 휴식 취하지 않으면, 당신은 심각한 눈관련 질병에 노출될 수 있습니다. ",
                   "컴퓨터 시력증후군을 예방하기 위해서 지금 휴식에 참여하는 것이 어떠세요?", "눈 휴식을 취하고 눈 손상을 예방해 볼까요?", "당신의 눈이 위험합니다", "당신의 눈을 지키는 것이 열심히 일하는 것보다 중요하지 않을까요?", "경고: 휴식을 취하십시오", "지나친 컴퓨터 사용은 당신의 눈을 죽이고 있습니다", "당신의 눈을 버리지 마십시오", "건강한 눈을 원하신다면 참여해보시는게 어때요?", "작은 휴식이 당신의 눈을 보호해 줄 수 있어요~"]
    override func windowDidLoad() {
        super.windowDidLoad()
    
        self.window?.center()
        self.window?.makeKeyAndOrderFront(nil)
        NSApp.activate(ignoringOtherApps: true)
        // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    }

}
