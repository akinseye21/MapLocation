//
//  LocationsView.swift
//  SwiftMapApp
//
//  Created by Yomi on 3/11/23.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    
    @EnvironmentObject var vm: LocationsViewModel
    
    var body: some View {
        ZStack{
            //Map(coordinateRegion: $vm.mapRegion)
            mapLayer
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 0){
                header
                Spacer()
                locationsPreviewStack
            }
        }.sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
        
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}

extension LocationsView{
    
    private var header: some View{
        
        VStack {
            Button {
                vm.toggleLocationList()
            } label: {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading) {
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            //rotate the arrow
                            .rotationEffect(Angle(degrees: vm.showLocationList ? 180 : 0))
                            .padding(.leading)
                    }
            }
            if vm.showLocationList{
                LocationListView()
            }
                
        }
        .background(.ultraThinMaterial)
        .cornerRadius(10)
        .padding()
        .shadow(color: Color.black.opacity(0.4), radius: 10, x: 0, y: 10)
            
        
    }
    
    private var mapLayer: some View{
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .scaleEffect(vm.mapLocation == location ? 1 : 0.5)
                    .shadow(radius: 10)
                    .onTapGesture {
                        vm.updateLocation(location: location)
                    }
            }
        })
    }
    
    private var locationsPreviewStack: some View{
        ZStack{
            ForEach(vm.locations) { location in
                if vm.mapLocation == location{
                    LocationPreviewView(location: location)
                        .shadow(color: Color.black.opacity(0.3),radius: 20)
                        .padding()
                        .transition(.asymmetric(
                            insertion: .move(edge: .trailing),
                            removal: .move(edge: .leading)))
                }
                
            }
        }

    }
}
