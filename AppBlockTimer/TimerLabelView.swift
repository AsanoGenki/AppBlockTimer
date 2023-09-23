//
//  TimerLabelView.swift
//  AppBlockTimer
//
//  Created by Genki on 9/23/23.
//

import SwiftUI

struct TimerLabelView: View {
    @Binding var offset: CGFloat
    @Binding var result: Int
    
    var body: some View {
        if result == 0 {
            if Int(sliderOffsetToString(offset: offset))! < 60 {
                Text("\(sliderOffsetToString(offset: offset)) : 00")
                    .font(.system(size: 52).monospacedDigit())
                    .foregroundColor(.blue)
            } else {
                
                let hours = Int(sliderOffsetToString(offset: offset))! / 60
                let minutes = Int(sliderOffsetToString(offset: offset))! - (Int(sliderOffsetToString(offset: offset))! / 60) * 60
                let minuteStamp = String(String(minutes).count > 1 ? String(minutes) : "0" + String(minutes))
                
                Text("\(hours) : \(minuteStamp) : 00")
                    .font(.system(size: 52).monospacedDigit())
                    .foregroundColor(.blue)
            }
        } 
        
        else {
            Text(Utility.intToTimeLabel(result))
                .font(.system(size: 52).monospacedDigit())
                .foregroundColor(.blue)
        }
    }
}

struct TimerLabelView_Previews: PreviewProvider {
    @State static var offset: CGFloat = 0
    @State static var result: Int = 0
    static var previews: some View {
        TimerLabelView(offset: $offset, result: $result)
    }
}
