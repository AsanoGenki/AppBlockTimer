//
//  AppBlockTimerApp.swift
//  AppBlockTimer
//
//  Created by Genki on 9/23/23.
//

import SwiftUI

@main
struct AppBlockTimerApp: App {
    @AppStorage("setMinute") var setMinute = 0
    
    var body: some Scene {
        WindowGroup {
            TimerView(timerViewModel: TimerViewModel(model: TimerModel(minutes: setMinute)))
        }
    }
}
