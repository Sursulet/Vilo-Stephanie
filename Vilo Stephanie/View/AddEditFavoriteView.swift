//
//  AddEditFavoriteView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 12/12/2021.
//

import SwiftUI

struct AddEditFavoriteView: View {
    var body: some View {
        VStack {
            //
            
            HStack {
                Button(action: {}, label: {
                    IconSquare(symbol: "heart")
                })
            }
            
            Btn(text: "Ajouter")
        }
    }
}

struct AddEditFavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        AddEditFavoriteView()
    }
}
