//
//  Btn.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 11/12/2021.
//

import SwiftUI

/*
 HIG: 44pt - font size 19pt
 56pt - 24pt
 */
struct Btn: View {
    
    @State var text:String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .font(.system(size: 19))
            .frame(minWidth: 280, minHeight: 44)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color("vilo")))
    }
}

struct Btn_Previews: PreviewProvider {
    static var previews: some View {
        Btn(text: "Ajoutez")
    }
}
