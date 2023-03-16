//
//  LocationsViewModel.swift
//  SwiftMapApp
//
//  Created by Yomi on 3/11/23.
//

import SwiftUI
import Foundation
import MapKit

class LocationsViewModel: ObservableObject{
    
    //all loaded locations
    @Published var locations: [Location]
    
    //on click of a location, only one location will be loaded per time
    @Published var mapLocation: Location{
        //anytime user update mapLocation, it should automatically update the region too
        didSet{
            updateMapRegion(location: mapLocation)
        }
    }
    
    // current region on the map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // show list of Locations
    @Published var showLocationList: Bool = false
    
    //show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    
    func updateMapRegion(location: Location) {
        withAnimation(.easeInOut) {
            mapRegion = MKCoordinateRegion(
                center: location.coordinates,
                span: mapSpan)
        }
    }
    
    func toggleLocationList(){
        withAnimation(.easeInOut){
            showLocationList.toggle()
        }
    }
    
    func updateLocation(location: Location) {
        withAnimation(.easeInOut){
            mapLocation = location
            showLocationList = false
        }
    }
    
    func nextButtonPressed(){
        //Get the current index
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation }) else{
            return
        }
        
        //check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else{
            //Next index is not valid
            //Restart from index 0
            guard let firstLocation = locations.first else{ return }
            updateLocation(location: firstLocation)
            return
        }
        
        //Next index is valid
        let nextLocation = locations[nextIndex]
        updateLocation(location: nextLocation)
    }
}
