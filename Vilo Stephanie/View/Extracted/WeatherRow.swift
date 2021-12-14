//
//  WeatherRow.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 11/12/2021.
//

import SwiftUI

struct WeatherRow: View {
    var body: some View {
        HStack {
            Text("4h-6h")
            Spacer()
            Text("8°C")
            Spacer()
            Image(systemName: "cloud.fill")
        }
    }
}

struct WeatherRow_Previews: PreviewProvider {
    static var previews: some View {
        WeatherRow()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
