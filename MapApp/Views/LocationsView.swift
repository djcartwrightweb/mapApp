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
            
            mapLayer
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                
                header
                    .padding()
                
                Spacer()
                
                locationsPreviewStack
            }
        }
        .sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
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
    
    private var mapLayer: some View {
        Map(position: $vm.mapPosition) {
            ForEach(vm.locations) { location in
                Annotation("", coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .shadow(radius: 10)
                        .scaleEffect(vm.mapLocation == location ? 1 : 0.7)
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                }
            }
        }
    }
    
    private var locationsPreviewStack: some View {
        ZStack {
            ForEach(vm.locations) { location in
                if vm.mapLocation == location {
                    LocationPreviewView(location: location)
                        .shadow(radius: 20)
                        .padding()
                        .transition(.scale(scale: 0.2))
                }
            }
        }
    }
    
}
