//
//  PersonalDataView.swift
//  CoffeeCodeHealthKit2 Watch App
//
//  Created by Uladzimir on 9.06.24.
//

import SwiftUI

struct PersonalDataView: View {
    @ObservedObject var viewModel = PersonalDataViewModel()
    
    
    var body: some View {
        VStack {
            TextField(
                "Enter Name",
                text: $viewModel.name)
            Stepper {
                Text("\(viewModel.weight) kg")
                    .font(.body)
                    } onIncrement: {
                        viewModel.incrementWeight()
                    } onDecrement: {
                        viewModel.decrementWeight()
                    }
            Button("Save to Health", action: viewModel.saveBodyWeight)
        }
    }
}

#Preview {
    PersonalDataView()
}
