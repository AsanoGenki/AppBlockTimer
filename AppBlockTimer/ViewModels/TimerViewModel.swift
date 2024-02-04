//
//  TimerViewModel.swift
//  AppBlockTimer
//
//  Created by Genki on 9/23/23.
//

import Combine
import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var model: TimerModel
    @Published var result = 0
    
    @AppStorage("setMinute") var setMinute = 0
    
    @ObservedObject var notificationViewModel = NotificationViewModel()

    private var timer: AnyCancellable?
    
    var appBlockModel: AppBlockModel = AppBlockModel()

    init(model: TimerModel) {
        self.model = model
        self.model.startTime = fetchStartTime()

        if self.model.startTime != nil {
            start(minutes: model.minutes)
        }
    }

    func start(minutes: Int) {
        timer?.cancel()
        let seconds = minutes * 60
        let totalTime = Double(seconds)
        notificationViewModel.timerEndNotification(minutes: seconds)
        if model.startTime == nil {
            model.startTime = Date()
            saveStartTime()
        }
        timer = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self, let startTime = self.model.startTime else { return }

                let now = Date()
                let elapsed = now.timeIntervalSince(startTime)

                guard elapsed < totalTime else {
                    self.end()
                    return
                }
                self.result = Int(totalTime - elapsed)
            }
    }
    
    //ユーザーがボタンでタイマーを停止した時
    func stop() {
        timer?.cancel()
        model.startTime = nil
        saveStartTime()
        result = 0
        //アプリ制限を解除する
        appBlockModel.unBlockApp()
        //予定している通知を停止する
        notificationViewModel.deletetimerEndNotification()
    }

    //タイマーが時間切れになった時
    func end() {
        timer?.cancel()
        model.startTime = nil
        saveStartTime()
        result = 0
        //アプリ制限を解除する
        appBlockModel.unBlockApp()
        //strictLevelが3の場合、アプリの削除制限を解除する
        appBlockModel.undenyAppRemoval()
    }

    private func saveStartTime() {
        if let startTime = model.startTime {
            UserDefaults.standard.set(startTime, forKey: "startTime")
        } else {
            UserDefaults.standard.removeObject(forKey: "startTime")
        }
    }

    private func fetchStartTime() -> Date? {
        UserDefaults.standard.object(forKey: "startTime") as? Date
    }
    
    //残り時間を円で表すためのメソッド
    func elapsedTimeToCircle(_ result: Int) -> Double {
        let totalTime = setMinute * 60
        return (Double(totalTime) - Double(result)) / Double(totalTime)
    }
    
}
