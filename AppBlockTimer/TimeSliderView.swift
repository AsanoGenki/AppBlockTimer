//
//  TimeSliderView.swift
//  AppBlockTimer
//
//  Created by Genki on 9/23/23.
//

import SwiftUI

struct TimeSliderView: View {
    @Binding var offset: CGFloat
    @Binding var minute: Int
    var body: some View {
        VStack(spacing: 15){
            let pickerCount = 45
            
            CustomSlider(pickerCount: pickerCount, offset: $offset, content: {
                
                HStack(spacing: 0){
                    
                    ForEach(1...pickerCount,id: \.self){index in
                        
                        VStack{
                            Rectangle()
                                .cornerRadius(20)
                                .frame(width: 3, height: 30)
                            
                            if 10 + (index * 5) < 200 {
                                Text("\(10 + (index * 5))")
                                    .font(.caption2)
                                    .foregroundColor(.gray)
                            } else {
                                Text("\(10 + (index * 5))")
                                    .font(.system(size: 10))
                                    .foregroundColor(.gray)
                            }
                        }
                        .frame(width: 20)
                        
                        ForEach(1...4,id: \.self){subIndex in
                            
                            Rectangle()
                                .cornerRadius(20)
                                .frame(width: 3, height: 15)
                                .frame(width: 20)
                        }
                    }
                    
                    VStack{
                        Rectangle()
                            .fill(Color.gray)
                            .frame(width: 3, height: 30)
                        Text("\(240)")
                            .font(.system(size: 10))
                            .foregroundColor(.gray)
                    }
                    .frame(width: 20)
                }
            })
            .frame(height: 50)
            .overlay(
                Rectangle()
                    .fill(Color.gray)
                    .frame(width: 1, height: 50)
                    .offset(x: 0.8, y: -30)
            )
            .padding()
            .onChange(of: sliderOffsetToString(offset: offset)) { newSelection in
                let selectionFeedback = UISelectionFeedbackGenerator()
                selectionFeedback.selectionChanged()
                minute =  (Int(sliderOffsetToString(offset: offset))!)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
        .padding(.bottom, -75)
    }
}

struct TimeSliderView_Previews: PreviewProvider {
    @State static var offset: CGFloat = 0
    @State static var minute: Int = 0
    static var previews: some View {
        TimeSliderView(offset: $offset, minute: $minute)
    }
}

