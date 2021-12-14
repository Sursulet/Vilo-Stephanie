//
//  ProfileRowView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 11/12/2021.
//

import SwiftUI

struct ProfileRow: View {
    
    @State var text:String
    @State var type:String
    
    var body: some View {
        HStack {
            Text(text)
            Spacer()
            Text(type)
                .foregroundColor(Color(.systemGray))
        }
    }
}

struct ProfileRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRow(text: "Mon domicile", type: "7 rue des plantes")
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
