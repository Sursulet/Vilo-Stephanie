//
//  StationDetailView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 12/12/2021.
//

import SwiftUI

struct StationDetailView: View {
    var body: some View {
        VStack {
            HStack {
                Label(title: { Text(" vélos") }, icon: { IconCircle(symbol: "bicycle") })
                Label(title: { Text(" vélos") }, icon: { IconCircle(symbol: "bolt") })
                Label(title: { Text(" vélos") }, icon: { IconCircle(symbol: "parkingsign") })
            }
            
            Image(systemName: "heart")
        }
    }
}

struct StationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StationDetailView()
    }
}
