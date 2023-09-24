//
//  BottomButtonView.swift
//  AppBlockTimer
//
//  Created by Genki on 9/23/23.
//

import SwiftUI
import FamilyControls

struct BottomButtonView: View {
    @ObservedObject var timerViewModel: TimerViewModel
    @ObservedObject var appBlockViewModel: AppBlockViewModel
    
    @AppStorage("setMinute") var setMinute = 0
    @AppStorage("blockAppSelecton") var blockAppSelecton = FamilyActivitySelection()
    @AppStorage("strictLevel") var strictLevel = 1
    
    @State private var isShowingAppPicker = false
    @State private var isShowingLevelSheet = false
    
    @Binding var result: Int
    @Binding var minute: Int
    @Binding var offset: CGFloat
    
    var body: some View {
        HStack {
            Spacer()
            //アプリ制限ボタン
            HStack {
                Image(systemName: "square.stack.3d.up.fill")
                
                Text(String(blockAppSelecton.applications.count))
            }
            .foregroundColor(.blue)
            .onTapGesture {
                isShowingAppPicker.toggle()
            }
            
            Spacer()
            
            //スタート/停止ボタン
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
                        //タイマーを開始する
                        timerViewModel.start(minutes: setMinute)
                        //アプリを制限する
                        appBlockViewModel.blockApp()
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
                        timerViewModel.stop()
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal, 10)
            }
            Spacer()
            
            //厳格モードボタン
            if strictLevel == 1 {
                Image("emoji_01")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        isShowingLevelSheet.toggle()
                    }
            } else if strictLevel == 2 {
                Image("emoji_02")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .onTapGesture {
                        isShowingLevelSheet.toggle()
                    }
            } else {
                Image("emoji_03")
                .resizable()
                .frame(width: 30, height: 30)
                .onTapGesture {
                    isShowingLevelSheet.toggle()
                }
            }
            
            Spacer()
        }
        .familyActivityPicker(isPresented: $isShowingAppPicker, selection: $blockAppSelecton)
        .sheet(isPresented: $isShowingLevelSheet) {
            SelectLevelView()
                .presentationDetents([ .fraction(0.4)])
        }
    }
}

struct BottomButtonView_Previews: PreviewProvider {
    @State static var minute: Int = 0
    @State static var result: Int = 0
    @State static var offset: CGFloat = 0
    
    static var previews: some View {
        BottomButtonView(timerViewModel: TimerViewModel(model: TimerModel(minutes: 0)), appBlockViewModel: AppBlockViewModel(), result: $result, minute: $minute, offset: $offset)
    }
}
