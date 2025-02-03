//
//  ContentView.swift
//  MapApp
//
//  Created by David Cartwright on 2025-02-03.
//

import SwiftUI
import MapKit



struct LocationsView: View {
    
    @Environment(LocationsViewModel.self) private var vm
    
    var body: some View {
        ZStack {
            Map(initialPosition: MapCameraPosition.region(vm.mapRegion))
            
        }
    }
}

#Preview {
    LocationsView()
        .environment(Developer.shared.locationVm)
}
