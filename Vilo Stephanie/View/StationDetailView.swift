//
//  StationDetailView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 12/12/2021.
//

import SwiftUI

struct StationDetailView: View {
    
    @Binding var station: Station
    
    var body: some View {
        VStack {
            HStack {
                Label(title: { Text("\(station.bike) vélos") }, icon: { IconCircle(symbol: "bicycle") })
                Label(title: { Text("\(station.vae) vae") }, icon: { IconCircle(symbol: "bolt") })
                Label(title: { Text("\(station.place) places") }, icon: { IconCircle(symbol: "parkingsign") })
            }
            
            Image(systemName: "heart")
        }
    }
}

struct StationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailView(station: .constant(Station(bike: 8, vae: 4, place: 14)))
    }
}
