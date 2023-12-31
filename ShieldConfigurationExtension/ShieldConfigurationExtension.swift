//
//  ShieldConfigurationExtension.swift
//  ShieldConfigurationExtension
//
//  Created by Genki on 9/25/23.
//

import ManagedSettings
import ManagedSettingsUI
import UIKit

fileprivate let imageName = "shield_image"
class ShieldConfigurationExtension: ShieldConfigurationDataSource {
    override func configuration(shielding application: Application) -> ShieldConfiguration {
        // Customize the shield as needed for applications.

        return ShieldConfiguration(
            backgroundColor: .white,
            icon: UIImage(named: imageName),
            title: ShieldConfiguration.Label(text: String(localized: "Blocked by\nAppBlockTimer"), color: .black),
            primaryButtonLabel: ShieldConfiguration.Label(text: String(localized: "Dismiss"), color: .white)
        )
    }
    
    override func configuration(shielding application: Application, in category: ActivityCategory) -> ShieldConfiguration {
        // Customize the shield as needed for applications shielded because of their category.
        ShieldConfiguration()
    }
    
    override func configuration(shielding webDomain: WebDomain) -> ShieldConfiguration {
        // Customize the shield as needed for web domains.
        ShieldConfiguration()
    }
    
    override func configuration(shielding webDomain: WebDomain, in category: ActivityCategory) -> ShieldConfiguration {
        // Customize the shield as needed for web domains shielded because of their category.
        ShieldConfiguration()
    }
}
