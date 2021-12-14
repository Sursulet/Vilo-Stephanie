//
//  MainViewModel.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 13/12/2021.
//

import Foundation
import SwiftUI
import MapKit

final class MainViewModel: ObservableObject {
    
    var height: CGFloat = 0
    
    @Published var offset: CGFloat = 0
    @Published var lastOffset: CGFloat = 0
    @Published var activeContent: ActiveContent = .filter
    
    var manager = LocationManager()
    
    @Published var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 48.866667, longitude: 2.333333),
        span: MKCoordinateSpan(latitudeDelta: 50, longitudeDelta: 50))
    
    @Published var filteredPlaces: [Place] = []
    @Published var stations: [String] = []
    
    @Published var query: String = ""
    @Published var places: [Place] = []
    @Published var selectedStation: Station = Station(bike: 0, vae: 0, place: 0)
    
    func onChange(_ gestureOffset: CGFloat) {
        DispatchQueue.main.async {
            self.offset = gestureOffset + self.lastOffset
        }
    }
    
    func onEnd() {
        let maxHeight = height - 100
        
        withAnimation {
            if -offset > 100 && -offset < maxHeight / 2 {
                offset = -(maxHeight / 3)
            }
            else if -offset > maxHeight / 2 {
                offset = -maxHeight
            }
            else {
                offset = 0
            }
        }
        
        lastOffset = offset
    }
    
    func getOffset() -> CGFloat {
        let result = -offset > 0 ? -offset <= (height - 100) ? offset : -(height - 100) : 0
        return result
    }
    
    func onEvent(_ value: ActiveContent) {
        activeContent = value
    }
    
    func test() -> CGFloat {
        return offset < (height - 100) ? offset : (height - 100)
    }
    
    /* Map */
    func permissionMap() {
        manager.requestAllowOnceLocationPermission()
        region = manager.region
    }
    
    func selectedStation(place: Place) {
        // place en station recherche id
        //selectedStation =
    }
    
    /* Nerby Places Vélib & Lime */
    /* Filter Map */
    
    /* Search Place */
    
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
        
        filteredPlaces.append(place)
        //mapView.remmoveAnnotations(mapView?.annotations)
        //mapView?.addAnnotation(annotation)
    }
}
