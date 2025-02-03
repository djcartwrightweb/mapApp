//
//  LocationsViewModel.swift
//  MapApp
//
//  Created by David Cartwright on 2025-02-03.
//

import Foundation
import MapKit
import SwiftUI

@Observable
class LocationsViewModel {
    //All loaded locations
    var locations: [Location]
    
    //Current location on map
    var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
            updateMapPosition()
        }
    }
    
    //current region on map
    var mapRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    var mapPosition = MapCameraPosition.region(MKCoordinateRegion())

    
    //show list of locations
    var showLocationsList: Bool = false
    
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        self.updateMapRegion(location: locations.first!)
        self.updateMapPosition()
    }
    
    private func updateMapRegion(location: Location) {
        withAnimation {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan
            )
        }
    }
    
    private func updateMapPosition() {
        withAnimation(.easeInOut) {
            mapPosition = MapCameraPosition.region(mapRegion)
        }
    }
    
    func toggleLocationsList() {
        withAnimation(.easeInOut) {
            showLocationsList = !showLocationsList
        }
    }
    
    func showNextLocation(location: Location) {
        withAnimation {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed() {
        //get the current index
        guard let currentIndex = locations.firstIndex(where: {$0 == mapLocation}) else {return}
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            showNextLocation(location: locations.first!)
            return
        }
        showNextLocation(location: locations[nextIndex])
    }
}
