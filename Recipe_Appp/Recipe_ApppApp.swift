//
//  Recipe_ApppApp.swift
//  Recipe_Appp
//
//  Created by cloud_vfx on 23/12/21.
//

import SwiftUI

@main
struct Recipe_ApppApp: App {
    var body: some Scene {
        WindowGroup {
          RecipeTabView()
                .environmentObject(ContentModel())
        }
    }
}
