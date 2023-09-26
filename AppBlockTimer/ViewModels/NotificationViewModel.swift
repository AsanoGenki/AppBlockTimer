//
//  NotificationViewModel.swift
//  AppBlockTimer
//
//  Created by Genki on 9/26/23.
//

import SwiftUI
import UserNotifications

class NotificationViewModel: ObservableObject {
    
    func timerEndNotification(minutes: Int){        
        //日時
        let notificationDate = Date().addingTimeInterval(TimeInterval(minutes))
        let dateComp = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: notificationDate)
        
        //日時でトリガー指定
        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComp, repeats: false)
            
            let content = UNMutableNotificationContent()
            content.title = "AppBlockTimer"
            content.body = "タイマーが終了しました！"
            content.sound = UNNotificationSound.default
            
            let request = UNNotificationRequest(identifier: "timerEndNotification", content: content, trigger: trigger)

            UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        }
    
    //予定している通知を停止する
    func deletetimerEndNotification() {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests()
    }
    
}
