//
//  RideDetail1View.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 12/12/2021.
//

import SwiftUI

struct RideDetail1View: View {
    //TODO: deskclock.fill 
    var body: some View {
        VStack {
            HStack {
                Label(
                    title: {
                        VStack {
                            Text("Arrivée")
                            Text("h")
                        }},
                    icon: {Image(systemName: "mappin.and.ellipse").foregroundColor(.red)})
            }
        }
    }
}

struct RideDetail1View_Previews: PreviewProvider {
    static var previews: some View {
        RideDetail1View()
    }
}
