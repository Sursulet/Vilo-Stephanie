//
//  MarkerView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 14/12/2021.
//

import SwiftUI

struct MarkerView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 0) {
            Image(systemName: "bicycle.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 58, height: 58)
                .foregroundColor(Color("orange"))
            DiammondArrowShape()
                .fill(Color("orange"))
        }
        .frame(width: 100, height: 150)
    }
}

struct MarkerView_Previews: PreviewProvider {
    static var previews: some View {
        MarkerView()
            .previewLayout(.sizeThatFits)
    }
}
