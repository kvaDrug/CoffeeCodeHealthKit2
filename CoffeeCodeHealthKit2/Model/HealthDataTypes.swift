//
//  HealthDataTypes.swift
//  CoffeeCodeHealthKit1
//
//  Created by Uladzimir on 31.05.24.
//

import HealthKit

enum HealthDataType {
    case quantity(HKQuantityTypeIdentifier)
    case activity
    case category(HKCategoryTypeIdentifier)
    case workout
    
    var objectType: HKObjectType {
        switch self {
        case .quantity(let id):
            return HKQuantityType.quantityType(forIdentifier: id)!
        case .activity:
            return HKObjectType.activitySummaryType()
        case .category(let id):
            return HKCategoryType(id)
        case .workout:
            return HKSeriesType.workoutType()
        }
    }
    
    var sampleType: HKSampleType? {
        switch self {
        case .quantity(let id):
            return HKQuantityType.quantityType(forIdentifier: id)!
        case .activity:
            return nil
        case .category(let id):
            return HKCategoryType(id)
        case .workout:
            return HKSeriesType.workoutType()
        }
    }
}

struct HealthConstants {
    static let typeIDsToRead: [HealthDataType] = [
        .quantity(.bodyMass),
        .workout
    ]
    
    static let typeIDsToWrite: [HealthDataType] = [
        .quantity(.bodyMass),
        .workout
    ]
    
    static var typesToRead: Set<HKObjectType> {
        Set(typeIDsToRead.map { $0.objectType })
    }
    
    static var typesToWrite: Set<HKSampleType> {
        Set(typeIDsToWrite.map { $0.sampleType! })
    }
}
