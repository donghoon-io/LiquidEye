
import Cocoa

class DoneViewController: NSViewController {
    let message = ["잘했어요!",
    "목표를 달성하신 걸 축하해요!",
    "참 잘했어요!",
    "좋은 성과에요!",
    "오! 잘 하고 있어요!"]
    @IBOutlet weak var messageLabel: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if preset.isBeep {
            NSSound(named: "beep.m4a")?.play()
        }
        messageLabel.stringValue = message.randomElement() ?? "정말 잘했어요!"
    }
    override func viewDidAppear() {
        
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    @IBAction func click(_ sender: Any) {
        switchView(id: "BackToWorkViewController", self)
    }
}

