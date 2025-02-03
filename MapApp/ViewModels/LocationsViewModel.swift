//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by David Cartwright on 2025-02-03.
//

import Foundation

@Observable
class LocationsViewModel {
    var locations: [Location]
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}
