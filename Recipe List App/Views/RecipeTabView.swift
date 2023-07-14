//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Kairat Mynbayev on 14.07.2023.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView {
            Text("Featured View")
            
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            RecipeListView()
                .tabItem {
                    VStack {
                        
                        Image(systemName: "list.bullet")
                        Text("List")
                        
                    }
                }
            
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
