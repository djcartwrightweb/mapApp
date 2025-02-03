//
//  ContentView.swift
//  MapApp
//
//  Created by David Cartwright on 2025-02-03.
//

import SwiftUI
import MapKit



struct LocationsView: View {
    
    @Bindable private var vm: LocationsViewModel
    
    
    init(vm: LocationsViewModel) {
        self.vm = vm
    }
    
    
    var body: some View {
        ZStack {
            Map(position: $vm.mapPosition)
                
            
            VStack(spacing: 0) {
                
                header
                    .padding()
                
                Spacer()
                
                
            }
        }
    }
}

#Preview {
    LocationsView(vm: Developer.shared.locationVm)
        .environment(Developer.shared.locationVm)
}


extension LocationsView {
    
    private var header: some View {
        
        VStack {
            
            Button {
                vm.toggleLocationsList()
            } label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .transaction { transaction in
                        transaction.animation = nil
                    }
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundStyle(Color.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading, content: {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundStyle(Color.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? -180 : 0))
                    })
            }

            
                
                //more content to go here
            if vm.showLocationsList {
                LocationsListView()
            }
            
                }
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(
                    color: Color.black.opacity(0.3),
                    radius: 20,
                    x: 0,
                    y: 15
                )
            
            
    }
    
}
