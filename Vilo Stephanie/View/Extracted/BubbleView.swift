//
//  BubbleView.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 11/12/2021.
//

import SwiftUI
    
struct BubbleView: View {
    var body: some View {
        VStack {
            Label(title: { Text("Heart") }, icon: { Image(systemName: "heart") })
            Label(title: { Text("Heart") }, icon: { Image(systemName: "heart") })
            Label(title: { Text("Heart") }, icon: { Image(systemName: "heart") })
        }
        .padding()
        .background(Color.blue)
        .clipShape(BubbleShape())
        .shadow(radius: 5)
    }
}

struct BubbleView_Previews: PreviewProvider {
    static var previews: some View {
        BubbleView()
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
