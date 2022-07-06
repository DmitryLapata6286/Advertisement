//
//  Advertisement.swift
//  Adv
//
//  Created by Dmitry Lapata on 4.07.22.
//

import UIKit

class Advertisement {
    var saleDuration: Int
    var timer: Timer?
    public var timerLabelInfo: String = ""
    var changedTextClosure: ((String) -> Void)?

    init (saleDuration: Int) {
        self.saleDuration = saleDuration
        
        startTimer()
    }
    
    func startTimer () {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        RunLoop.current.add(timer!, forMode: .common)
        timer?.tolerance = 0.1
    }
    @objc func updateTime() {
        saleDuration -= 1

        timerLabelInfo = saleDuration.secondsToTime()
        print(timerLabelInfo)
        changedTextClosure?(timerLabelInfo)
        

        stopTimer()
    }
    
    func stopTimer() {

        if saleDuration == 0 {
            timer?.invalidate()
        }
    }
    
    
}
