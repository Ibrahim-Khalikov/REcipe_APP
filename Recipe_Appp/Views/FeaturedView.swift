//
//  FeaturedView.swift
//  Recipe_Appp
//
//  Created by cloud_vfx on 29/12/21.
//

import SwiftUI

struct FeaturedView: View {
    
    @EnvironmentObject var model : ContentModel
    @State var tabIndex = false
    @State var tabselectionIndex = 0
    
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            Text("Featured")
                .bold()
                .font(.largeTitle)
                .padding(.leading)
            
            
            GeometryReader{ geo in
            
                TabView(selection: $tabselectionIndex){
             
                ForEach(model.recipe.indices){ index in
                
                    Button {
                        tabIndex = true
                    } label: {
                        
                        ZStack{
                        
                        Rectangle()
                                .foregroundColor(.white)
                            VStack{
                                Image(model.recipe[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .clipped()
                                    
                                
                                Text(model.recipe[index].name)
                                    .bold()
                                    .padding(.bottom, 9)
                                    
                                
                            
                            }
                            
                        
                        }.frame(width: geo.size.width / 1.1, height: geo.size.height / 1.2, alignment: .center)
                                .cornerRadius(20)
                                .shadow(radius: 5)
                                .cornerRadius(10)
                                .shadow(color: Color(.init(srgbRed: 0, green: 0, blue: 0, alpha: 0.5)), radius: 10, x: -5, y: 5)
                            
                    }.sheet(isPresented: $tabIndex){
                        RecipeView(recipe: model.recipe[index])
                    }.buttonStyle(PlainButtonStyle())
                        

                   
                                  
                    
                    
                    
                    
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            
                
            }
                
            VStack(alignment: .leading, spacing: 2){
                
                Text("Preptime")
                    .bold()
                Text(model.recipe[tabselectionIndex].prepTime)
                
                Text("Highlights")
                    .bold()
                RecipeHighlights(highlight: model.recipe[tabselectionIndex].highlights)
                
            }.padding()
            
            
        }
        
       
        
        
    }
}

struct FeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedView()
            .environmentObject(ContentModel())
    }
}
