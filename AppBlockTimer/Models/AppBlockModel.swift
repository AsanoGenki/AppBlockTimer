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
    
    func denyAppRemoval() {
        ManagedSettingsStore(named: ManagedSettingsStore.Name("AppBlockTimer")).application.denyAppRemoval = true
    }
    
    func undenyAppRemoval() {
        ManagedSettingsStore(named: ManagedSettingsStore.Name("AppBlockTimer")).application.denyAppRemoval = false
    }
}
