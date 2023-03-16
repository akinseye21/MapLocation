//
//  Location.swift
//  SwiftMapApp
//
//  Created by Yomi on 3/11/23.
//

import Foundation
import MapKit

//every location needs thes information
struct Location: Identifiable, Equatable{
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    var id: String{
        name + cityName
    }
    
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
