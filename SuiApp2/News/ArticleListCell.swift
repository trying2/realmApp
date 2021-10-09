//
//  ArticleListCell.swift
//  SuiApp2
//
//  Created by Александр Вяткин on 09.10.2021.
//

import Foundation
import SwiftUI
import AppUI
import NetworkingNews

struct ArticleListCell: View {
    
    @EnvironmentObject var listViewModel: NewsScreenViewModel
    
    var article: Article
    
    var body: some View {
        NavPushButton(destination: NewsArticleScreen(article: article)) {
            buttonLabel
        }
    }
    
    var buttonLabel: some View {
        VStack {
            Text(article.title ?? "no title")
                .onAppear {
                    if listViewModel.articleList.isLast(article) {
                        listViewModel.loadPage()
                    }
                }
            if listViewModel.articleList.isLast(article) && listViewModel.isPageLoading {
                VStack(alignment: .center) {
                    Divider()
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
            }
        }
    }
}
