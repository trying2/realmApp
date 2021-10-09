//
//  NewsScreen.swift
//  SuiAPP
//
//  Created by Александр Вяткин on 09.09.2021.
//

import SwiftUI
import NetworkingNews
import AppUI

struct NewsScreen: View {
    @StateObject var viewModel: NewsScreenViewModel = .init()
    
    var listHeader: some View {
        HStack {
            Text("\(viewModel.articleList.count)/\(viewModel.totalResults) (\(viewModel.pageLoadCount)")
        }
    }
    
    var body: some View {
        NavControllerView(transition: .custom(.moveAndFade)) {
            List() {
                Section(header: listHeader) {
                    ForEach(self.viewModel.articleList) { article in
                        ArticleListCell(article: article)
                            .environmentObject(viewModel)
                    }
                }
            }.listStyle(GroupedListStyle())
        }
        
    }
}



struct NewsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreen()
    }
}
