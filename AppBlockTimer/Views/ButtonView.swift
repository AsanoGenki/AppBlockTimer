//
//  ButtonView.swift
//  AppBlockTimer
//
//  Created by Genki on 9/24/23.
//

import SwiftUI

struct ButtonView: View {
    var text: String
    var color: Color
    var body: some View {
            
            Text(text)
                .frame(minWidth: 150)
                .foregroundColor(.white)
                .font(.system(size: 18))
                .fontWeight(.semibold)
                .padding()
                .background(RoundedRectangle(cornerRadius: 100).fill(color.opacity(1)))
            
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(text: "テキスト", color: .blue)
    }
}
