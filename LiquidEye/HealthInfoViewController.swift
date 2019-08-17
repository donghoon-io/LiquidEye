

import Cocoa

class HealthInfoViewController: NSViewController {
    
    var timer = Timer()
    
    let message = [
        "빈번한 눈 휴식은 인공눈물을\n투여하는 것 보다 낫습니다",
        "잠자기 전에 수건을 이용한 스팀 마사지를 하는 것은\n당신의 안구 스트레스를 완화할 수 있어요",
        "컴퓨터 화면 밝기가 너무 높으면\n눈에 무리가 될 수 있습니다",
        "오메가 3가 함유된 생선이나, 조류 등을 많이 섭취하는\n것은 눈에 긍정적인 영향을 줍니다",
        "아보카도, 바나나, 감자 등에 많이 함유된 포타슘이라는\n성분은 눈 조직의 파괴를 예방하는데 도움을 줍니다",
        "일년에 한 번은 꼭 안과에 방문해서\n눈 검사를 받아보세요",
        "블루베리에 많이 함유된 안토시아닌 성분은\n눈의 노화를 지연시키는데 도움을 줍니다",
        "관자놀이 마사지를 자주 해주는 것이\n눈 긴장을 완화할 수 있어요",
        "여름에는 눈 보호를 위해 꼭 자외선 차단\n기능이 있는 썬글라스를 착용하세요",
        "눈을 자주 깜빡이는 것이 당신을 건강하게 합니다",
        "스마트폰을 장기간 사용할 시간에도 자주 휴식을 취하는게 좋습니다.\n적어도 60분 사용 후 5분은 휴식을 취하세요"
    ]
    @IBOutlet weak var healthLabel: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        healthLabel.stringValue = message.randomElement() ?? "빈번한 눈 휴식은 인공눈물을\n투여하는 것 보다 낫습니다"
        
        
        if #available(OSX 10.12, *) {
            timer = Timer.scheduledTimer(withTimeInterval: 10.0, repeats: false, block: { (timer) in
                switchView(id: "InitialViewController", self)
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
        sendClick(button: "quit", quitStatus: "healthinfo")
        self.view.window?.close()
    }
    
    @IBAction func clickNext(_ sender: NSButton) {
        saveTodayProgress(isTotal: false)
        sendClick(button: "next", quitStatus: "healthinfo")
        switchView(id: "InitialViewController", self)
    }
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
//        self.view.window?.close()
        //Pass data to new view
    }
    
}
