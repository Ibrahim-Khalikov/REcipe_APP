//
//  ContentView.swift
//  Recipe_Appp
//
//  Created by cloud_vfx on 23/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model : ContentModel
  
    
    var body: some View {
      
        NavigationView{
        VStack(alignment: .leading, spacing: 0){
            
                Text("Recipe List")
                    .font(Font.custom("Avenir Heavy", size: 25))
                    .padding([.top, .leading])
                
                
            ScrollView{
               
                LazyVStack(alignment: .leading){
                
                ForEach(model.recipe){ models in
                   
                   NavigationLink(
                    destination:
                        
                        RecipeView(recipe: models)
                    ,
                    label: {
                        
                        
                        HStack{
                            Image(models.image)
                                .resizable()
                              //  .scaledToFit()
                                .frame(width: 65, height: 65)
                                .cornerRadius(10)
                                .clipShape(Circle())
                            VStack(alignment: .leading, spacing: 3){
                            Text(models.name)
                                    .bold()
                                .padding(.leading,1)
                                .font(Font.custom("Avenir", size: 20))
                                .padding(.leading,10)
                        
                                RecipeHighlights(highlight: models.highlights)
                                    .padding(.leading)
                                    .font(.callout)
                                    .foregroundColor(.gray)
                            }
                        }
                            
                    })
                    
                    
                    
                        
                        
                    
                   }
                }.padding()
            }
            }.foregroundColor(.black)
        .navigationBarHidden(true)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ContentModel())
    }
}
