//
//  TimeCircleView.swift
//  AppBlockTimer
//
//  Created by Genki on 9/24/23.
//

import SwiftUI

struct TimeCircleView: View {
    
    @ObservedObject var timerViewModel: TimerViewModel
    @Binding var result: Int
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color(.sRGB, red: 0.58, green: 0.807, blue: 1.0, opacity: 1.0), style: StrokeStyle(lineWidth:10))
                .scaledToFit()
                .padding(10)
            
            Circle()
                .trim(from: 0.0, to: 1.0 - timerViewModel.elapsedTimeToCircle(Int(result)))
                .stroke(result != 0 ? Color.blue : Color(.sRGB, red: 0.58, green: 0.807, blue: 1.0, opacity: 1.0), style: StrokeStyle(lineWidth:10, lineCap: .round))
                .scaledToFit()
                .padding(10)
                .rotationEffect(.degrees(-90))
                .animation(.easeOut, value: result)
        }
    }
}


struct TimeCircleView_Previews: PreviewProvider {
    @State static var result: Int = 0
    static var previews: some View {
        TimeCircleView(timerViewModel: TimerViewModel(model: TimerModel(minutes: 0)), result: $result)
    }
}
