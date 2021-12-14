//
//  FilterView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 11/12/2021.
//

import SwiftUI

struct FilterView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    
    @State private var fav = false
    @State private var value: Double = 10
    
    var body: some View {
        VStack {
            
            ZStack(alignment: .leading) {
                Rectangle().foregroundColor(Color(.systemGray6))
                HStack {
                    Image(systemName: "magnifyingglass.circle.fill")
                        .foregroundColor(Color("vilo"))
                        .font(.system(size: 30))
                    Text("Search ...")
                }
                .foregroundColor(.gray)
                .padding()
            }
            .frame(height:44)
            .cornerRadius(15)
            .padding()
            .onTapGesture { viewModel.onEvent(.search) }
            
            Form {
                Section(header: Text("Favoris").foregroundColor(.black)) {
                    HStack {
                        //TODO: List de buttons
                        Button(
                            action: {},
                            label: {
                                Image(systemName: "plus.circle")
                                    .foregroundColor(Color("vilo"))
                                    .font(.system(size: 44))
                            })
                        IconCircle(symbol: "plus")
                    }
                }
                
                Section(header: Text("Préférences").foregroundColor(.black)) {
                    VStack {
                        TogglePrimary(isOn: $fav, text: "Vélo personnel")
                        TogglePrimary(isOn: $fav, text: "Vélib'")
                        TogglePrimary(isOn: $fav, text: "Lime")
                    }
                }
                
                Section(header: Text("Balade").foregroundColor(.black)) {
                    Slider(
                        value: $value, in: 0...100,
                        minimumValueLabel: Text("min"), maximumValueLabel: Text("max"), label: { Text("ERT")})
                        .accentColor(Color("vilo"))
                }
                
                Btn(text: "Valider")
            } // Form
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
