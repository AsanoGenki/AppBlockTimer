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
    
    var body: some View {
        HStack {
            Spacer()
            //アプリ制限ボタン
            HStack {
                Image(systemName: "square.stack.3d.up.fill")
                
                Text(String(blockAppSelecton.applications.count))
            }
            .foregroundColor(.blue)
            .opacity(result == 0 ? 1 : 0.6)
            .onTapGesture {
                if result == 0 {
                    isShowingAppPicker.toggle()
                }
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
                        //strictLevelが3の場合、アプリの削除を制限する
                        if strictLevel == 3 {
                            appBlockViewModel.denyAppRemoval()
                        }
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
                //タイマー起動時に厳格レベルが2,3の時、停止ボタンの透明度を変える
                    .opacity(strictLevel == 1 ? 1 : 0.6)
                    .onTapGesture {
                        //タイマー起動時に厳格レベルが2,3の時、停止ボタンを利用不可にする
                        if strictLevel == 1 {
                            timerViewModel.stop()
                        }
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
                    .opacity(result == 0 ? 1 : 0.6)
                    .onTapGesture {
                        if result == 0 {
                            isShowingLevelSheet.toggle()
                        }
                    }
            } else if strictLevel == 2 {
                Image("emoji_02")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .opacity(result == 0 ? 1 : 0.6)
                    .onTapGesture {
                        if result == 0 {
                            isShowingLevelSheet.toggle()
                        }
                        
                    }
            } else {
                Image("emoji_03")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .opacity(result == 0 ? 1 : 0.6)
                    .onTapGesture {
                        if result == 0 {
                            isShowingLevelSheet.toggle()
                        }
                        
                    }
            }
            
            Spacer()
        }
        .familyActivityPicker(isPresented: $isShowingAppPicker, selection: $blockAppSelecton)
        .sheet(isPresented: $isShowingLevelSheet) {
            SelectLevelView()
                .presentationDetents([ .fraction(0.45)])
        }
    }
}

struct BottomButtonView_Previews: PreviewProvider {
    @State static var minute: Int = 0
    @State static var result: Int = 0
    @State static var offset: CGFloat = 0
    
    static var previews: some View {
        BottomButtonView(timerViewModel: TimerViewModel(model: TimerModel(minutes: 0)), appBlockViewModel: AppBlockViewModel(), result: $result, minute: $minute)
    }
}
