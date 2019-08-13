
import Cocoa

class BackToWorkViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidAppear() {
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    @IBAction func click(_ sender: Any) {
        self.view.window?.windowController?.close()
    }
}

