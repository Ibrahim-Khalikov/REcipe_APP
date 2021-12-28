//
//  Module.swift
//  Recipe_Appp
//
//  Created by cloud_vfx on 23/12/21.
//

import Foundation

class Module : Decodable , Identifiable {
    
    var id: UUID?
    var name: String
    var featured: Bool
    var image: String
    var description: String
    var prepTime: String
    var cookTime: String
    var totalTime: String
    var servings: Int
    var highlights: [String]
    var ingredients : [Ingredient]
    var directions: [String]
  
  

class Ingredient : Identifiable , Decodable {
    
    var id: UUID?
    var name: String
    var num: Int?
    var unit: String?
    var denom: Int?
    
}
}
