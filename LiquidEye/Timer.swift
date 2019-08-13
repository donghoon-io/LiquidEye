//
//  Timer.swift
//  LiquidEye
//
//  Created by HoonieMac on 2019/08/11.
//  Copyright © 2019 isc. All rights reserved.
//

import Foundation
import Repeat

class TotalTimer {
    
    static var sharedTimer: TotalTimer = {
        let timer = TotalTimer(timeInterval: 1.0)
        return timer
    }()
    
    var timeInterval: TimeInterval
    
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    
    private lazy var timer: DispatchSourceTimer = {
        let t = DispatchSource.makeTimerSource()
        t.schedule(deadline: .now() + self.timeInterval, repeating: self.timeInterval)
        t.setEventHandler(handler: { [weak self] in
            self?.eventHandler?()
        })
        return t
    }()
    
    var eventHandler: (() -> Void)?
    
    private enum State {
        case suspended
        case resumed
    }
    
    private var state: State = .suspended
    
    deinit {
        timer.setEventHandler {}
        timer.cancel()
        /*
         If the timer is suspended, calling cancel without resuming
         triggers a crash. This is documented here https://forums.developer.apple.com/thread/15902
         */
        resume()
        eventHandler = nil
    }
    
    func cancel() {
        timer.setEventHandler {}
        timer.cancel()
        resume()
        eventHandler = nil
    }
    
    func resume() {
        if state == .resumed {
            return
        }
        state = .resumed
        timer.resume()
    }
    
    func suspend() {
        if state == .suspended {
            return
        }
        state = .suspended
        timer.suspend()
    }
}

class PauseTimer {
    static var sharedTimer: PauseTimer = {
        let timer = PauseTimer(timeInterval: 1.0)
        return timer
    }()
    
    var timeInterval: TimeInterval
    
    init(timeInterval: TimeInterval) {
        self.timeInterval = timeInterval
    }
    
    private lazy var timer: DispatchSourceTimer = {
        let t = DispatchSource.makeTimerSource()
        t.schedule(deadline: .now() + self.timeInterval, repeating: .never)
        t.setEventHandler(handler: { [weak self] in
            self?.eventHandler?()
        })
        return t
    }()
    
    var eventHandler: (() -> Void)?
    
    private enum State {
        case suspended
        case resumed
    }
    
    private var state: State = .suspended
    
    deinit {
        timer.setEventHandler {}
        timer.cancel()
        /*
         If the timer is suspended, calling cancel without resuming
         triggers a crash. This is documented here https://forums.developer.apple.com/thread/15902
         */
        resume()
        eventHandler = nil
    }
    
    func cancel() {
        timer.setEventHandler {}
        timer.cancel()
        resume()
        eventHandler = nil
    }
    
    func resume() {
        if state == .resumed {
            return
        }
        state = .resumed
        timer.resume()
    }
    
    func suspend() {
        if state == .suspended {
            return
        }
        state = .suspended
        timer.suspend()
    }
}


func setTotalTimer(interval: TimeInterval) {
    TotalTimer.sharedTimer.cancel()
    TotalTimer.sharedTimer = TotalTimer(timeInterval: interval)
    TotalTimer.sharedTimer.eventHandler = {
        NotificationCenter.default.post(name: Notification.Name("totOpen"), object: nil)
    }
    TotalTimer.sharedTimer.resume()
}

func setPauseTimer(interval: TimeInterval) {
    PauseTimer.sharedTimer.cancel()
    PauseTimer.sharedTimer = PauseTimer(timeInterval: interval)
    PauseTimer.sharedTimer.eventHandler = {
        NotificationCenter.default.post(name: Notification.Name("totPause"), object: nil)
        print("yaya")
    }
    PauseTimer.sharedTimer.resume()
}

