
import Cocoa

class InstructionViewController: NSViewController {
    
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if #available(OSX 10.12, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 15.0, repeats: false, block: { (timer) in
                switchView(id: "HealthInfoViewController", self)
            })
        } else {
            // Fallback on earlier versions
        }
    }
    override func viewDidAppear() {
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    @IBAction func cancelClicked(_ sender: NSButton) {
        sendClick(button: "quit", quitStatus: "instruction")
        self.view.window?.close()
    }
    
    
    @IBAction func clickNext(_ sender: NSButton) {
        saveTodayProgress(isTotal: false)
        sendClick(button: "next", quitStatus: "instruction")
        switchView(id: "HealthInfoViewController", self)
    }
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
//        self.view.window?.close()
        //Pass data to new view
    }
}

func switchView(id: String, _ vc: NSViewController) {
    if let secondVC = vc.storyboard?.instantiateController(withIdentifier: id) as? NSViewController {
        
        vc.view.window?.windowController?.contentViewController = secondVC
    }
}
