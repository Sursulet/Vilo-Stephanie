//
//  SearchView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 12/12/2021.
//

import SwiftUI
import CoreLocationUI

struct SearchView: View {
    
    @StateObject var viewmodel = SearchViewModel()
    @State var search: String = ""
    @State var isActive: Bool = false
    
    var body: some View {
        //NavigationView {
            //TODO:
            VStack {
                ZStack {
                    Rectangle().foregroundColor(Color(.systemGray6))
                    HStack {
                        Image(systemName: "magnifyingglass").foregroundColor(Color("vilo"))
                        Text(isActive ? "Départ" : "Arrivée").foregroundColor(Color("vilo"))
                        TextField("Search ...", text: $viewmodel.query)
                        Button(
                            action: { isActive.toggle() },
                            label: { IconCircle(symbol: "arrow.uturn.up").tint(.white) })
                    }
                    .foregroundColor(.gray)
                    .padding()
                }
                .frame(height:40)
                .cornerRadius(13)
                .padding()
                
                if !viewmodel.places.isEmpty && viewmodel.query != "" {
                    ScrollView {
                        VStack(spacing: 15) {
                            ForEach(viewmodel.places) { place in
                                Text(place.placemark.name ?? "")
                                    .foregroundColor(.black)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Text(place.address)
                            }
                        }
                    }
                }
                
                HStack {
                    LocationButton(.currentLocation) {
                        viewmodel.requestAllowOnceLocationPermission()
                    }
                }
                
                List {
                    Text("Place du Charbon")
                    Text("Stade de France")
                }
                
                Text("Recherche à proximité")
                Label(
                    title: { Text("parkings")},
                    icon: {
                        Image(systemName: "parkingsign.circle.fill")
                            .foregroundColor(Color("vilo")) })
                
                // Préférences comme dans filterview
            }
            .onChange(of: viewmodel.query, perform: { value in
                let delay = 0.3
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    if value == viewmodel.query {
                        self.viewmodel.searchQuery()
                    }
                }
            })
        //}
    } // body
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
