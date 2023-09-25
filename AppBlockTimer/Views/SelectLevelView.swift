//
//  SelectLevelView.swift
//  AppBlockTimer
//
//  Created by Genki on 9/24/23.
//

import SwiftUI

struct SelectLevelView: View {
    @AppStorage("strictLevel") var strictLevel = 1
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            HStack{
                Text("Strictness")
                    .font(.title2)
                    .bold()
                
                Spacer()
            }.padding(.leading, 15)
            
            SelectLevelRow(levelText: "Level 1", emojiImage: "emoji_level1", color: .green, brief: "You can stop timer.")
                .onTapGesture {
                    strictLevel = 1
                    dismiss()
                }
            
            SelectLevelRow(levelText: "Level 2", emojiImage: "emoji_level2", color: Color("costom_blue"), brief: "You can't stop timer.")
                .onTapGesture {
                    strictLevel = 2
                    dismiss()
                }
            
            SelectLevelRow(levelText: "Level 3", emojiImage: "emoji_level3", color: .orange, brief: "You can't stop timer & delete apps.")
                .onTapGesture {
                    strictLevel = 3
                    dismiss()
                }
        }
    }
}

struct SelectLevelView_Previews: PreviewProvider {
    static let language: [String]  = ["en","ja"]
    
    static var previews: some View {
        ForEach(language, id: \.self) { languageID in
            SelectLevelView()
                .previewDisplayName("Language(\(languageID))")
                .environment(\.locale, .init(identifier: languageID))
        }
    }
}
