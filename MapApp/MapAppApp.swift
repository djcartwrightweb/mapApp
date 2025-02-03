//
//  MapAppApp.swift
//  MapApp
//
//  Created by David Cartwright on 2025-02-03.
//

import SwiftUI

@main
struct MapAppApp: App {
    
    @State private var viewModel = LocationsViewModel()
    
    var body: some Scene {
        WindowGroup {
            LocationsView(vm: viewModel)
                .environment(viewModel)
        }
    }
}

//Developer singleton for viewmodel for previes
//@Observable
//Map updated to ios 18
