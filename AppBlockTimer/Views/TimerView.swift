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
    @State var offset: CGFloat = 0
    
    var body: some View {
        NavigationView{
            ZStack {
                TimerLabelView(offset: $offset, result: $timerViewModel.result)
                
                VStack {
                    Spacer()
                    TimeSliderView(offset: $offset, minute: $minute)
                    
                    BottomButtonView(timerViewModel: timerViewModel, result: $timerViewModel.result, minute: $minute, offset: $offset)
                    
                }
            }
        }
    }
}

#Preview {
    TimerView(timerViewModel: TimerViewModel(model: TimerModel(minutes: 0)))
}
