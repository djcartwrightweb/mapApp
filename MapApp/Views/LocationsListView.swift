//
//  LocationsListView.swift
//  MapApp
//
//  Created by David Cartwright on 2025-02-03.
//

import SwiftUI

struct LocationsListView: View {
    
    @Environment(LocationsViewModel.self) private var vm
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                
                Button {
                    print(location.name)
                    vm.showNextLocation(location: location)
                } label: {
                    listRowView(location: location)
                }
                .padding(.vertical, 4)
                .listRowBackground(Color.clear)

                
            }
        }
        .listStyle(.plain)
    }
}

extension LocationsListView {
    
    private func listRowView(location: Location) -> some View {
        HStack {
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 45, height: 45)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.cityName)
                    .font(.subheadline)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
    
}

#Preview {
    LocationsListView()
        .environment(Developer.shared.locationVm)
}
