
import Cocoa

class DoneViewController: NSViewController {
    
    var timer = Timer()
    
    let message = ["잘했어요!",
    "목표를 달성하신 걸 축하해요!",
    "참 잘했어요!",
    "좋은 성과에요!",
    "오! 잘 하고 있어요!"]
    @IBOutlet weak var messageLabel: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(OSX 10.12, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false, block: { (timer) in
                self.view.window?.close()
            })
        } else {
            // Fallback on earlier versions
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
        sendClick(button: "backtowork", quitStatus: "done")
        self.view.window?.close()
    }
}

