//
//  LocationDetailView.swift
//  MapApp
//
//  Created by David Cartwright on 2025-02-04.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    
    @Environment(LocationsViewModel.self) private var vm
 
    let location: Location
    
    var body: some View {
        ScrollView {
            VStack {
                
                imageSection
                    
                VStack(alignment: .leading, spacing: 16) {
                    titleSection
                    Divider()
                    descriptionSection
                    Divider()
                    mapLayer
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
        .ignoresSafeArea()
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            backButton
        }
    }
    
    private var imageSection: some View {
        TabView {
            ForEach(location.imageNames, id: \.self) {
                Image($0)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIDevice.current.userInterfaceIdiom == .pad ? nil : UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height: 500)
        .tabViewStyle(PageTabViewStyle())
        .shadow(
            color: Color.black.opacity(0.3),
            radius: 20,
            x: 0,
            y: 10
        )
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title3)
                .foregroundStyle(.secondary)
        }
    }
    
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.description)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .tint(.blue)
            }
        }
    }
    
    private var mapLayer: some View {
        
        Map(position: .constant(
            MapCameraPosition.region(MKCoordinateRegion(
                center: location.coordinates,
                span: MKCoordinateSpan(
                    latitudeDelta: 0.01,
                    longitudeDelta: 0.01
                )
            )
        ))) {
            
            Annotation("", coordinate: location.coordinates) {
                LocationMapAnnotationView()
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
    
    private var backButton: some View {
        
        Button {
            vm.sheetLocation = nil
        } label: {
            Image(systemName: "xmark")
                .font(.headline)
                .padding(16)
                .tint(.secondary)
                .background(.thickMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 4)
                .padding()
        }

        
    }
    
}

#Preview {
    LocationDetailView(location: Developer.shared.locationVm.locations.first!)
        .environment(Developer.shared.locationVm)
}
