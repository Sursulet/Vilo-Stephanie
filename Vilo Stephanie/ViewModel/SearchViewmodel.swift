//
//  SearchViewmodel.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 13/12/2021.
//

import Foundation
import MapKit

final class SearchViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    
    
    
    
    
    
//    var locationManager = CLLocationManager()
//
//    override init() {
//        super.init()
//        locationManager.delegate = self
//    }
//
//    func requestAllowOnceLocationPermission() {
//        locationManager.requestLocation()
//    }
//
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        guard let latestLocation = locations.first else { return }
//
//        DispatchQueue.main.async {
//            self.region = MKCoordinateRegion(
//                center: latestLocation.coordinate,
//                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
//        }
//    }
//
//    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
//        print(error.localizedDescription)
//    }
}
