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
    
    @StateObject private var viewModel = MapViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
                .ignoresSafeArea()
            
            VStack {
                Button(
                    action: {},
                    label: { IconSquare(symbol: "bicycle") })
                
                LocationButton(.currentLocation) {
                    viewModel.requestAllowOnceLocationPermission()
                }
                //.foregroundColor(.white)
                //.cornerRadius(8)
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
    }
}
