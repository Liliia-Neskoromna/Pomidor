import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var seconds = 30
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var label: UILabel!
    
    // Slider
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        label.text = String(seconds) + " " + "seconds"
    }
    
    // Button
    @IBOutlet weak var startOutler: UIButton!
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        if sender.currentTitle == "Start" {
            print("Taped Start")
            start(startOutler)
            sender.setTitle("Stop", for: .normal)
        } else {
            sender.setTitle("Start", for: .normal)
            print("Taped Stop")
            stop(startOutler)
        }
    }
    func start(_ sender: AnyObject) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        print("Start")
        sliderOutlet.isHidden = true
    }
    @objc func counter() {
        seconds -= 1
        label.text = String(seconds) + " " + "seconds"
        if (seconds == 0){
            timer.invalidate()
            audioPlayer.play()
            audioPlayer.numberOfLoops = -1
        }
    }
    func stop(_ sender: AnyObject) {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        label.text = "30 seconds"
        print("Stop")
        sliderOutlet.isHidden = false
        audioPlayer.stop()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOutler.applyCustomButton()
        do {
            let audioPath = Bundle.main.path(forResource: "gong", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch {
            print("No sound found by URL")
        }
    }
}

extension UIButton {
    func applyCustomButton() {
        self.layer.cornerRadius = self.frame.height / 3
        self.layer.masksToBounds = true
    }
}


