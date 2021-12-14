//
//  Place.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 13/12/2021.
//

import Foundation
import CoreLocation

struct Place: Identifiable {
    
    var id = UUID().uuidString
    var placemark: CLPlacemark
    var address: String
}
