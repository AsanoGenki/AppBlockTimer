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
    
    var body: some Scene {
        WindowGroup {
            TimerView(timerViewModel: TimerViewModel(model: TimerModel(minutes: setMinute)))
                .onAppear {
                    gotoRequestAuthorization()
                }
        }
    }
    
    //スクリーンタイムを認証
    func gotoRequestAuthorization() {
        Task {
            do {
                try await center.requestAuthorization(for: .individual)
            } catch {
                
            }
        }
    }
    
}
