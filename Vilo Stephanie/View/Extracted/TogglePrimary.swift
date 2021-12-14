//
//  TogglePrimary.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 11/12/2021.
//

import SwiftUI

struct TogglePrimary: View {
    
    @Binding var isOn: Bool
    @State var text: String
    
    var body: some View {
        Toggle(text, isOn: $isOn)
            .toggleStyle(SwitchToggleStyle(tint: Color("vilo")))
    }
}

struct TogglePrimary_Previews: PreviewProvider {
    static var previews: some View {
        TogglePrimary(isOn: .constant(true), text: "Vélo personnel")
            .previewLayout(.fixed(width: 390, height: 100))
    }
}
