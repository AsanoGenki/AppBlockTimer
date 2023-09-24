//
//  AppBlockViewModel.swift
//  AppBlockTimer
//
//  Created by Genki on 9/24/23.
//

import SwiftUI
import FamilyControls

class AppBlockViewModel: ObservableObject {
    @AppStorage("blockAppSelecton") var blockAppSelecton = FamilyActivitySelection()
    var model:AppBlockModel = AppBlockModel()
    
    func blockApp() {
        model.blockApp()
    }
    
    func unBlockApp() {
        model.unBlockApp()
    }
}
