//
//  AppBlockTimerApp.swift
//  AppBlockTimer
//
//  Created by Genki on 9/23/23.
//

import SwiftUI
import FamilyControls

@main
struct AppBlockTimerApp: App {
    @ObservedObject var center = AuthorizationCenter.shared
    
    @AppStorage("setMinute") var setMinute = 0
    @AppStorage("authority") var authority = false
    
    
    var body: some Scene {
        WindowGroup {
            
            TimerView(timerViewModel: TimerViewModel(model: TimerModel(minutes: setMinute)))
            
                .onReceive(center.$authorizationStatus) { status in
                    authority = status == .approved
                }
        }
    }
}
