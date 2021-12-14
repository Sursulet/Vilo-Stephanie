//
//  SearchViewmodel.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 13/12/2021.
//

import Foundation
import MapKit

final class SearchViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    @Published var query: String = ""
    @Published var places: [Place] = []
    
    func searchQuery() {
        
        places.removeAll()
        
        let request = MKLocalSearch.Request()
        request.naturalLanguageQuery = query

        // Set the region to an associated map view's region.
        //request.region = myMapView.region

        let search = MKLocalSearch(request: request)
        search.start { (response, error) in
            guard let response = response else { return }
            
            self.places = response.mapItems.compactMap({ (item) -> Place? in
                return Place(placemark: item.placemark, address: item.placemark.title ?? "")
            })
            
//            for item in response.mapItems {
//                if let name = item.name,
//                    let location = item.placemark.location {
//                    print("\(name): \(location.coordinate.latitude),\(location.coordinate.longitude)")
//                }
//            }
        }
    }
    
    func selectPlace(place: Place) {
        query = ""
        
        guard let coordinate = place.placemark.location?.coordinate else { return }
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        annotation.title = place.placemark.name ?? "No Name"
        
        //mapView?.addAnnotation(annotation)
    }
    
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
}
