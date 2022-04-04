//
//  ViewController.swift
//  Timer
//
//  Created by Mallikarjun on 31/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    
    var timer: Timer!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        self.timeLabel.text = ""
        self.label2.text = ""
        
        //Changing Background Color
      //  timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateBackgroundColor), userInfo: nibName, repeats: true)
        
        //Increase count for Label
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCountValueAtLabel), userInfo: nibName, repeats: true)
    }

    //MARK: Changing background Color or VC for Every Seconds (Based on time u gave)
    @objc func updateBackgroundColor() {
         view.backgroundColor = .random()
        
        //Following code written to stop the timer (Chanding backfround color state after 10 seconds)
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            
            self.timer.invalidate()
        }
    }

    //MARK: Updating label label - With Count
    @objc func updateCountValueAtLabel() {
        
        count = count + 1
        self.timeLabel.text = "\(count)"
        
        //you can stop the updating label in condition like if count == 20 then stop the updating label
        if count == 10 {
            timer.invalidate()
            self.label2.text = "Timer Stoped After 10 Seconds"
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.viewWillDisappear(animated)
        timer.invalidate()
    }
}


