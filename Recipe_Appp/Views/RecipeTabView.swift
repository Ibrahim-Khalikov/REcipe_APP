//
//  TabView.swift
//  Recipe_Appp
//
//  Created by cloud_vfx on 25/12/21.
//

import SwiftUI

struct RecipeTabView: View {
    
    @EnvironmentObject var model : ContentModel
    
 //   @State var tabIndex = 0
    
    var body: some View {
        
        TabView {
           ContentView()
            
                .tabItem {
                    VStack{
                        Image(systemName: "list.dash")
                        Text("Tab 1")
                    }
                }
                    
          Text("dsfsdf")
                    
                        .tabItem {
                            VStack{
                                Image(systemName: "folder")
                            }
                        }
        }
      
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
            .environmentObject(ContentModel())
    }
}
