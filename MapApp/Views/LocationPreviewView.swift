//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by David Cartwright on 2025-02-03.
//

import SwiftUI

struct LocationPreviewView: View {
    
    @Environment(LocationsViewModel.self) private var vm
    
    let location: Location
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            
            VStack(spacing: 8) {
                learnMoreButton
                nextButton
            }
        }
        .padding(20)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.ultraThinMaterial)
            .offset(y: 65)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        )
            
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack {
            
            if let image = location.imageNames.first {
                Image(image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .padding(6)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var learnMoreButton: some View {
        Button {
            vm.sheetLocation = location
        } label: {
            Text("Learn more")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.borderedProminent)
    }
    
    private var nextButton: some View{
        Button {
            vm.nextButtonPressed()
        } label: {
            Text("Next")
                .font(.headline)
                .frame(width: 125, height: 35)
        }
        .buttonStyle(.bordered)
    }
}


#Preview {
    ZStack {
        Color.green.opacity(0.8).ignoresSafeArea() //just to see everything better
        LocationPreviewView(location: Developer.shared.locationVm.locations.first!)
            .environment(Developer.shared.locationVm)
    }
}
