
import Cocoa

class BackToWorkViewController: NSViewController {
    
    let normalize: ((Float) -> Float) = { (input) in
        return round(input * 10) / 10
    }
    @IBOutlet weak var moneyLabel: NSTextField!
    @IBOutlet weak var width: NSLayoutConstraint!
    @IBOutlet weak var totView: NSView!
    @IBOutlet weak var innerView: NSView!
    @IBOutlet weak var percentLabel: NSTextField!
    @IBOutlet weak var explanationLabel: NSTextField!
    
    @IBOutlet weak var nextButton: NSButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if preset.isCompliment {
            nextButton.title = "다음"
        } else {
            nextButton.title = "휴식 끝내기"
        }
        
        updateTodayQuantity(isAchieved: true)
        updateTodayTime()
        print(getTodayTime())
        
        explanationLabel.isHidden = !preset.isAccomplishmentMessage
        
        switch arc4random_uniform(4) {
        case 0:
            if getTodayTime()/30 == 0 {
                explanationLabel.stringValue = "당신의 오늘 눈휴식은 \(getTodayTime()/2%30)초\n만큼 마사지를 받은 것과 같아요"
            } else {
                explanationLabel.stringValue = "당신의 오늘 눈휴식은 \(getTodayTime()/30)분 \(getTodayTime()/2%30)초\n만큼 마사지를 받은 것과 같아요"
            }
        case 1:
            if getTodayTime()/60 == 0 {
                explanationLabel.stringValue = "당신은 오늘 총 \(getTodayTime()%60)초 만큼의\n휴식을 취했어요"
            } else {
                explanationLabel.stringValue = "당신은 오늘 총 \(getTodayTime()/60)분 \(getTodayTime()%60)초\n만큼의 휴식을 취했어요"
            }
        case 2:
            explanationLabel.stringValue = "당신은 오늘 총\n \(getTodayQuantity(isAchieved: true))번 만큼의 휴식을 취했어요"
        default:
            explanationLabel.stringValue =
            "당신이 오늘 취한 휴식은 \(getTodayQuantity(isAchieved: true))컵의 당근주스를\n 마신 것과 같은 효과가 있어요"
        }
        
        moneyLabel.stringValue = "\(getTodayQuantity(isAchieved: true)*10)"
    }
    override func viewDidAppear() {
    }
    override func viewWillAppear() {
        percentLabel.stringValue = "\(normalize(Float(getTodayProgress(isTotal: false))/Float(getTodayProgress(isTotal: true))*100.0))%"
        totView.wantsLayer = true
        totView.layer?.backgroundColor =  NSColor.black.cgColor
        innerView.wantsLayer = true
        innerView.layer?.backgroundColor =  NSColor.white.cgColor
        
        width.constant = CGFloat(590.0 * normalize(Float(getTodayProgress(isTotal: false))/Float(getTodayProgress(isTotal: true))))
        self.view.layoutSubtreeIfNeeded()
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func click(_ sender: Any) {
        if preset.isCompliment {
            sendClick(button: "next", quitStatus: "backtowork")
            switchView(id: "DoneViewController", self)
        } else {
            sendClick(button: "backtowork", quitStatus: "backtowork")
            self.view.window?.windowController?.close()
        }
    }
}

