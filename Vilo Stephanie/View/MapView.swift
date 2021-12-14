//
//  MapView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 12/12/2021.
//

import SwiftUI
import MapKit
import CoreLocationUI

struct MapView: View {
    
    //@StateObject private var viewModel = MapViewModel()
    @EnvironmentObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Map(coordinateRegion: $viewModel.region,
                showsUserLocation: true,
                annotationItems: viewModel.filteredPlaces) {
                place in

                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: place.placemark.location?.coordinate.latitude ?? 48.86, longitude: place.placemark.location?.coordinate.longitude ?? 2.33)) {
                    
                    MarkerView()
                        .onTapGesture {
                            viewModel.activeContent = .detail
                        }
                }
            }
                .ignoresSafeArea()
            
            VStack {
                Button(
                    action: {},
                    label: { IconSquare(symbol: "bicycle") })
                
                LocationButton(.currentLocation) {
                    viewModel.permissionMap()//.requestAllowOnceLocationPermission()
                }
                .font(.system(size: 35))
                .foregroundColor(.white)
                .cornerRadius(15)
                .tint(Color("vilo"))
                .labelStyle(.iconOnly)
                .symbolVariant(.fill)
            }
            .padding(.trailing)
            .padding(.bottom, 80)
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
            .environmentObject(MainViewModel())
    }
}
