//
//  Developer.swift
//  MapApp
//
//  Created by David Cartwright on 2025-02-03.
//

import Foundation

class Developer {
    static let shared = Developer()
    let locationVm: LocationsViewModel
    
    
    private init() {
        self.locationVm = LocationsViewModel()
    }
    
    
}
