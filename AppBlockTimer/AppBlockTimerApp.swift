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
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            
            MainView()
                .onReceive(center.$authorizationStatus) { status in
                    authority = status == .approved
                }
        }
    }
}
