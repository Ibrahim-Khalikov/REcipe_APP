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
        self.recipe = DataService.getLocaldata()
    }
    
    
func getPerTion (ingredient: Ingredient, recipeServing: Int ,targerServing: Int) -> String {
    
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholeportion = 0
        
        if ingredient.num != nil {
            
            denominator *= recipeServing
            numerator *= targerServing
            
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            
            numerator /= divisor
            denominator /= divisor
            
            
            if numerator >= 0 {
                
                wholeportion = Int(numerator / denominator)
                numerator = numerator % denominator
                portion += String(wholeportion)
                
            }
            
            if numerator >  0 {
                
                portion += wholeportion > 0 ? " " : ""
                portion += "\(numerator)/\(denominator)"
                
            }
        }
        
    if var unit = ingredient.unit {
        
        if wholeportion > 1 {
            
            if unit.suffix(2) == "ch" {
                unit += "es"
            }
            else if unit.suffix(1) == "f" {
                unit = String(unit.dropLast())
                unit += "ves"
            }
            else {
                unit += "s"
            }
            
        }
        
            
        portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
        
        return portion + unit
        
        }
        
        return portion
    }
}
    
    
    
    
    
    
    
    
// //   static func getPortion (ingredient: Ingredient, recipeServings: Int, targetServing: Int) -> String {
//
//        var potion = ""
//        var numerator = ingredient.num ?? 1
//        var denominator = ingredient.denom ?? 1
//        var wholeportion = 0
//
//
//        if ingredient.num != nil {
//            denominator *= recipeServings
//            numerator *= targetServing
//
//            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
//
//            numerator /= divisor
//            denominator /= divisor
//
//            if numerator >= denominator {
//                wholeportion = numerator / denominator
//                numerator = numerator % denominator
//                potion += String(wholeportion)
//            }
//
//            if numerator > 0 {
//                potion += wholeportion > 0 ? " " : ""
//                potion += "\(numerator)/\(denominator)"
//            }
//        }
//        if  var unit = ingredient.unit  {
//
//          if wholeportion > 1 {
//
//              if unit.suffix(2) == "ch" {
//                  unit += "es"
//              }
//              else if unit.suffix(1) == "f" {
//                  unit = String(unit.dropLast())
//                  unit += "ves"
//              }
//              else {
//                  unit += "s"
//              }
//
//          }
//
//
//          portion += ingredient.num == nil && ingredient.denom == nil ? "" : " "
//
//          return portion + unit
//
//          }
//
//        return potion
//
//    }
   
    

