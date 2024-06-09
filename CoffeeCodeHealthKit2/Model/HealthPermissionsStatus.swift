//
//  HealthPermissionsStatus.swift
//  CoffeeCodeHealthKit1
//
//  Created by Uladzimir on 1.06.24.
//

import HealthKit

/// Note that we can't know exactly if user allowed permissions or not by HealthKit rules.
/// We can only check if the permissions was asked.
enum PermissionStatus {
    case unknown, notRequested, requested
    
    var isRequesed: Bool {
        self == .requested
    }
    
    init(_ requestStatus: HKAuthorizationRequestStatus) {
        switch requestStatus {
        case .unknown:
            self = .unknown
        case .shouldRequest:
            self = .notRequested
        case .unnecessary:
            self = .requested
        @unknown default:
            self = .unknown
        }
    }
}
