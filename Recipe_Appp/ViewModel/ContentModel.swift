//
//  ContentModel.swift
//  Recipe_Appp
//
//  Created by cloud_vfx on 23/12/21.
//

import Foundation

class ContentModel: Identifiable, ObservableObject {
    
  @Published var recipe = [Module]()
    
    init(){
        ContentModel.getLocaldata()
    }
    
  static func getLocaldata ()-> [Module] {
        
        let urlString = Bundle.main.path(forResource: "recipes", ofType: "json")
        
      guard urlString != nil else {
          return [Module]()
      }
      
        let url = URL(fileURLWithPath: urlString!)
        
        do{
            
            let data = try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
            
            do{
                
                let recipeData = try decoder.decode([Module].self, from: data)
                
                for r in recipeData {
                    r.id = UUID()
                    
                    for i in r.ingredients {
                        i.id = UUID()
                    }
                }
                return recipeData
                
            }
            catch{
                print("no dind")
            }
        }
        catch{
            print("error")
        }
   
      return [Module]()
  }
   
}
