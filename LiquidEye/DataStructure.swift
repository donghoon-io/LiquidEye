//
//  DataStructure.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/10.
//  Copyright © 2019 isc. All rights reserved.
//

import Foundation

struct Preference: Codable {
    var identifier = "P01" //PXX
    var time = "2018-09-09 11:11:11" //sending time
    
    var frequency = 0//0:20-20 1:60-5 2:customFrequencyPerMinute-customFrequencyInterval
    var timeType = 0 //0: 초, 1: 분
    var customFrequencyPerMinute = 20 //대기시간(긴거)
    var customFrequencyInterval = 20 //intervention시간(진행할때,짧은거)
    
    var isVisualQue = true //시각 효과 여부
    var isMessage = true //메시지 여부
    var interventionSize = 1 //0: 전체 화면 1: 중간 화면 2: 오른쪽 위 팝업 3: 없음
    
    var interventionScreenEffect = 2 //0: 빨간점 1: 반짝이는 테두리 2: 뿌연효과 3: 화면에 까만반점 4: 어지로운 효과 5: 흔들리는 효과

    var explanationFrequency = 1 //0: 매번 1: 하루에 한번 2: 한달에 한번 3: 없음

    var isHealthInfo = true //눈 건강 관련 정보 여부
    
    var isBeep = true //휴식 종료 후 소리 여부
    
    var notiColor = 0 //알림창 색깔 0: 검정, 1: 하양
    var restColor = 1 //휴식창 색깔 0: 검정, 1: 하양
    
    var isAccomplishment = true //성과 보기 여부
    var isAccomplishmentMessage = true //성과 보기에서 메시지 여부
    var isCompliment = true //칭찬 보기 여부
    
    var character = 2 //캐릭터 0: 남자 1: 여자 2: 로봇 3: 없음
    
    init() {
        
    }
    
    init(identifier: String, time: String, frequency: Int, timeType: Int, customFrequencyPerMinute: Int, customFrequencyInterval: Int, isVisualQue: Bool, isMessage: Bool, interventionSize: Int, interventionScreenEffect: Int, explanationFrequency: Int, isHealthInfo: Bool, isBeep: Bool, notiColor: Int, restColor: Int, isAccomplishment: Bool, isAccomplishmentMessage: Bool, isCompliment: Bool, character: Int) {
        self.identifier=identifier
        self.time=time
        self.frequency=frequency
        self.timeType=timeType
        self.customFrequencyPerMinute=customFrequencyPerMinute
        self.customFrequencyInterval=customFrequencyInterval
        self.isVisualQue=isVisualQue
        self.isMessage=isMessage
        self.interventionSize=interventionSize
        self.interventionScreenEffect=interventionScreenEffect
        self.explanationFrequency=explanationFrequency
        self.isHealthInfo=isHealthInfo
        self.isBeep=isBeep
        self.notiColor=notiColor
        self.restColor=restColor
        self.isAccomplishment=isAccomplishment
        self.isAccomplishmentMessage=isAccomplishmentMessage
        self.isCompliment=isCompliment
        self.character=character
    }
}

var preset: Preference {
    get {
        let data1 = UserDefaults.standard.value(forKey: "preset") as? Data
        let pre = try? PropertyListDecoder().decode(Preference.self, from: data1!)
        return pre ?? Preference()
    } set {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: "preset")
        UserDefaults.standard.synchronize()
    }
}
