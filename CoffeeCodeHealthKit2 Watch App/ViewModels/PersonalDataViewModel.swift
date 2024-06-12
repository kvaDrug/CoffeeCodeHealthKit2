//
//  PersonalDataViewModel.swift
//  CoffeeCodeHealthKit2 Watch App
//
//  Created by Uladzimir on 9.06.24.
//

import HealthKit

class PersonalDataViewModel: ObservableObject {
    @Published
    var weight: Int = 0
    
    @Published
    var name: String = ""
    
    func incrementWeight() {
        weight += 1
    }
    
    func decrementWeight() {
        weight -= 1
    }
    
    func saveBodyWeight() {
        let store = HKHealthStore()
        let quantityType = HKObjectType.quantityType(forIdentifier: .bodyMass)!
        let quantity = HKQuantity(unit: .gramUnit(with: .kilo), doubleValue: Double(weight))
        let sample = HKQuantitySample(type: quantityType, quantity: quantity, start: Date(), end: Date().addingTimeInterval(10000))
        store.save(sample) { _, err in
            if let error = err {
                print("Weight save error:", error)
            }
        }
    }
}
