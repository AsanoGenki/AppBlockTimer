//
//  AppBlockModel.swift
//  AppBlockTimer
//
//  Created by Genki on 9/24/23.
//

import SwiftUI
import FamilyControls
import ManagedSettings

class AppBlockModel: ObservableObject {
    @AppStorage("blockAppSelecton") var blockAppSelecton = FamilyActivitySelection()
    
    func blockApp(){
        ManagedSettingsStore(named: ManagedSettingsStore.Name("AppBlockTimer")).shield.applications = blockAppSelecton.applicationTokens
    }
    
    func unBlockApp() {
        ManagedSettingsStore(named: ManagedSettingsStore.Name("AppBlockTimer")).clearAllSettings()
    }
}
