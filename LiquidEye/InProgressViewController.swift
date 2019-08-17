
import Cocoa

class InProgressViewController: NSViewController {
    
    @IBOutlet weak var imageView: NSImageView!
    var currentSecond = 0
    var messageArray = ["휴식 시간 동안 잠시 눈을 감는\n것도 도움이 될 수 있습니다", "혹은 멀리 바라보며\n눈을 이리저리 움직여 보세요", "약속한 시간이 끝날 때 까지 쉬세요", "만약 여유가 있다면\n일어서서 스트레칭을 하는 것도 권장해요", "당신이 이 글을 보고 있다면\n당신은 휴식에 참여하지 않고 있는 거에요", "휴식을 취할 때는 모니터가 아닌\n먼 곳을  바라보라고 했으니까요","남은 휴식시간"]
    
    var timer = Timer()
    var messageTimer = Timer()
    var time = 5
    
    @IBOutlet weak var inProgressLabel: NSTextField!
    @IBOutlet weak var timeLabel: NSTextField!
    @IBOutlet weak var nextButton: NSButton!
    @IBAction func nextClicked(_ sender: NSButton) {
        switch (preset.isAccomplishment, preset.isCompliment) {
        case (true, true):
            switchView(id: "BackToWorkViewController", self)
        case (true, false):
            switchView(id: "BackToWorkViewController", self)
        case (false, true):
            switchView(id: "DoneViewController", self)
        default:
            updateTodayQuantity(isAchieved: true)
            updateTodayTime()
            print(getTodayTime())
            sendUsage()
            self.view.window?.close()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch (preset.isAccomplishment, preset.isCompliment) {
        case (false, false):
            nextButton.title = "휴식 끝내기"
        default:
            nextButton.title = "다음"
        }
        
        switch preset.character {
        case 0:
            imageView.image = NSImage(named: "man")
        case 1:
            imageView.image = NSImage(named: "woman")
        case 2:
            imageView.image = NSImage(named: "robot")
        default:
            imageView.image = NSImage()
        }
        
        switch preset.frequency {
        case 0:
            time = 20
        case 1:
            time = 300
        default:
            switch preset.timeType {
            case 0:
                time = preset.customFrequencyInterval
            default:
                time = preset.customFrequencyInterval*60
            }
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(updateTimer)), userInfo: nil, repeats: true)
        
        let hours = time / 3600
        let minutes = time / 60 % 60
        let seconds = time % 60
        timeLabel.stringValue = String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        
        messageTimer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: (#selector(updateMessage)), userInfo: nil, repeats: true)

    }
    override func viewDidAppear() {
        
    }
    @objc func updateTimer() {
        time -= 1     //This will decrement(count down)the seconds.
        let hours = time / 3600
        let minutes = time / 60 % 60
        let seconds = time % 60
        timeLabel.stringValue = String(format:"%02i:%02i:%02i", hours, minutes, seconds)
        if time == 0 {
            nextButton.isHidden = false
            messageTimer.invalidate()
            timer.invalidate()
            
            if preset.isBeep {
                NSSound(named: "beep.m4a")?.play()
            }
        }
    }
    
    @objc func updateMessage() {
        inProgressLabel.stringValue = messageArray[currentSecond % messageArray.count]
        currentSecond += 1
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    @IBAction func quitClicked(_ sender: NSButton) {
        sendClick(button: "quit", quitStatus: "inprogress")
        self.view.window?.windowController?.close()
    }
}

