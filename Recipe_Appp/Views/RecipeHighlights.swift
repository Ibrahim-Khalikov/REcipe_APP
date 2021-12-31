//
//  SwiftUIView.swift
//  Recipe_Appp
//
//  Created by cloud_vfx on 29/12/21.
//

import SwiftUI

struct RecipeHighlights: View {
    
    var allHighlight = ""
    init (highlight: [String]) {
        
        for index in 0..<highlight.count {
            if index == highlight.count-1 {
                allHighlight += highlight[index]
            }
            else {
                allHighlight += highlight[index] + ", "
            }
        }
        
    }
    
    var body: some View {
        
        Text(allHighlight)
    }
    
    
}


