//
//  AppDelegate.swift
//  AppBlockTimer
//
//  Created by Genki on 9/26/23.
//

import Foundation
import UIKit

class AppDelegate:NSObject,UIApplicationDelegate,UNUserNotificationCenterDelegate{
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("通知機能ON")
                UNUserNotificationCenter.current().delegate = self
            }else{
                print("通知機能OFF")
            }
        }
        return true
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
            completionHandler([[.banner, .list, .sound]])
    }
}
