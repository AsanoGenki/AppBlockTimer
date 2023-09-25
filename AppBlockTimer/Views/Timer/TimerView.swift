//
//  ContentView.swift
//  AppBlockTimer
//
//  Created by Genki on 9/23/23.
//

import SwiftUI

struct TimerView: View {
    @ObservedObject var timerViewModel: TimerViewModel
    @ObservedObject var appBlockViewModel = AppBlockViewModel()
    @AppStorage("authority") var authority = false
    
    @State var minute = 15 //タイマーの最小時間が15分
    @State var offset: CGFloat = 0
    
    var body: some View {
            NavigationView{
                ZStack {
                    ZStack(alignment: .center){
                        TimeCircleView(timerViewModel: timerViewModel, result: $timerViewModel.result)
                        
                        TimerLabelView(offset: $offset, result: $timerViewModel.result)
                    }
                    .frame(minHeight: 330)
                    .padding(24)
                    .padding(.top, -100)
                    
                    VStack(spacing: 12) {
                        Spacer()
                        TimeSliderView(offset: $offset, minute: $minute)
                            .opacity(timerViewModel.result == 0 ? 1 : 0)
                        
                        BottomButtonView(timerViewModel: timerViewModel, appBlockViewModel: AppBlockViewModel(), result: $timerViewModel.result, minute: $minute, offset: $offset)
                        
                    }
                }
                .padding(.bottom, 40)
            }
    }
}

#Preview {
    TimerView(timerViewModel: TimerViewModel(model: TimerModel(minutes: 0)))
}
