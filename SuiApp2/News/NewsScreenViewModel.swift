//
//  NewsScreenViewModel.swift
//  NewsScreenViewModel
//
//  Created by Александр Вяткин on 16.09.2021.
//

import Foundation
import NetworkingNews

extension Article: Identifiable {
    public var id: String {
        return url
    }
}

final class NewsScreenViewModel: ObservableObject {
    
    // data source
    @Published var articleList: [Article] = .init()
    
    @Published var page: Int = 0
    @Published var isPageLoading: Bool = false
    
    @Published var totalResults: Int = 999
    @Published var pageLoadCount: Int = 0
    
    init() {
        loadPage()
    }
    
    func loadPage() {
        guard isPageLoading == false, articleList.count < totalResults else {
            return
        }
        isPageLoading = true
        page += 1
        ArticlesAPI.everythingGet(q: "ios 15", from: "2021-09-01", sortBy: "publishedAt", language: "ru", apiKey: "a59e5f24831a4322b535578654582973", page: page) { articles, err in
            
            if err != nil {
                print(err)
            }
            self.pageLoadCount += 1
            
            self.articleList.append(contentsOf: articles?.articles ?? [])
            if let totalResults = articles?.totalResults {
                self.totalResults = totalResults
            }
            
            self.isPageLoading = false
        }
    }
}
