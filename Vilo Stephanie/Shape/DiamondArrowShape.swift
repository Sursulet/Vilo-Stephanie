//
//  DiamondArrowShape.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 14/12/2021.
//

import SwiftUI

struct DiammondArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let mid = width / 2
        let path = UIBezierPath()
        
        // bottom left
        path.move(to: CGPoint(x: mid, y: -1))
        
        path.addLine(to: CGPoint(x: mid + 5, y: -1))
        
        path.addLine(to: CGPoint(x: mid + 5, y: height - 15))
        path.addLine(to: CGPoint(x: mid + 10, y: height - 10))
        path.addLine(to: CGPoint(x: mid, y: height))
        path.addLine(to: CGPoint(x: mid - 10, y: height - 10))
        path.addLine(to: CGPoint(x: mid - 5, y: height - 15))
        
        path.addLine(to: CGPoint(x: mid - 5, y: -1))
        
        return Path(path.cgPath)
    }
}
