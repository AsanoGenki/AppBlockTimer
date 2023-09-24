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
            
            SelectLevelRow(levelText: "Level 1", emojiImage: "emoji_level1", color: .green, brief: "You can stop timer.")
            
            SelectLevelRow(levelText: "Level 2", emojiImage: "emoji_level2", color: Color("costom_blue"), brief: "You can stop timer.")
            
            SelectLevelRow(levelText: "Level 3", emojiImage: "emoji_level3", color: .orange, brief: "You can stop timer.")
        }
    }
}

#Preview {
    SelectLevelView()
}
