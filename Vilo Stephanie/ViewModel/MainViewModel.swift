//
//  MainViewModel.swift
//  Vilo Stephanie
//
//  Created by Apprenant 85 on 13/12/2021.
//

import Foundation
import SwiftUI

final class MainViewModel: ObservableObject {
    
    var height: CGFloat = 0
    
    @Published var offset: CGFloat = 0
    @Published var lastOffset: CGFloat = 0
    @Published var activeContent: ActiveContent = .filter
    
    func onChange(_ gestureOffset: CGFloat) {
        DispatchQueue.main.async {
            self.offset = gestureOffset + self.lastOffset
        }
    }
    
    func onEnd() {
        let maxHeight = height - 100
        
        withAnimation {
            if -offset > 100 && -offset < maxHeight / 2 {
                offset = -(maxHeight / 3)
            }
            else if -offset > maxHeight / 2 {
                offset = -maxHeight
            }
            else {
                offset = 0
            }
        }
        
        lastOffset = offset
    }
    
    func getOffset() -> CGFloat {
        let result = -offset > 0 ? -offset <= (height - 100) ? offset : -(height - 100) : 0
        return result
    }
    
    func onEvent(_ value: ActiveContent) {
        activeContent = value
    }
    
    func test() -> CGFloat {
        return offset < (height - 100) ? offset : (height - 100)
    }
}
