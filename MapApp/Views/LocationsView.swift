//
//  ContentView.swift
//  MapApp
//
//  Created by David Cartwright on 2025-02-03.
//

import SwiftUI



struct LocationsView: View {
    
    @Environment(LocationsViewModel.self) private var vm
    
    var body: some View {
        VStack {
            List {
                ForEach(vm.locations) {
                    Text($0.name)
                }
            }.listStyle(.inset)
        }
        .padding()
    }
}

#Preview {
    LocationsView()
        .environment(Developer.shared.locationVm)
}
