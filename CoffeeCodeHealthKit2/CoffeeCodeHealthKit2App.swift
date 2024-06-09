//
//  CoffeeCodeHealthKit2App.swift
//  CoffeeCodeHealthKit2
//
//  Created by Uladzimir on 9.06.24.
//

import SwiftUI

@main
struct CoffeeCodeHealthKit2App: App {
    var body: some Scene {
        WindowGroup {
            PermissionView()
                .environmentObject(HealthPermissionsManager())
        }
    }
}
