//
//  BottomButtonView.swift
//  AppBlockTimer
//
//  Created by Genki on 9/23/23.
//

import SwiftUI

struct BottomButtonView: View {
    @ObservedObject var timerViewModel: TimerViewModel
    @AppStorage("setMinute") var setMinute = 0
    
    @Binding var result: Int
    @Binding var minute: Int
    @Binding var offset: CGFloat
    
    var body: some View {
        if result == 0 {
            Image(systemName: "arrowtriangle.right.fill")
                .font(.system(size: 28))
                .foregroundColor(.blue)
                .background(
                    Circle()
                        .stroke(Color.blue, lineWidth: 3)
                        .frame(width: 60, height: 60)
                )
                .onTapGesture {
                    setMinute = minute
                    timerViewModel.start(minutes: setMinute)
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 10)
        }
        else {
            Image(systemName: "square.fill")
                .font(.system(size: 28))
                .foregroundColor(.blue)
                .background(
                    Circle()
                        .stroke(Color.blue, lineWidth: 3)
                        .frame(width: 60, height: 60)
                )
                .onTapGesture {
//                    offset = 0
                    timerViewModel.stop()
                }
                .padding(.vertical, 30)
                .padding(.horizontal, 10)
        }
    }
}

struct BottomButtonView_Previews: PreviewProvider {
    @State static var minute: Int = 0
    @State static var result: Int = 0
    @State static var offset: CGFloat = 0
    
    static var previews: some View {
        BottomButtonView(timerViewModel: TimerViewModel(model: TimerModel(minutes: 0)), result: $result, minute: $minute, offset: $offset)
    }
}
