//
//  DataStructure.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/10.
//  Copyright © 2019 isc. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

struct Feedback: Codable {
    var identifier = "P01"
    var time = "2018-09-09 11:11:11"
    var feedbackMsgInterventionTime = ""
    var feedbackMsgForcedness = ""
    var feedbackMsgVisualEffect = ""
    var feedbackMsgInstruction = ""
    var feedbackMsgHealthInfo = ""
    var feedbackMsgSound = ""
    var feedbackMsgColor = ""
    var feedbackMsgFeedback = ""
    
    init() {
        
    }
    init(identifier: String, time: String, feedbackMsgInterventionTime: String, feedbackMsgForcedness: String, feedbackMsgVisualEffect: String, feedbackMsgInstruction: String, feedbackMsgHealthInfo: String, feedbackMsgSound: String, feedbackMsgColor: String, feedbackMsgFeedback: String) {
        self.identifier = identifier
        self.time = time
        self.feedbackMsgInterventionTime = feedbackMsgInterventionTime
        self.feedbackMsgForcedness = feedbackMsgForcedness
        self.feedbackMsgVisualEffect = feedbackMsgVisualEffect
        self.feedbackMsgInstruction = feedbackMsgInstruction
        self.feedbackMsgHealthInfo = feedbackMsgHealthInfo
        self.feedbackMsgSound = feedbackMsgSound
        self.feedbackMsgColor = feedbackMsgColor
        self.feedbackMsgFeedback = feedbackMsgFeedback
    }
}

struct Click: Codable {
    var identifier = "P01"
    var time = "2018-09-09 11:11:11"
    var button = "cancel" //cancel, next
    var quitStatus = "complete" // complete, incomplete
    
    init() {
        
    }
    init(button: String, quitStatus: String) {
        self.button = button
        self.quitStatus = quitStatus
    }
}

struct Usage: Codable {
    var identifier = "P01"
    var time = "2018-09-09 11:11:11"
    var interval = 30 //초
    var todayTotalTime = 30 //초
    var todayDoneFrequency = 10 //횟수
    var todayTotalFrequency = 100 //횟수
    
    init() {
    }
}

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

var todayProgress: [String : Int] {
    get {
        let progress = UserDefaults.standard.dictionary(forKey: "yayaya")
        return progress as? [String : Int] ?? [:]
    } set {
        UserDefaults.standard.set(newValue, forKey: "yayaya")
        UserDefaults.standard.synchronize()
    }
}


var todayQuantity: [String : Int] {
    get {
        let progress = UserDefaults.standard.dictionary(forKey: "todayQuantity")
        return progress as? [String : Int] ?? [:]
    } set {
        UserDefaults.standard.set(newValue, forKey: "todayQuantity")
        UserDefaults.standard.synchronize()
    }
}

var todayTime: [String : Int] {
    get {
        let progress = UserDefaults.standard.dictionary(forKey: "todayTime")
        return progress as? [String : Int] ?? [:]
    } set {
        UserDefaults.standard.set(newValue, forKey: "todayTime")
        UserDefaults.standard.synchronize()
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


func sendUsage() {
    let todayDateFormatter = DateFormatter()
    todayDateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    let url = "http://18.191.148.80:8080/sendUsage"
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    do {
        var usage = Usage()
        usage.identifier = preset.identifier
        usage.time = todayDateFormatter.string(from: Date())
        switch preset.frequency {
        case 0:
            usage.interval = 20
        case 1:
            usage.interval = 600
        default:
            if preset.timeType == 0 {
                usage.interval = preset.customFrequencyInterval
            } else {
                usage.interval = preset.customFrequencyInterval * 60
            }
        }
        usage.todayDoneFrequency = getTodayQuantity(isAchieved: true)
        usage.todayTotalFrequency = getTodayQuantity(isAchieved: true)
        usage.todayTotalTime = getTodayTime()
        let jsonData = try encoder.encode(usage)
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            let contentToAppend = jsonString+",\n"
            let filePath = NSHomeDirectory() + "/Documents/usage_" + dateFormatter.string(from: Date())
            if let fileHandle = FileHandle(forWritingAtPath: filePath) {
                fileHandle.seekToEndOfFile()
                fileHandle.write(contentToAppend.data(using: .utf8) ?? Data())
            }
            else {
                do {
                    try contentToAppend.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    print("Error creating \(filePath)")
                }
            }
            print(jsonString)
            Alamofire.request(url, method: .post, parameters: JSON(parseJSON: jsonString).dictionaryObject, encoding: JSONEncoding.default).responseJSON { (js) in
                print(js)
            }
        }
    } catch {
        print(error.localizedDescription)
    }
}

func sendPreference() {
    let todayDateFormatter = DateFormatter()
    todayDateFormatter.dateFormat = "yyyy-MM-dd"
    let url = "http://18.191.148.80:8080/preferenceChange"
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    do {
        let jsonData = try encoder.encode(preset)
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            let contentToAppend = jsonString+",\n"
            let filePath = NSHomeDirectory() + "/Documents/preference_" + todayDateFormatter.string(from: Date())
            
            //Check if file exists
            if let fileHandle = FileHandle(forWritingAtPath: filePath) {
                //Append to file
                fileHandle.seekToEndOfFile()
                fileHandle.write(contentToAppend.data(using: .utf8) ?? Data())
            }
            else {
                //Create new file
                do {
                    try contentToAppend.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    print("Error creating \(filePath)")
                }
            }
            print(jsonString)
            Alamofire.request(url, method: .post, parameters: JSON(parseJSON: jsonString).dictionaryObject, encoding: JSONEncoding.default).responseJSON { (js) in
                print(js)
            }
        }
    } catch {
        print(error.localizedDescription)
    }
}

func sendClick(button: String, quitStatus: String) {
    let url = "http://18.191.148.80:8080/taskFinished"
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    do {
        let todayDateFormatter = DateFormatter()
        todayDateFormatter.dateFormat = "yyyy-MM-dd"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        var content = Click(button: button, quitStatus: quitStatus)
        content.identifier = preset.identifier
        content.time = dateFormatter.string(from: Date())
        let jsonData = try encoder.encode(content)
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            let contentToAppend = jsonString+",\n"
            let filePath = NSHomeDirectory() + "/Documents/button_" + todayDateFormatter.string(from: Date())
            
            //Check if file exists
            if let fileHandle = FileHandle(forWritingAtPath: filePath) {
                //Append to file
                fileHandle.seekToEndOfFile()
                fileHandle.write(contentToAppend.data(using: .utf8) ?? Data())
            }
            else {
                //Create new file
                do {
                    try contentToAppend.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    print("Error creating \(filePath)")
                }
            }
            print(jsonString)
            Alamofire.request(url, method: .post, parameters: JSON(parseJSON: jsonString).dictionaryObject, encoding: JSONEncoding.default).responseJSON { (js) in
                print(js)
            }
        }
    } catch {
        print(error.localizedDescription)
    }
}

func sendFeedback(feedback: Feedback) {
    var curFeedback = feedback
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let todayDateFormatter = DateFormatter()
    todayDateFormatter.dateFormat = "yyyy-MM-dd"
    curFeedback.time = dateFormatter.string(from: Date())
    curFeedback.identifier = preset.identifier
    let url = "http://18.191.148.80:8080/feedbackMsg"
    let encoder = JSONEncoder()
    encoder.outputFormatting = .prettyPrinted
    do {
        let jsonData = try encoder.encode(curFeedback)
        if let jsonString = String(data: jsonData, encoding: .utf8) {
            let contentToAppend = jsonString+",\n"
            let filePath = NSHomeDirectory() + "/Documents/feedback_" + todayDateFormatter.string(from: Date())
            
            //Check if file exists
            if let fileHandle = FileHandle(forWritingAtPath: filePath) {
                //Append to file
                fileHandle.seekToEndOfFile()
                fileHandle.write(contentToAppend.data(using: .utf8) ?? Data())
            }
            else {
                //Create new file
                do {
                    try contentToAppend.write(toFile: filePath, atomically: true, encoding: String.Encoding.utf8)
                } catch {
                    print("Error creating \(filePath)")
                }
            }
            print(jsonString)
            Alamofire.request(url, method: .post, parameters: JSON(parseJSON: jsonString).dictionaryObject, encoding: JSONEncoding.default).responseJSON { (js) in
                print(js)
            }
        }
    } catch {
        print(error.localizedDescription)
    }
}

func saveTodayProgress(isTotal: Bool) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    if isTotal {
        if todayProgress["\(dateFormatter.string(from: Date()))_total"] == nil {
            todayProgress["\(dateFormatter.string(from: Date()))_total"] = 0
        }
        var tot = 0
        if preset.explanationFrequency == 0 {
            tot += 1
        }
        if preset.isHealthInfo {
            tot += 1
        }
        todayProgress["\(dateFormatter.string(from: Date()))_total"] = todayProgress["\(dateFormatter.string(from: Date()))_total"]! + tot + 1
    } else {
        if todayProgress["\(dateFormatter.string(from: Date()))_click"] == nil {
            todayProgress["\(dateFormatter.string(from: Date()))_click"] = 0
        }
        todayProgress["\(dateFormatter.string(from: Date()))_click"] = todayProgress["\(dateFormatter.string(from: Date()))_click"]! + 1
    }
    print(todayProgress)
}

func getTodayProgress(isTotal: Bool) -> Int {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    if isTotal {
        return todayProgress["\(dateFormatter.string(from: Date()))_total"] ?? 0
    } else {
        return todayProgress["\(dateFormatter.string(from: Date()))_click"] ?? 0
    }
}

func updateTodayQuantity(isAchieved: Bool) {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    if !isAchieved {
        if todayQuantity["\(dateFormatter.string(from: Date()))_total"] == nil {
            todayQuantity["\(dateFormatter.string(from: Date()))_total"] = 0
        }
        todayQuantity["\(dateFormatter.string(from: Date()))_total"] = todayQuantity["\(dateFormatter.string(from: Date()))_total"]! + 1
    } else {
        if todayQuantity["\(dateFormatter.string(from: Date()))_done"] == nil {
            todayQuantity["\(dateFormatter.string(from: Date()))_done"] = 0
        }
        todayQuantity["\(dateFormatter.string(from: Date()))_done"] = todayQuantity["\(dateFormatter.string(from: Date()))_done"]! + 1
    }
    print(todayQuantity)
}
func getTodayQuantity(isAchieved: Bool) -> Int {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    if !isAchieved {
        return todayQuantity["\(dateFormatter.string(from: Date()))_total"] ?? 0
    } else {
        return todayQuantity["\(dateFormatter.string(from: Date()))_done"] ?? 0
    }
}

func updateTodayTime() {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    if todayTime["\(dateFormatter.string(from: Date()))"] == nil {
        todayTime["\(dateFormatter.string(from: Date()))"] = 0
    }
    if preset.frequency == 0 {
        todayTime["\(dateFormatter.string(from: Date()))"] = todayTime["\(dateFormatter.string(from: Date()))"]! + 20
    } else if preset.frequency == 1 {
        todayTime["\(dateFormatter.string(from: Date()))"] = todayTime["\(dateFormatter.string(from: Date()))"]! + 300
    } else {
        if preset.timeType == 0 {
            todayTime["\(dateFormatter.string(from: Date()))"] = todayTime["\(dateFormatter.string(from: Date()))"]! + Int(preset.customFrequencyInterval)
        } else {
            todayTime["\(dateFormatter.string(from: Date()))"] = todayTime["\(dateFormatter.string(from: Date()))"]! + Int(preset.customFrequencyInterval)*60
        }
    }
    print(todayQuantity)
}

func getTodayTime() -> Int {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return todayTime["\(dateFormatter.string(from: Date()))"] ?? 0
}
