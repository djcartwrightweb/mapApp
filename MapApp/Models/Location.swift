//
//  Location.swift
//  MapApp
//
//  Created by David Cartwright on 2025-02-03.
//

import Foundation
import SwiftUI
import MapKit

struct Location: Identifiable, Equatable {
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String {
        name + cityName
    }
    
    var region: MKCoordinateRegion {
        MKCoordinateRegion(center: self.coordinates, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        return lhs.id == rhs.id
    }
}
