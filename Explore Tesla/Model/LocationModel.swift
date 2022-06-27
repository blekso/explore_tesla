//
//  LocationModel.swift
//  Explore Tesla
//
//  Created by Mihael Ištvan on 14.05.2022..
//

import Foundation
import MapKit

struct SaloonLocation: Codable, Identifiable {
    var id: String
    var name: String
    var image: String
    var latitude: Double
    var longitude: Double
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
