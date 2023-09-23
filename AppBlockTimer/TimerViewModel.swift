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

    private var timer: AnyCancellable?

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
                    self.stop()
                    return
                }
                self.result = Int(totalTime - elapsed)
            }
    }

    func stop() {
        timer?.cancel()
        timer = nil
        model.startTime = nil
        saveStartTime()
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
}
