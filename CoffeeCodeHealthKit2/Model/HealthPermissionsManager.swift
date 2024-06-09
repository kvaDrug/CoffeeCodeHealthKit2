//
//  HealthPermissionsManager.swift
//  CoffeeCodeHealthKit1
//
//  Created by Uladzimir on 31.05.24.
//

import HealthKit

/// ObservableObject that manages premission request and udpates
/// the UI accordingly.
final class HealthPermissionsManager: ObservableObject {
    let health = HKHealthStore()
    
    @Published private(set)
    var permissionStatus = PermissionStatus.unknown
    
    func requestAccess(
        typesToRead: Set<HKObjectType> = HealthConstants.typesToRead,
        typesToWrite: Set<HKSampleType> = HealthConstants.typesToWrite,
        completion: (() -> Void)?) {
            
        let healthStore = HKHealthStore()
        healthStore.requestAuthorization(toShare: typesToWrite, read: typesToRead) { (success, error) in
            DispatchQueue.main.async {
                if error == nil {
                    self.permissionStatus = .requested
                }
                completion?()
            }
        }
    }
    
    func updatePermissionStatus() {
        health.getRequestStatusForAuthorization(
            toShare: [],
            read: HealthConstants.typesToRead) { requestStatus, error in
                guard error == nil else { return }
                DispatchQueue.main.async {
                    self.permissionStatus = PermissionStatus(requestStatus)
                }
            }
    }
}

