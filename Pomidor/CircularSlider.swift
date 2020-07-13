import UIKit
import MSCircularSlider

class CircularSlider: UIViewController, MSCircularSliderDelegate {
    // Outlets
    @IBOutlet weak var valueLbl: UILabel!
    @IBOutlet weak var bigValueLbl: UILabel!
    @IBOutlet weak var slider: MSCircularSlider!
    @IBOutlet weak var startStopButton: CustomButton!
    
    // Members
    var currentRevolutions = 0
    var currentValue = 25.0
    var timerNew = Timer()
    
    // Actions
    func circularSlider(_ slider: MSCircularSlider, valueChangedTo value: Double, fromUser: Bool) {
        _ = String()
    }
    @IBAction func goToTimer(_ sender: UIButton) {
        performSegue(withIdentifier: "showTimer", sender: nil)
    }
    @IBAction func goToStatistic(_ sender: Any) {
        performSegue(withIdentifier: "showStatistic", sender: nil)
    }
    
    @IBAction func setSliderValue(_ sender: UIStepper) {
        currentValue = slider.currentValue
        let minValue = Int((currentValue.truncatingRemainder(dividingBy: 3600)) / 60)
        let zero = 0
        let secValue = Int(currentValue.truncatingRemainder(dividingBy: 60))
        if secValue < Int(10.0) {
            valueLbl.text = String(minValue) + ":" + String(zero) + String(secValue)
        } else {
            valueLbl.text = String(minValue) +  ":" + String(secValue)
            bigValueLbl.text = String(minValue) +  ":" + String(secValue)
        }
//        valueLbl.text = String(minValue) +  ":" + String(zero) + String(secValue)
//        bigValueLbl.text = String(minValue) +  ":" + String(secValue)
//        valueLbl.text = String(format: "%.f", currentValue)
//        bigValueLbl.text = String(format: "%.f", currentValue)
    }
    @IBAction func buttonPress(_ sender: UIButton) {
        if sender.currentTitle == "Start" {
            startTimer(startStopButton)
            sender.setTitle("Stop", for: .normal)
        } else {
            sender.setTitle("Start", for: .normal)
            stopTimer(startStopButton)
        }
    }
    func setLabelNumber () -> String {
        let minValue = Int((currentValue.truncatingRemainder(dividingBy: 3600)) / 60)
        let secValue = Int(currentValue.truncatingRemainder(dividingBy: 60))
        let textLabel = String(minValue) +  ":" + String(secValue)
        return textLabel
    }
    func startTimer(_ sender: AnyObject) {
        timerNew = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counterTimer), userInfo: nil, repeats: true)
        slider.isHidden = true
        valueLbl.isHidden = true
        bigValueLbl.isHidden = false
    }
    @objc func counterTimer() {
        currentValue -= 1.0
        
        let minValue = Int((currentValue.truncatingRemainder(dividingBy: 3600)) / 60)
        print(minValue)
        let secValue = Int(currentValue.truncatingRemainder(dividingBy: 60))
        print(secValue)
        
        valueLbl.text = String(minValue) +  ":" + String(secValue)
        bigValueLbl.text = String(minValue) +  ":" + String(secValue)
        //bigValueLbl.text = String(currentValue / 60) + ":" + String(currentValue.truncatingRemainder(dividingBy: 60))
        if (currentValue == 0.0){
            timerNew.invalidate()
        }
    }
    func stopTimer(_ sender: AnyObject) {
        timerNew.invalidate()
        //currentValue = 25
        valueLbl.text = setLabelNumber()
        slider.isHidden = false
        valueLbl.isHidden = false
        bigValueLbl.isHidden = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        bigValueLbl.isHidden = true
        
    }
}
