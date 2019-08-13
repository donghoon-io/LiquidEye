
import Cocoa

class InstructionViewController: NSViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear() {
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    @IBAction func cancelClicked(_ sender: NSButton) {
        self.view.window?.close()
    }
    @IBAction func clickNext(_ sender: NSButton) {
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
