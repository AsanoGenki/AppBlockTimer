//
//  StartView.swift
//  AppBlockTimer
//
//  Created by Genki on 9/24/23.
//

import SwiftUI
import FamilyControls

struct AuthorizationView: View {
    @AppStorage("authority") var authority = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 60) {
            
            VStack {
                Text("Give AppBlockTimer permission to block apps")
                    .font(.system(size: 32))
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                
                Text("With this permission we can block all the apps")
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .padding(.top, 2)
            }
            Spacer()
            
            Image("startview_image")
                .resizable()
                .scaledToFill()
                .frame(width: 320, height: 170)
            
            Spacer()
            
            Button {
                Task {
                    await authorize()
                }
            } label: {
                ButtonView(text: "Give permission", color: .blue)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 30)
        .padding(.vertical, 30)
    }
    
    func authorize() async {
        do {
            try await AuthorizationCenter.shared.requestAuthorization(for: .individual)
            authority = true
        } catch {
            authority = false
        }
    }
    
}

struct AuthorizationView_Previews: PreviewProvider {
    static let language: [String]  = ["en","ja"]
    
    static var previews: some View {
        ForEach(language, id: \.self) { languageID in
            AuthorizationView()
                .previewDisplayName("Language(\(languageID))")
                .environment(\.locale, .init(identifier: languageID))
        }
    }
}
