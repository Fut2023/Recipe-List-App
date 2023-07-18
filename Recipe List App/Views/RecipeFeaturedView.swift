//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Kairat Mynbayev on 15.07.2023.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    @State var isDetailViewShowing = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0) {
            
            Text("Featured Recipes")
                .bold().padding( .leading)
                .padding(.top, 40)
                .padding( .leading)
                .font(.largeTitle)
            
            GeometryReader { geo in
                
                TabView {
                    // Loop through each recipe
                    ForEach (0..<model.recipes.count, id: \.self) {index in
                        // Here , id: \.self because: When you use a range in a ForEach without it, it is read initially and never updated, so if you add/remove items from your array (viewModel.recipes in this case), you can run into an index out of range error that will crash your app.
                        
                        // Show only featured
                        if model.recipes[index].featured {
                            
                            Button(action: {
                                // Show the recipe detail sheet
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0) {
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                        // Here it give the right result, without repetitions
                                            .padding(5)
                                    }
                                }
                            })
                            .sheet(isPresented: $isDetailViewShowing, content: {
                                // Show RecipeDetailView
                                RecipeDetailView(recipe: model.recipes[index])
                            })
                            .buttonStyle(.plain)
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment: .center)
                            .cornerRadius(15)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.5), radius: 10, x: -5, y: 5)
                        }
                    }
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation time: ")
                    .font(.headline)
                Text("1 hour")
                Text("Highlights")
                    .font(.headline)
                Text("Healthy, hearty")
                
            }
            .padding([.leading, .bottom])
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
