//
//  RideEndView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 12/12/2021.
//

import SwiftUI

struct RideEndView: View {
    //TODO: double tap pour signaler une problème
    var body: some View {
        NavigationView {
            VStack {
                Text("Vous êtes arrivé !")
                    .font(.largeTitle)
                
                Text("Avez-vous eu un problème durant votre trajet ?")
                
                Btn(text: "Signaler")
            }
        }
    }
}

struct RideEndView_Previews: PreviewProvider {
    static var previews: some View {
        RideEndView()
    }
}
