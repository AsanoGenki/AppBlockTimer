//
//  MainView.swift
//  AppBlockTimer
//
//  Created by Genki on 9/25/23.
//

import SwiftUI

struct MainView: View {
    @AppStorage("authority") var authority = false
    @AppStorage("setMinute") var setMinute = 0
    
    var body: some View {
        if authority {
            TimerView(timerViewModel: TimerViewModel(model: TimerModel(minutes: setMinute)))
        } else {
            AuthorizationView()
        }
    }
}

#Preview {
    MainView()
}
