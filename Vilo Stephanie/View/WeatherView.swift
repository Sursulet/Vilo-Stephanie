//
//  WeatherView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 11/12/2021.
//

import SwiftUI

struct WeatherView: View {
    
    //TODO: créer un enum weather hour pour chaque instant
    var weather: [WeatherElement] = load("weather.json")
    var body: some View {
        VStack {
            Text("\(weather[0].geometry.type)")
            Text("Météo du 11 décambre 2021")
            Image(systemName: "cloud.sun.rain")
            
            List {
                WeatherRow()
            }
        }
    }
}

struct WeatherView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
