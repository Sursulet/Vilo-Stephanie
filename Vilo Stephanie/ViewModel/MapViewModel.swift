//
//  MapViewModel.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 12/12/2021.
//

import Foundation
import MapKit
import CoreLocation

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.866667, longitude: 2.333333),
        span: MKCoordinateSpan(latitudeDelta: 100, longitudeDelta: 100))
    
    var locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.delegate = self
    }
    
    func requestAllowOnceLocationPermission() {
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let latestLocation = locations.first else { return }
        
        DispatchQueue.main.async {
            self.region = MKCoordinateRegion(
                center: latestLocation.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
//    func checkIfLocationServicesIsEnabled() {
//
//        if CLLocationManager.locationServicesEnabled() {
//            locationManager = CLLocationManager()
//            checkLocationAuthorization()
//            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
//        } else {
//            print("Show an alert")
//        }
//    }
//
//    func checkLocationAuthorization() {
//        guard let locationManager = locationManager else { return }
//
//        switch locationManager.authorizationStatus {
//
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted:
//            print("Your location is restricted likely due")
//        case .denied:
//            print("You have denied")
//        case .authorizedAlways, .authorizedWhenInUse:
//            break
//        @unknown default:
//            break
//        }
//    }
    
}
