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
    var timerRunning = false
    var timerLabelInfo: String = ""

    init (saleDuration: Int) {
        self.saleDuration = saleDuration
        startTimer()
    }
    
    func startTimer () {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: {[weak self] (_) in
            self?.saleDuration -= 1
            print("\(String(describing: self?.saleDuration)) remains")
        })
        RunLoop.current.add(timer!, forMode: .common)
        timer?.tolerance = 0.1
    }
    func updateTime() {
        saleDuration -= 1

        let seconds = saleDuration % 60
        let minutes = (saleDuration / 60) % 60
        let hours = saleDuration / 3600
        let days = saleDuration / 86400
        let strHours = hours > 9 ? String(hours) : "0" + String(hours)
        let strMinutes = minutes > 9 ? String(minutes) : "0" + String(minutes)
        let strSeconds = seconds > 9 ? String(seconds) : "0" + String(seconds)
        let strDays = days > 9 ? String(days) : "0" + String(days)

        timerLabelInfo = "\(strDays):\(strHours):\(strMinutes):\(strSeconds)"

        stopTimer()
    }
    
    func stopTimer() {

        if saleDuration == 0 {
            timer?.invalidate()
            timerRunning = false
        }
    }
    
    
}
