//
//  ContentView.swift
//  AppBlockTimer
//
//  Created by Genki on 9/23/23.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var timerViewModel: TimerViewModel
    @AppStorage("setMinute") var setMinute = 0
    
    @State var minute = 0
    
    var body: some View {
        //タイマーが適切に機能するかテストするためのビュー
        VStack {
            if timerViewModel.result == 0 {
                Picker("Number of people", selection: $minute) {
                        ForEach(1 ..< 100) {
                            Text("\($0) minutes").tag($0)
                        }
                    }
                .pickerStyle(WheelPickerStyle())
                
                Text("Start")
                    .onTapGesture {
                        setMinute = minute
                        timerViewModel.start(minutes: setMinute)
                    }
            }
            else {
                Text(Utility.intToTimeLabel(Int(timerViewModel.result)))
                    .font(.system(size: 52).monospacedDigit())
                    .foregroundColor(.blue)
                
                Text("Stop")
                    .onTapGesture {
                        timerViewModel.stop()
                    }
                
            }
        }
        .padding()
    }
}

#Preview {
    TimerView(timerViewModel: TimerViewModel(model: TimerModel(minutes: 0)))
}
