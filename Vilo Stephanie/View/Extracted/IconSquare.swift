//
//  IconSquare.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 11/12/2021.
//

import SwiftUI

struct IconSquare: View {
    
    @State var symbol: String
    var size: CGFloat = 80
   
    var body: some View {
        
        Image(systemName: symbol)
            .foregroundColor(.white)
            .font(.system(size: 34))
            .frame(width: size, height: size)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .fill(Color("vilo")))
    }
}

struct IconSquare_Previews: PreviewProvider {
    static var previews: some View {
        IconSquare(symbol: "heart")
    }
}
