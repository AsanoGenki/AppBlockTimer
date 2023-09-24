//
//  SelectLevelView.swift
//  AppBlockTimer
//
//  Created by Genki on 9/24/23.
//

import SwiftUI

struct SelectLevelView: View {
    var body: some View {
        VStack {
            HStack{
                Text("Strictness")
                    .font(.title2)
                    .bold()
                
                Spacer()
            }.padding(.leading, 15)
            
            HStack{
                Image("emoji_level1")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.leading, 20)
                VStack(alignment: .leading, spacing: 5){
                    Text("Level 1")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.green)
                        .padding(.top, 10)
                    Text("You can stop timer.")
                        .font(.subheadline)
                        .padding(.bottom, 10)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color("background_gray"))
            .cornerRadius(14)
            .padding(.horizontal, 15)
            
            HStack{
                Image("emoji_level2")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.leading, 20)
                VStack(alignment: .leading, spacing: 5){
                    Text("Level 2")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("costom_blue"))
                        .padding(.top, 10)
                    Text("You can stop timer.")
                        .font(.subheadline)
                        .padding(.bottom, 10)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color("background_gray"))
            .cornerRadius(14)
            .padding(.horizontal, 15)
            
            HStack{
                Image("emoji_level3")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .padding(.leading, 20)
                VStack(alignment: .leading, spacing: 5){
                    Text("Level 3")
                        .font(.title2)
                        .bold()
                        .foregroundColor(.orange)
                        .padding(.top, 10)
                    Text("You can stop timer.")
                        .font(.subheadline)
                        .padding(.bottom, 10)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(Color("background_gray"))
            .cornerRadius(14)
            .padding(.horizontal, 15)
        }
    }
}

#Preview {
    SelectLevelView()
}
