//
//  PermissionView.swift
//  CoffeeCodeHealthKit2
//
//  Created by Uladzimir on 9.06.24.
//

import SwiftUI

struct PermissionView: View {
    @EnvironmentObject var healthPermissions: HealthPermissionsManager
    
    var body: some View {
        VStack {
            logo
            Spacer()
            if healthPermissions.permissionStatus == .notRequested {
                permissionsButton
            } else {
                Text("You can edit permissions in Health app.")
            }
            Spacer()
        }
        .padding()
        .onAppear {
            healthPermissions.updatePermissionStatus()
        }

    }
    
    var logo: some View {
        Image(systemName: "heart.text.square.fill")
            .font(.system(size: 100))
            .foregroundColor(.pink)
    }
    
    var permissionsButton: some View {
        Button("Ask Permissions") {
            healthPermissions.requestAccess(completion: nil)
        }
        .font(.system(size: 20, weight: .semibold))
        .foregroundColor(.white)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.blue)
        )
    }
}

#Preview {
    PermissionView()
}
