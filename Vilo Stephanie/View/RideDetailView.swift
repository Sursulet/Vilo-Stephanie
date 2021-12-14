//
//  RideDetailView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 12/12/2021.
//

import SwiftUI

struct RideDetailView: View {
    var body: some View {
        VStack {
            Btn(text: "5 minutes")
            
            List {
                Text("1,8km")
            }
        }
    }
}

struct RideDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RideDetailView()
    }
}
