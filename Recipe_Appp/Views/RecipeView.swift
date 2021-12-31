//
//  RecipeView.swift
//  Recipe_Appp
//
//  Created by cloud_vfx on 23/12/21.
//

import SwiftUI

struct RecipeView: View {
    
    @EnvironmentObject var model :  ContentModel
    @State var selectedServingSize = 2
    
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
                
                
                VStack(alignment: . leading){
                    Text("select your serving size")

                    Picker("", selection: $selectedServingSize){
                    
                    Text("2").tag(2)
                    Text("4").tag(4)
                    Text("6").tag(6)
                    Text("8").tag(8)
                    
                }
                .pickerStyle(SegmentedPickerStyle())
                .frame(width: 160)
                }.padding()
                
                VStack(alignment: .leading){
                    
                    ForEach(recipe.ingredients){ item in
                        
                        Text(ContentModel().getPerTion(ingredient: item, recipeServing: recipe.servings, targerServing: selectedServingSize) + " " + item.name)
                            .font(Font.custom("Avenir", size: 16))
                        
                    }
                }.padding(.leading)
                
                VStack(alignment: .leading, spacing: 14){
                    
                    ForEach(recipe.directions.indices){ item in
                        
                        Text(String(item + 1) + ".  " + recipe.directions[item])
                            .padding(.bottom, 5)
                            .font(Font.custom("Avenir", size: 16))
                        
                           
                        
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
            .environmentObject(ContentModel())
    }
}
