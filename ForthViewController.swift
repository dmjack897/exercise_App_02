//
//  ForthViewController.swift
//  exercise
//
//  Created by 심동목 on 2019/05/02.
//  Copyright © 2019 シムどんモク. All rights reserved.
//

import UIKit

class ForthViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBOutlet weak var startOutlet: UIButton!
    @IBOutlet weak var stopOulet: UIButton!
    var seconds = 30
    var count = 0;
    var timer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        timerLabel.text = String(seconds) + "seconds"
    }
    @IBAction func startButton(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ForthViewController.counter), userInfo: nil, repeats: true)
        
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
    }
    @objc func counter()
    {
        seconds = seconds - 1
        timerLabel.text = String(seconds) + "seconds"
        
        if(seconds == 0)
        {
            timer.invalidate()
            
            sliderOutlet.isHidden = false
            startOutlet.isHidden = false

        }
    }
    @IBAction func stopButton(_ sender: UIButton) {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        timerLabel.text = "30 seconds"
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
    }
    
    @IBAction func plusButton(_ sender: Any) {
        count = count + 1
        label.text = "\(count)"
    }
    @IBAction func minesButton(_ sender: Any) {
        count = count - 1
        label.text = "\(count)"
    }
    @IBAction func clearButton(_ sender: Any) {
        count = 0
        label.text = "\(count)"
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
