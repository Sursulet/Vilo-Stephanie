//
//  ProfileView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 11/12/2021.
//

import SwiftUI

struct ProfileView: View {
    
    //TODO: créer une structure user avec ses paramètres
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: FavoritesListView()) {
                    ProfileRow(text: "Mon domicile", type: "7 rue des plantes")
                }
                NavigationLink(destination: FavoritesListView()) {
                    ProfileRow(text: "Mon travail", type: "Palais de l'Elysée")
                }
                NavigationLink(destination: FavoritesListView()) {
                    ProfileRow(text: "Type de vélo préféré", type: "Mon vélo perso")
                }
                NavigationLink(destination: FavoritesListView()) {
                    ProfileRow(text: "Mode de trajet préféré", type: "Rapide")
                }
                NavigationLink(destination: FavoritesListView()) {
                    Text("Mes destinations favorites")
                }
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
