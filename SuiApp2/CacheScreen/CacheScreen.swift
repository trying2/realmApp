//
//  CacheScreen.swift
//  SuiApp2
//
//  Created by Александр Вяткин on 29.11.2021.
//

import SwiftUI

struct CacheScreen: View {
    
    @StateObject var viewModel: CacheScreeViewModel = .init()
    
    var body: some View {
        VStack {
            Text("Cached Movies")
                .font(.title)
            
            List() {
                ForEach(self.viewModel.movieList) { movie in
                    Text(movie.originalTitle)
                }
            }.listStyle(GroupedListStyle())
        }
    }
}

struct CacheScreen_Previews: PreviewProvider {
    static var previews: some View {
        CacheScreen()
    }
}
