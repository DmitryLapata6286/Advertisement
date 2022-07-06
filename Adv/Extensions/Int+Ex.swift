//
//  Int+Ex.swift
//  Adv
//
//  Created by Dmitry Lapata on 6.07.22.
//

import Foundation

extension Int {
    func secondsToTime()->String{
        let days = self / 86400
        let hours = self / 3600 % 24
        let minutes = self / 60 % 60
        let seconds = self % 60
        
        return String(format:"%02d:%02d:%02d:%02d", days, hours, minutes, seconds)
    }
}
