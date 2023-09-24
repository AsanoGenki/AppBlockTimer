//
//  SelectLevelRow.swift
//  AppBlockTimer
//
//  Created by Genki on 9/24/23.
//

import SwiftUI

struct SelectLevelRow: View {
    var levelText: String
    var emojiImage: String
    var color: Color
    var brief: String
    
    var body: some View {
        HStack{
            Image(emojiImage)
                .resizable()
                .frame(width: 30, height: 30)
                .padding(.leading, 20)
            VStack(alignment: .leading, spacing: 5){
                Text(levelText)
                    .font(.title2)
                    .bold()
                    .foregroundColor(color)
                    .padding(.top, 10)
                Text(brief)
                    .font(.subheadline)
                    .padding(.bottom, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color("background_gray"))
        .cornerRadius(14)
        .padding(.horizontal, 15)
        .contentShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    SelectLevelRow(levelText: "Level 1", emojiImage: "emoji_level1", color: .green, brief: "You can stop timer.")
}
