//
//  RecipeView.swift
//  Recipe_Appp
//
//  Created by cloud_vfx on 23/12/21.
//

import SwiftUI

struct RecipeView: View {
    
    @ObservedObject var model = ContentModel()
    var recipe : Module
    
    
    var body: some View {
        
        
        ScrollView{
            
            LazyVStack(alignment: .leading){
                
                Image(String(recipe.image))
                    .resizable()
                    .scaledToFit()
                
                Text(recipe.name)
                    .bold()
                    .font(.largeTitle)
                    .padding([.leading, .bottom] ,11)
                
                VStack(alignment: .leading){
                    
                    ForEach(recipe.ingredients){ item in
                        Text(". " + item.name)
                        
                    }
                }.padding(.leading)
                
                VStack(alignment: .leading, spacing: 14){
                    ForEach(0..<recipe.directions.count, id: \.self){ index in
                        
                        Text(String(index + 1) + ". " + recipe.directions[index])
                           
                        
                    }
                }.padding(11)
            }
        }
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = ContentModel()
        RecipeView(recipe: model.recipe[0])
    }
}
