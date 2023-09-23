//
//  Utility.swift
//  AppBlockTimer
//
//  Created by Genki on 9/23/23.
//

import Foundation

class Utility {
    
    static func intToTimeLabel(_ result: Int) -> String {
        let seconds = String(result % 60)
        let minutes = String((result / 60) % 60)
        let hours = String(result / 3600)
        let minuteStamp = minutes.count > 1 ? minutes : "0" + minutes
        let hoursStamp = hours.count > 1 ? hours : "" + hours
        let secondsStamp = String(seconds.count > 1 ? seconds : "0" + seconds)
        
        if result / 3600 < 1 {
            return "\(minuteStamp) : \(secondsStamp)"
        } else {
            return "\(hoursStamp) : \(minuteStamp) : \(secondsStamp)"
        }
    }
    
}
