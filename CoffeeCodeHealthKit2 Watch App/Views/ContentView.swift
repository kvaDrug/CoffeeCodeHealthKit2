//
//  PermissionView.swift
//  CoffeeCodeHealthKit2 Watch App
//
//  Created by Uladzimir on 9.06.24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            PersonalDataView()
            WorkoutView()
        }
    }
}

#Preview {
    ContentView()
}
