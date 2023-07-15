//
//  RecipeTabView.swift
//  Recipe List App
//
//  Created by Kairat Mynbayev on 14.07.2023.
//

import SwiftUI

struct RecipeTabView: View {
    @State var tabIndex = 2
    // @State variable communicates with $tabIndex, where $ stands for binding
    // This is to know which tab we are in
    
    // The Text field has a similar property
    
    var body: some View {
        
        TabView (selection: $tabIndex) {
            Text("Featured View")
            
                .tabItem {
                    VStack {
                        Image(systemName: "star.fill")
                        Text(String(tabIndex.self) + " is acive")
                    }
                }
                .tag(1)
            // tag allows us to show the specified tab
            
            RecipeListView()
                .tabItem {
                    VStack {
                        
                        Image(systemName: "list.bullet")
                        Text("List")
                        
                    }
                }
                .tag(2)
            
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
